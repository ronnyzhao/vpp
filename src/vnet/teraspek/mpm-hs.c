#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "memory.h"
#include "mpm-hs.h"


#ifdef HAVA_HYPERSCAN

#include <hs.h>

void SCHSInitCtx(MpmCtx *);
void SCHSInitThreadCtx(MpmCtx *, MpmThreadCtx *);
void SCHSDestroyCtx(MpmCtx *);
void SCHSDestroyThreadCtx(MpmCtx *, MpmThreadCtx *);
int SCHSAddPatternCI(MpmCtx *, uint8_t *, uint16_t, uint16_t, uint16_t,
                     uint32_t, sig_id, uint8_t);
int SCHSAddPatternCS(MpmCtx *, uint8_t *, uint16_t, uint16_t, uint16_t,
                     uint32_t, sig_id, uint8_t);
int SCHSPreparePatterns(MpmCtx *mpm_ctx);
uint32_t SCHSSearch(MpmCtx *mpm_ctx, MpmThreadCtx *mpm_thread_ctx,
                    PatternMatcherQueue *pmq, const uint8_t *buf, const uint16_t buflen);
void SCHSPrintInfo(MpmCtx *mpm_ctx);
void SCHSPrintSearchStats(MpmThreadCtx *mpm_thread_ctx);
void SCHSRegisterTests(void);

/* size of the hash table used to speed up pattern insertions initially */
#define INIT_HASH_SIZE 65536

/* Initial size of the global database hash (used for de-duplication). */
#define INIT_DB_HASH_SIZE 1000

/* Global prototype scratch, built incrementally as Hyperscan databases are
 * built and then cloned for each thread context. Access is serialised via
 * g_scratch_proto_mutex. */
static hs_scratch_t *g_scratch_proto = NULL;
static os_lock_t g_scratch_proto_mutex = INIT_MUTEX_VAL;

/* Global hash table of Hyperscan databases, used for de-duplication. Access is
 * serialised via g_db_table_mutex. */
static struct oryx_htable_t  *g_db_table = NULL;
static os_lock_t g_db_table_mutex = INIT_MUTEX_VAL;

#define SCMutexLock(lock)	do_lock(lock)
#define SCMutexUnlock(lock)	do_unlock(lock)
#define HashTableInit oryx_htable_init



/*
-------------------------------------------------------------------------------
hashlittle_safe() -- hash a variable-length key into a 32-bit value
  k       : the key (the unaligned variable-length array of bytes)
  length  : the length of the key, counting by bytes
  initval : can be any 4-byte value
Returns a 32-bit value.  Every bit of the key affects every bit of
the return value.  Two keys differing by one or two bits will have
totally different hash values.

The best hash table sizes are powers of 2.  There is no need to do
mod a prime (mod is sooo slow!).  If you need less than 32 bits,
use a bitmask.  For example, if you need only 10 bits, do
  h = (h & hashmask(10));
In which case, the hash table should have hashsize(10) elements.

If you are hashing n strings (uint8_t **)k, do it like this:
  for (i=0, h=0; i<n; ++i) h = hashlittle( k[i], len[i], h);

By Bob Jenkins, 2006.  bob_jenkins@burtleburtle.net.  You may use this
code any way you wish, private, educational, or commercial.  It's free.

This version has been modified from hashlittle() above to avoid accesses beyond
the last byte of the key, which causes warnings from Valgrind and Address
Sanitizer.

Use for hash table lookup, or anything where one collision in 2^^32 is
acceptable.  Do NOT use for cryptographic purposes.
-------------------------------------------------------------------------------
*/

uint32_t hashlittle_safe(const void *key, size_t length, uint32_t initval)
{
  uint32_t a,b,c;                                          /* internal state */
  union { const void *ptr; size_t i; } u;     /* needed for Mac Powerbook G4 */

  /* Set up the internal state */
  a = b = c = 0xdeadbeef + ((uint32_t)length) + initval;

  u.ptr = key;
  if (HASH_LITTLE_ENDIAN && ((u.i & 0x3) == 0)) {
    const uint32_t *k = (const uint32_t *)key;         /* read 32-bit chunks */

    /*------ all but last block: aligned reads and affect 32 bits of (a,b,c) */
    while (length > 12)
    {
      a += k[0];
      b += k[1];
      c += k[2];
      mix(a,b,c);
      length -= 12;
      k += 3;
    }

    /*----------------------------- handle the last (probably partial) block */
    /*
     * Note that unlike hashlittle() above, we use the "safe" version of this
     * block that is #ifdef VALGRIND above, in order to avoid warnings from
     * Valgrind or Address Sanitizer.
     */

    const uint8_t  *k8 = (const uint8_t *)k;

    switch(length)
    {
    case 12: c+=k[2]; b+=k[1]; a+=k[0]; break;
    case 11: c+=((uint32_t)k8[10])<<16;  /* fall through */
    case 10: c+=((uint32_t)k8[9])<<8;    /* fall through */
    case 9 : c+=k8[8];                   /* fall through */
    case 8 : b+=k[1]; a+=k[0]; break;
    case 7 : b+=((uint32_t)k8[6])<<16;   /* fall through */
    case 6 : b+=((uint32_t)k8[5])<<8;    /* fall through */
    case 5 : b+=k8[4];                   /* fall through */
    case 4 : a+=k[0]; break;
    case 3 : a+=((uint32_t)k8[2])<<16;   /* fall through */
    case 2 : a+=((uint32_t)k8[1])<<8;    /* fall through */
    case 1 : a+=k8[0]; break;
    case 0 : return c;
    }
  } else if (HASH_LITTLE_ENDIAN && ((u.i & 0x1) == 0)) {
    const uint16_t *k = (const uint16_t *)key;         /* read 16-bit chunks */
    const uint8_t  *k8;

    /*--------------- all but last block: aligned reads and different mixing */
    while (length > 12)
    {
      a += k[0] + (((uint32_t)k[1])<<16);
      b += k[2] + (((uint32_t)k[3])<<16);
      c += k[4] + (((uint32_t)k[5])<<16);
      mix(a,b,c);
      length -= 12;
      k += 6;
    }

    /*----------------------------- handle the last (probably partial) block */
    k8 = (const uint8_t *)k;
    switch(length)
    {
    case 12: c+=k[4]+(((uint32_t)k[5])<<16);
             b+=k[2]+(((uint32_t)k[3])<<16);
             a+=k[0]+(((uint32_t)k[1])<<16);
             break;
    case 11: c+=((uint32_t)k8[10])<<16;     /* fall through */
    case 10: c+=k[4];
             b+=k[2]+(((uint32_t)k[3])<<16);
             a+=k[0]+(((uint32_t)k[1])<<16);
             break;
    case 9 : c+=k8[8];                      /* fall through */
    case 8 : b+=k[2]+(((uint32_t)k[3])<<16);
             a+=k[0]+(((uint32_t)k[1])<<16);
             break;
    case 7 : b+=((uint32_t)k8[6])<<16;      /* fall through */
    case 6 : b+=k[2];
             a+=k[0]+(((uint32_t)k[1])<<16);
             break;
    case 5 : b+=k8[4];                      /* fall through */
    case 4 : a+=k[0]+(((uint32_t)k[1])<<16);
             break;
    case 3 : a+=((uint32_t)k8[2])<<16;      /* fall through */
    case 2 : a+=k[0];
             break;
    case 1 : a+=k8[0];
             break;
    case 0 : return c;                     /* zero length requires no mixing */
    }

  } else {                        /* need to read the key one byte at a time */
    const uint8_t *k = (const uint8_t *)key;

    /*--------------- all but the last block: affect some 32 bits of (a,b,c) */
    while (length > 12)
    {
      a += k[0];
      a += ((uint32_t)k[1])<<8;
      a += ((uint32_t)k[2])<<16;
      a += ((uint32_t)k[3])<<24;
      b += k[4];
      b += ((uint32_t)k[5])<<8;
      b += ((uint32_t)k[6])<<16;
      b += ((uint32_t)k[7])<<24;
      c += k[8];
      c += ((uint32_t)k[9])<<8;
      c += ((uint32_t)k[10])<<16;
      c += ((uint32_t)k[11])<<24;
      mix(a,b,c);
      length -= 12;
      k += 12;
    }

    /*-------------------------------- last block: affect all 32 bits of (c) */
    switch(length)                   /* all the case statements fall through */
    {
    case 12: c+=((uint32_t)k[11])<<24;  /* fall through */
    case 11: c+=((uint32_t)k[10])<<16;  /* fall through */
    case 10: c+=((uint32_t)k[9])<<8;    /* fall through */
    case 9 : c+=k[8];                   /* fall through */
    case 8 : b+=((uint32_t)k[7])<<24;   /* fall through */
    case 7 : b+=((uint32_t)k[6])<<16;   /* fall through */
    case 6 : b+=((uint32_t)k[5])<<8;    /* fall through */
    case 5 : b+=k[4];                   /* fall through */
    case 4 : a+=((uint32_t)k[3])<<24;   /* fall through */
    case 3 : a+=((uint32_t)k[2])<<16;   /* fall through */
    case 2 : a+=((uint32_t)k[1])<<8;    /* fall through */
    case 1 : a+=k[0];
             break;
    case 0 : return c;
    }
  }

  final(a,b,c);
  return c;
}


/**
 * \internal
 * \brief Convert a pattern into a regex string accepted by the Hyperscan
 * compiler.
 *
 * For simplicity, we just take each byte of the original pattern and render it
 * with a hex escape (i.e. ' ' -> "\x20")/
 */
char *HSRenderPattern(const uint8_t *pat, uint16_t pat_len)
{
    if (pat == NULL) {
        return NULL;
    }
    const size_t hex_len = (pat_len * 4) + 1;
    char *str = SCMalloc(hex_len);
    if (str == NULL) {
        return NULL;
    }
    memset(str, 0, hex_len);
    char *sp = str;
    for (uint16_t i = 0; i < pat_len; i++) {
        snprintf(sp, 5, "\\x%02x", pat[i]);
        sp += 4;
    }
    *sp = '\0';
    return str;
}

/**
 * \internal
 * \brief Wraps SCMalloc (which is a macro) so that it can be passed to
 * hs_set_allocator() for Hyperscan's use.
 */
static void *SCHSMalloc(size_t size)
{
    return SCMalloc(size);
}

/**
 * \internal
 * \brief Wraps SCFree (which is a macro) so that it can be passed to
 * hs_set_allocator() for Hyperscan's use.
 */
static void SCHSFree(void *ptr)
{
    SCFree(ptr);
}

/** \brief Register Suricata malloc/free with Hyperscan.
 *
 * Requests that Hyperscan use Suricata's allocator for allocation of
 * databases, scratch space, etc.
 */
static void SCHSSetAllocators(void)
{
    hs_error_t err = hs_set_allocator(SCHSMalloc, SCHSFree);
    if (err != HS_SUCCESS) {
        printf("Failed to set Hyperscan allocator.");
        exit(EXIT_FAILURE);
    }
}

/**
 * \internal
 * \brief Creates a hash of the pattern.  We use it for the hashing process
 *        during the initial pattern insertion time, to cull duplicate sigs.
 *
 * \param pat    Pointer to the pattern.
 * \param patlen Pattern length.
 *
 * \retval hash A 32 bit unsigned hash.
 */
static inline uint32_t SCHSInitHashRaw(uint8_t *pat, uint16_t patlen)
{
    uint32_t hash = patlen * pat[0];
    if (patlen > 1)
        hash += pat[1];

    return (hash % INIT_HASH_SIZE);
}

/**
 * \internal
 * \brief Looks up a pattern.  We use it for the hashing process during
 *        the initial pattern insertion time, to cull duplicate sigs.
 *
 * \param ctx    Pointer to the HS ctx.
 * \param pat    Pointer to the pattern.
 * \param patlen Pattern length.
 * \param flags  Flags.  We don't need this.
 *
 * \retval hash A 32 bit unsigned hash.
 */
static inline SCHSPattern *SCHSInitHashLookup(SCHSCtx *ctx, uint8_t *pat,
                                              uint16_t patlen, uint16_t offset,
                                              uint16_t depth, char __oryx_unused__ flags,
                                              uint32_t pid)
{
    uint32_t hash = SCHSInitHashRaw(pat, patlen);

    if (ctx->init_hash == NULL) {
        return NULL;
    }

    SCHSPattern *t = ctx->init_hash[hash];
    for (; t != NULL; t = t->next) {
        /* Since Hyperscan uses offset/depth, we must distinguish between
         * patterns with the same ID but different offset/depth here. */
        if (t->id == pid && t->offset == offset && t->depth == depth) {
            BUG_ON(t->len != patlen);
            BUG_ON(memcmp(t->original_pat, pat, patlen) != 0);
            return t;
        }
    }

    return NULL;
}

/**
 * \internal
 * \brief Allocates a new pattern instance.
 *
 * \param mpm_ctx Pointer to the mpm context.
 *
 * \retval p Pointer to the newly created pattern.
 */
static inline SCHSPattern *SCHSAllocPattern(MpmCtx *mpm_ctx)
{
    SCHSPattern *p = SCMalloc(sizeof(SCHSPattern));
    if (unlikely(p == NULL)) {
        exit(EXIT_FAILURE);
    }
    memset(p, 0, sizeof(SCHSPattern));

    mpm_ctx->memory_cnt++;
    mpm_ctx->memory_size += sizeof(SCHSPattern);

    return p;
}

/**
 * \internal
 * \brief Used to free SCHSPattern instances.
 *
 * \param mpm_ctx Pointer to the mpm context.
 * \param p       Pointer to the SCHSPattern instance to be freed.
 * \param free    Free the above pointer or not.
 */
static inline void SCHSFreePattern(MpmCtx *mpm_ctx, SCHSPattern *p)
{
    if (p != NULL && p->original_pat != NULL) {
        SCFree(p->original_pat);
        mpm_ctx->memory_cnt--;
        mpm_ctx->memory_size -= p->len;
    }

    if (p != NULL && p->sids != NULL) {
        SCFree(p->sids);
    }

    if (p != NULL) {
        SCFree(p);
        mpm_ctx->memory_cnt--;
        mpm_ctx->memory_size -= sizeof(SCHSPattern);
    }
}

static inline uint32_t SCHSInitHash(SCHSPattern *p)
{
    uint32_t hash = p->len * p->original_pat[0];
    if (p->len > 1)
        hash += p->original_pat[1];

    return (hash % INIT_HASH_SIZE);
}

static inline int SCHSInitHashAdd(SCHSCtx *ctx, SCHSPattern *p)
{
    uint32_t hash = SCHSInitHash(p);

    if (ctx->init_hash == NULL) {
        return 0;
    }

    if (ctx->init_hash[hash] == NULL) {
        ctx->init_hash[hash] = p;
        return 0;
    }

    SCHSPattern *tt = NULL;
    SCHSPattern *t = ctx->init_hash[hash];

    /* get the list tail */
    do {
        tt = t;
        t = t->next;
    } while (t != NULL);

    tt->next = p;

    return 0;
}

/**
 * \internal
 * \brief Add a pattern to the mpm-hs context.
 *
 * \param mpm_ctx Mpm context.
 * \param pat     Pointer to the pattern.
 * \param patlen  Length of the pattern.
 * \param pid     Pattern id
 * \param sid     Signature id (internal id).
 * \param flags   Pattern's MPM_PATTERN_* flags.
 *
 * \retval  0 On success.
 * \retval -1 On failure.
 */
static int SCHSAddPattern(MpmCtx *mpm_ctx, uint8_t *pat, uint16_t patlen,
                          uint16_t offset, uint16_t depth, uint32_t pid,
                          sig_id sid, uint8_t flags)
{
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;

    if (offset != 0) {
        flags |= MPM_PATTERN_FLAG_OFFSET;
    }
    if (depth != 0) {
        flags |= MPM_PATTERN_FLAG_DEPTH;
    }

    if (patlen == 0) {
        printf("pattern length 0\n");
        return 0;
    }

    /* check if we have already inserted this pattern */
    SCHSPattern *p =
        SCHSInitHashLookup(ctx, pat, patlen, offset, depth, flags, pid);
    if (p == NULL) {
#ifdef MPM_DEBUG
        printf ("Allocing new pattern\n");
#endif

        /* p will never be NULL */
        p = SCHSAllocPattern(mpm_ctx);

        p->len = patlen;
        p->flags = flags;
        p->id = pid;

        p->offset = offset;
        p->depth = depth;

        p->original_pat = SCMalloc(patlen);
        if (p->original_pat == NULL)
            goto error;
        mpm_ctx->memory_cnt++;
        mpm_ctx->memory_size += patlen;
        memcpy(p->original_pat, pat, patlen);

        /* put in the pattern hash */
        SCHSInitHashAdd(ctx, p);

        mpm_ctx->pattern_cnt++;

        if (mpm_ctx->maxlen < patlen)
            mpm_ctx->maxlen = patlen;

        if (mpm_ctx->minlen == 0) {
            mpm_ctx->minlen = patlen;
        } else {
            if (mpm_ctx->minlen > patlen)
                mpm_ctx->minlen = patlen;
        }

        p->sids_size = 1;
        p->sids = SCMalloc(p->sids_size * sizeof(sig_id));
        BUG_ON(p->sids == NULL);
        p->sids[0] = sid;
    } else {
        /* TODO figure out how we can be called multiple times for the same CTX with the same sid */

        int found = 0;
        uint32_t x = 0;
        for (x = 0; x < p->sids_size; x++) {
            if (p->sids[x] == sid) {
                found = 1;
                break;
            }
        }
        if (!found) {
            sig_id *sids = krealloc(p->sids, (sizeof(sig_id) * (p->sids_size + 1)), MPF_NOFLGS, __oryx_unused_val__);
            BUG_ON(sids == NULL);
            p->sids = sids;
            p->sids[p->sids_size] = sid;
            p->sids_size++;
        }
    }

    return 0;

error:
    SCHSFreePattern(mpm_ctx, p);
    return -1;
}

/**
 * \brief Pattern database information used only as input to the Hyperscan
 * compiler.
 */
typedef struct SCHSCompileData_ {
    unsigned int *ids;
    unsigned int *flags;
    char **expressions;
    hs_expr_ext_t **ext;
    unsigned int pattern_cnt;
} SCHSCompileData;

static SCHSCompileData *SCHSAllocCompileData(unsigned int pattern_cnt)
{
    SCHSCompileData *cd = SCMalloc(pattern_cnt * sizeof(SCHSCompileData));
    if (cd == NULL) {
        goto error;
    }
    memset(cd, 0, pattern_cnt * sizeof(SCHSCompileData));

    cd->pattern_cnt = pattern_cnt;

    cd->ids = SCMalloc(pattern_cnt * sizeof(unsigned int));
    if (cd->ids == NULL) {
        goto error;
    }
    memset(cd->ids, 0, pattern_cnt * sizeof(unsigned int));

    cd->flags = SCMalloc(pattern_cnt * sizeof(unsigned int));
    if (cd->flags == NULL) {
        goto error;
    }
    memset(cd->flags, 0, pattern_cnt * sizeof(unsigned int));

    cd->expressions = SCMalloc(pattern_cnt * sizeof(char *));
    if (cd->expressions == NULL) {
        goto error;
    }
    memset(cd->expressions, 0, pattern_cnt * sizeof(char *));

    cd->ext = SCMalloc(pattern_cnt * sizeof(hs_expr_ext_t *));
    if (cd->ext == NULL) {
        goto error;
    }
    memset(cd->ext, 0, pattern_cnt * sizeof(hs_expr_ext_t *));

    return cd;

error:
    printf("SCHSCompileData alloc failed\n");
    if (cd) {
        SCFree(cd->ids);
        SCFree(cd->flags);
        SCFree(cd->expressions);
        SCFree(cd->ext);
        SCFree(cd);
    }
    return NULL;
}

static void SCHSFreeCompileData(SCHSCompileData *cd)
{
    if (cd == NULL) {
        return;
    }

    SCFree(cd->ids);
    SCFree(cd->flags);
    if (cd->expressions) {
        for (unsigned int i = 0; i < cd->pattern_cnt; i++) {
            SCFree(cd->expressions[i]);
        }
        SCFree(cd->expressions);
    }
    if (cd->ext) {
        for (unsigned int i = 0; i < cd->pattern_cnt; i++) {
            SCFree(cd->ext[i]);
        }
        SCFree(cd->ext);
    }
    SCFree(cd);
}

typedef struct PatternDatabase_ {
    SCHSPattern **parray;
    hs_database_t *hs_db;
    uint32_t pattern_cnt;

    /* Reference count: number of MPM contexts using this pattern database. */
    uint32_t ref_cnt;
} PatternDatabase;

static uint32_t SCHSPatternHash(const SCHSPattern *p, uint32_t hash)
{
    BUG_ON(p->original_pat == NULL);
    BUG_ON(p->sids == NULL);

    hash = hashlittle_safe(&p->len, sizeof(p->len), hash);
    hash = hashlittle_safe(&p->flags, sizeof(p->flags), hash);
    hash = hashlittle_safe(p->original_pat, p->len, hash);
    hash = hashlittle_safe(&p->id, sizeof(p->id), hash);
    hash = hashlittle_safe(&p->offset, sizeof(p->offset), hash);
    hash = hashlittle_safe(&p->depth, sizeof(p->depth), hash);
    hash = hashlittle_safe(&p->sids_size, sizeof(p->sids_size), hash);
    hash = hashlittle_safe(p->sids, p->sids_size * sizeof(sig_id), hash);
    return hash;
}

static char SCHSPatternCompare(const SCHSPattern *p1, const SCHSPattern *p2)
{
    if ((p1->len != p2->len) || (p1->flags != p2->flags) ||
        (p1->id != p2->id) || (p1->offset != p2->offset) ||
        (p1->depth != p2->depth) || (p1->sids_size != p2->sids_size)) {
        return 0;
    }

    if (memcmp(p1->original_pat, p2->original_pat, p1->len) != 0) {
        return 0;
    }

    if (memcmp(p1->sids, p2->sids, p1->sids_size * sizeof(p1->sids[0])) !=
        0) {
        return 0;
    }

    return 1;
}

static uint32_t PatternDatabaseHash(struct oryx_htable_t *ht, void *data, uint16_t __oryx_unused__ len)
{
    const PatternDatabase *pd = data;
    uint32_t hash = 0;
    hash = hashword(&pd->pattern_cnt, 1, hash);

    for (uint32_t i = 0; i < pd->pattern_cnt; i++) {
        hash = SCHSPatternHash(pd->parray[i], hash);
    }

    hash %= ht->array_size;
    return hash;
}

static int PatternDatabaseCompare(void *data1, uint16_t __oryx_unused__ len1, void *data2,
                                   uint16_t __oryx_unused__ len2)
{
    const PatternDatabase *pd1 = data1;
    const PatternDatabase *pd2 = data2;

    if (pd1->pattern_cnt != pd2->pattern_cnt) {
        return 0;
    }

    for (uint32_t i = 0; i < pd1->pattern_cnt; i++) {
        if (SCHSPatternCompare(pd1->parray[i], pd2->parray[i]) == 0) {
            return 1;
        }
    }

    return 0;
}

static void PatternDatabaseFree(PatternDatabase *pd)
{
    BUG_ON(pd->ref_cnt != 0);

    if (pd->parray != NULL) {
        for (uint32_t i = 0; i < pd->pattern_cnt; i++) {
            SCHSPattern *p = pd->parray[i];
            if (p != NULL) {
                SCFree(p->original_pat);
                SCFree(p->sids);
                SCFree(p);
            }
        }
        SCFree(pd->parray);
    }

    hs_free_database(pd->hs_db);

    SCFree(pd);
}

static void PatternDatabaseTableFree(void __oryx_unused__*data)
{
    /* Stub function handed to hash table; actual freeing of PatternDatabase
     * structures is done in MPM destruction when the ref_cnt drops to zero. */
}

static PatternDatabase *PatternDatabaseAlloc(uint32_t pattern_cnt)
{
    PatternDatabase *pd = SCMalloc(sizeof(PatternDatabase));
    if (pd == NULL) {
        return NULL;
    }
    memset(pd, 0, sizeof(PatternDatabase));
    pd->pattern_cnt = pattern_cnt;
    pd->ref_cnt = 0;
    pd->hs_db = NULL;

    /* alloc the pattern array */
    pd->parray =
        (SCHSPattern **)SCMalloc(pd->pattern_cnt * sizeof(SCHSPattern *));
    if (pd->parray == NULL) {
        SCFree(pd);
        return NULL;
    }
    memset(pd->parray, 0, pd->pattern_cnt * sizeof(SCHSPattern *));

    return pd;
}

/**
 * \brief Process the patterns added to the mpm, and create the internal tables.
 *
 * \param mpm_ctx Pointer to the mpm context.
 */
int SCHSPreparePatterns(MpmCtx *mpm_ctx)
{
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;

    if (mpm_ctx->pattern_cnt == 0 || ctx->init_hash == NULL) {
        printf("no patterns supplied to this mpm_ctx\n");
        return 0;
    }

    hs_error_t err;
    hs_compile_error_t *compile_err = NULL;
    SCHSCompileData *cd = NULL;
    PatternDatabase *pd = NULL;

    cd = SCHSAllocCompileData(mpm_ctx->pattern_cnt);
    if (cd == NULL) {
        goto error;
    }

    pd = PatternDatabaseAlloc(mpm_ctx->pattern_cnt);
    if (pd == NULL) {
        goto error;
    }

    /* populate the pattern array with the patterns in the hash */
    for (uint32_t i = 0, p = 0; i < INIT_HASH_SIZE; i++) {
        SCHSPattern *node = ctx->init_hash[i], *nnode = NULL;
        while (node != NULL) {
            nnode = node->next;
            node->next = NULL;
            pd->parray[p++] = node;
            node = nnode;
        }
    }

    /* we no longer need the hash, so free its memory */
    SCFree(ctx->init_hash);
    ctx->init_hash = NULL;

    /* Serialise whole database compilation as a relatively easy way to ensure
     * dedupe is safe. */
    SCMutexLock(&g_db_table_mutex);

    /* Init global pattern database hash if necessary. */
    if (g_db_table == NULL) {
        g_db_table = HashTableInit(INIT_DB_HASH_SIZE, PatternDatabaseHash,
                                   PatternDatabaseCompare,
                                   PatternDatabaseTableFree);
        if (g_db_table == NULL) {
            SCMutexUnlock(&g_db_table_mutex);
            goto error;
        }
    }

    /* Check global hash table to see if we've seen this pattern database
     * before, and reuse the Hyperscan database if so. */
    PatternDatabase *pd_cached = oryx_htable_lookup(g_db_table, pd, 1);

    if (pd_cached != NULL) {
        printf("Reusing cached database %p with %" PRIu32
                   " patterns (ref_cnt=%" PRIu32 ")\n",
                   pd_cached->hs_db, pd_cached->pattern_cnt,
                   pd_cached->ref_cnt);
        pd_cached->ref_cnt++;
        ctx->pattern_db = pd_cached;
        SCMutexUnlock(&g_db_table_mutex);
        PatternDatabaseFree(pd);
        SCHSFreeCompileData(cd);
        return 0;
    }

    BUG_ON(ctx->pattern_db != NULL); /* already built? */

    for (uint32_t i = 0; i < pd->pattern_cnt; i++) {
        const SCHSPattern *p = pd->parray[i];

        cd->ids[i] = i;
        cd->flags[i] = HS_FLAG_SINGLEMATCH;
        if (p->flags & MPM_PATTERN_FLAG_NOCASE) {
            cd->flags[i] |= HS_FLAG_CASELESS;
        }

        cd->expressions[i] = HSRenderPattern(p->original_pat, p->len);

        if (p->flags & (MPM_PATTERN_FLAG_OFFSET | MPM_PATTERN_FLAG_DEPTH)) {
            cd->ext[i] = SCMalloc(sizeof(hs_expr_ext_t));
            if (cd->ext[i] == NULL) {
                SCMutexUnlock(&g_db_table_mutex);
                goto error;
            }
            memset(cd->ext[i], 0, sizeof(hs_expr_ext_t));

            if (p->flags & MPM_PATTERN_FLAG_OFFSET) {
                cd->ext[i]->flags |= HS_EXT_FLAG_MIN_OFFSET;
                cd->ext[i]->min_offset = p->offset + p->len;
            }
            if (p->flags & MPM_PATTERN_FLAG_DEPTH) {
                cd->ext[i]->flags |= HS_EXT_FLAG_MAX_OFFSET;
                cd->ext[i]->max_offset = p->offset + p->depth;
            }
        }
    }

    BUG_ON(mpm_ctx->pattern_cnt == 0);

    err = hs_compile_ext_multi((const char *const *)cd->expressions, cd->flags,
                               cd->ids, (const hs_expr_ext_t *const *)cd->ext,
                               cd->pattern_cnt, HS_MODE_BLOCK, NULL, &pd->hs_db,
                               &compile_err);

    if (err != HS_SUCCESS) {
        printf( "failed to compile hyperscan database\n");
        if (compile_err) {
            printf( "compile error: %s\n", compile_err->message);
        }
        hs_free_compile_error(compile_err);
        SCMutexUnlock(&g_db_table_mutex);
        goto error;
    }

    ctx->pattern_db = pd;

    SCMutexLock(&g_scratch_proto_mutex);
    err = hs_alloc_scratch(pd->hs_db, &g_scratch_proto);
    SCMutexUnlock(&g_scratch_proto_mutex);
    if (err != HS_SUCCESS) {
        printf( "%s***Failed to allocate scratch%s\n", draw_color(COLOR_RED), draw_color(COLOR_FIN));
        SCMutexUnlock(&g_db_table_mutex);
        goto error;
    }

    err = hs_database_size(pd->hs_db, &ctx->hs_db_size);
    if (err != HS_SUCCESS) {
        printf( "%s***Failed to query database size%s\n", draw_color(COLOR_RED), draw_color(COLOR_FIN));
        SCMutexUnlock(&g_db_table_mutex);
        goto error;
    }

    mpm_ctx->memory_cnt++;
    mpm_ctx->memory_size += ctx->hs_db_size;

    printf("Built %" PRIu32 " patterns into a database of size %" PRIuMAX
               " bytes\n", mpm_ctx->pattern_cnt, (uintmax_t)ctx->hs_db_size);

    /* Cache this database globally for later. */
    pd->ref_cnt = 1;
    oryx_htable_add(g_db_table, pd, 1);
    SCMutexUnlock(&g_db_table_mutex);

    SCHSFreeCompileData(cd);
    return 0;

error:
    if (pd) {
        PatternDatabaseFree(pd);
    }
    if (cd) {
        SCHSFreeCompileData(cd);
    }
    return -1;
}

/**
 * \brief Init the mpm thread context.
 *
 * \param mpm_ctx        Pointer to the mpm context.
 * \param mpm_thread_ctx Pointer to the mpm thread context.
 */
void SCHSInitThreadCtx(MpmCtx __oryx_unused__ *mpm_ctx, MpmThreadCtx *mpm_thread_ctx)
{
    memset(mpm_thread_ctx, 0, sizeof(MpmThreadCtx));

    SCHSThreadCtx *ctx = SCMalloc(sizeof(SCHSThreadCtx));
    if (ctx == NULL) {
        exit(EXIT_FAILURE);
    }
    mpm_thread_ctx->ctx = ctx;

    memset(ctx, 0, sizeof(SCHSThreadCtx));
    mpm_thread_ctx->memory_cnt++;
    mpm_thread_ctx->memory_size += sizeof(SCHSThreadCtx);

    ctx->scratch = NULL;
    ctx->scratch_size = 0;

    SCMutexLock(&g_scratch_proto_mutex);

    if (g_scratch_proto == NULL) {
        /* There is no scratch prototype: this means that we have not compiled
         * any Hyperscan databases. */
        SCMutexUnlock(&g_scratch_proto_mutex);
        printf("%s***No scratch space prototype%s\n", draw_color(COLOR_RED), draw_color(COLOR_FIN));
        return;
    }

    hs_error_t err = hs_clone_scratch(g_scratch_proto,
                                      (hs_scratch_t **)&ctx->scratch);

    SCMutexUnlock(&g_scratch_proto_mutex);

    if (err != HS_SUCCESS) {
        printf( "Unable to clone scratch prototype\n");
        exit(EXIT_FAILURE);
    }

    err = hs_scratch_size(ctx->scratch, &ctx->scratch_size);
    if (err != HS_SUCCESS) {
        printf( "Unable to query scratch size\n");
        exit(EXIT_FAILURE);
    }

    mpm_thread_ctx->memory_cnt++;
    mpm_thread_ctx->memory_size += ctx->scratch_size;
}

/**
 * \brief Initialize the HS context.
 *
 * \param mpm_ctx       Mpm context.
 */
void SCHSInitCtx(MpmCtx *mpm_ctx)
{
    if (mpm_ctx->ctx != NULL)
        return;

    mpm_ctx->ctx = SCMalloc(sizeof(SCHSCtx));
    if (mpm_ctx->ctx == NULL) {
        exit(EXIT_FAILURE);
    }
    memset(mpm_ctx->ctx, 0, sizeof(SCHSCtx));

    mpm_ctx->memory_cnt++;
    mpm_ctx->memory_size += sizeof(SCHSCtx);

    /* initialize the hash we use to speed up pattern insertions */
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;
    ctx->init_hash = SCMalloc(sizeof(SCHSPattern *) * INIT_HASH_SIZE);
    if (ctx->init_hash == NULL) {
        exit(EXIT_FAILURE);
    }
    memset(ctx->init_hash, 0, sizeof(SCHSPattern *) * INIT_HASH_SIZE);
}

/**
 * \brief Destroy the mpm thread context.
 *
 * \param mpm_ctx        Pointer to the mpm context.
 * \param mpm_thread_ctx Pointer to the mpm thread context.
 */
void SCHSDestroyThreadCtx(MpmCtx __oryx_unused__*mpm_ctx, MpmThreadCtx *mpm_thread_ctx)
{
    SCHSPrintSearchStats(mpm_thread_ctx);

    if (mpm_thread_ctx->ctx != NULL) {
        SCHSThreadCtx *thr_ctx = (SCHSThreadCtx *)mpm_thread_ctx->ctx;

        if (thr_ctx->scratch != NULL) {
            hs_free_scratch(thr_ctx->scratch);
            mpm_thread_ctx->memory_cnt--;
            mpm_thread_ctx->memory_size -= thr_ctx->scratch_size;
        }

        SCFree(mpm_thread_ctx->ctx);
        mpm_thread_ctx->ctx = NULL;
        mpm_thread_ctx->memory_cnt--;
        mpm_thread_ctx->memory_size -= sizeof(SCHSThreadCtx);
    }
}

/**
 * \brief Destroy the mpm context.
 *
 * \param mpm_ctx Pointer to the mpm context.
 */
void SCHSDestroyCtx(MpmCtx *mpm_ctx)
{
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;
    if (ctx == NULL)
        return;

    if (ctx->init_hash != NULL) {
        SCFree(ctx->init_hash);
        ctx->init_hash = NULL;
        mpm_ctx->memory_cnt--;
        mpm_ctx->memory_size -= (INIT_HASH_SIZE * sizeof(SCHSPattern *));
    }

    /* Decrement pattern database ref count, and delete it entirely if the
     * count has dropped to zero. */
    SCMutexLock(&g_db_table_mutex);
    PatternDatabase *pd = ctx->pattern_db;
    if (pd) {
        BUG_ON(pd->ref_cnt == 0);
        pd->ref_cnt--;
        if (pd->ref_cnt == 0) {
            oryx_htable_del(g_db_table, pd, 1);
            PatternDatabaseFree(pd);
        }
    }
    SCMutexUnlock(&g_db_table_mutex);

    SCFree(mpm_ctx->ctx);
    mpm_ctx->memory_cnt--;
    mpm_ctx->memory_size -= sizeof(SCHSCtx);
}

typedef struct SCHSCallbackCtx_ {
    SCHSCtx *ctx;
    void *pmq;
    uint32_t match_count;
} SCHSCallbackCtx;

/* Hyperscan MPM match event handler */
static int SCHSMatchEvent(unsigned int id, unsigned long long __oryx_unused__ from,
                          unsigned long long __oryx_unused__ to, unsigned int __oryx_unused__ flags,
                          void *ctx)
{
    SCHSCallbackCtx *cctx = ctx;
    PatternMatcherQueue *pmq = cctx->pmq;
    const PatternDatabase *pd = cctx->ctx->pattern_db;
    const SCHSPattern *pat = pd->parray[id];
#if 0
    printf("Hyperscan Match %" PRIu32 ": id=%" PRIu32 " @ %" PRIuMAX
               " (pat id=%" PRIu32 ")\n",
               cctx->match_count, (uint32_t)id, (uintmax_t)to, pat->id);
#endif
    MpmAddSids(pmq, pat->sids, pat->sids_size);

    cctx->match_count++;
    return 0;
}

/**
 * \brief The Hyperscan search function.
 *
 * \param mpm_ctx        Pointer to the mpm context.
 * \param mpm_thread_ctx Pointer to the mpm thread context.
 * \param pmq            Pointer to the Pattern Matcher Queue to hold
 *                       search matches.
 * \param buf            Buffer to be searched.
 * \param buflen         Buffer length.
 *
 * \retval matches Match count.
 */
uint32_t SCHSSearch(MpmCtx *mpm_ctx, MpmThreadCtx *mpm_thread_ctx,
                    PatternMatcherQueue *pmq, const uint8_t *buf, const uint16_t buflen)
{
    uint32_t ret = 0;
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;
    SCHSThreadCtx *hs_thread_ctx = (SCHSThreadCtx *)(mpm_thread_ctx->ctx);
    const PatternDatabase *pd = ctx->pattern_db;

    if (unlikely(buflen == 0)) {
        return 0;
    }

    SCHSCallbackCtx cctx = {
		.ctx = ctx, 
		.pmq = pmq, 
		.match_count = 0
    };

    /* scratch should have been cloned from g_scratch_proto at thread init. */
    hs_scratch_t *scratch = hs_thread_ctx->scratch;
    BUG_ON(pd->hs_db == NULL);
    BUG_ON(scratch == NULL);

    hs_error_t err = hs_scan(pd->hs_db, (const char *)buf, buflen, 0, scratch,
                             SCHSMatchEvent, &cctx);	
    if (err != HS_SUCCESS) {
        /* An error value (other than HS_SCAN_TERMINATED) from hs_scan()
         * indicates that it was passed an invalid database or scratch region,
         * which is not something we can recover from at scan time. */
        printf( "Hyperscan returned error %d\n", err);
        exit(EXIT_FAILURE);
    } else {
        ret = cctx.match_count;
    }

    return ret;
}

/**
 * \brief Add a case insensitive pattern.  Although we have different calls for
 *        adding case sensitive and insensitive patterns, we make a single call
 *        for either case.  No special treatment for either case.
 *
 * \param mpm_ctx Pointer to the mpm context.
 * \param pat     The pattern to add.
 * \param patlen  The pattern length.
 * \param offset  The pattern offset.
 * \param depth   The pattern depth.
 * \param pid     The pattern id.
 * \param sid     The pattern signature id.
 * \param flags   Flags associated with this pattern.
 *
 * \retval  0 On success.
 * \retval -1 On failure.
 */
int SCHSAddPatternCI(MpmCtx *mpm_ctx, uint8_t *pat, uint16_t patlen,
                     uint16_t offset, uint16_t depth, uint32_t pid,
                     sig_id sid, uint8_t flags)
{
    flags |= MPM_PATTERN_FLAG_NOCASE;
    return SCHSAddPattern(mpm_ctx, pat, patlen, offset, depth, pid, sid, flags);
}

/**
 * \brief Add a case sensitive pattern.  Although we have different calls for
 *        adding case sensitive and insensitive patterns, we make a single call
 *        for either case.  No special treatment for either case.
 *
 * \param mpm_ctx Pointer to the mpm context.
 * \param pat     The pattern to add.
 * \param patlen  The pattern length.
 * \param offset  The pattern offset.
 * \param depth   The pattern depth.
 * \param pid     The pattern id.
 * \param sid     The pattern signature id.
 * \param flags   Flags associated with this pattern.
 *
 * \retval  0 On success.
 * \retval -1 On failure.
 */
int SCHSAddPatternCS(MpmCtx *mpm_ctx, uint8_t *pat, uint16_t patlen,
                     uint16_t offset, uint16_t depth, uint32_t pid,
                     sig_id sid, uint8_t flags)
{
    return SCHSAddPattern(mpm_ctx, pat, patlen, offset, depth, pid, sid, flags);
}

void SCHSPrintSearchStats(MpmThreadCtx __oryx_unused__ *mpm_thread_ctx)
{
    return;
}

void SCHSPrintInfo(MpmCtx *mpm_ctx)
{
    SCHSCtx *ctx = (SCHSCtx *)mpm_ctx->ctx;

    printf("MPM HS Information:\n");
    printf("Memory allocs:   %" PRIu32 "\n", mpm_ctx->memory_cnt);
    printf("Memory alloced:  %" PRIu32 "\n", mpm_ctx->memory_size);
    printf(" Sizeof:\n");
    printf("  MpmCtx         %" PRIuMAX "\n", (uintmax_t)sizeof(MpmCtx));
    printf("  SCHSCtx:       %" PRIuMAX "\n", (uintmax_t)sizeof(SCHSCtx));
    printf("  SCHSPattern    %" PRIuMAX "\n", (uintmax_t)sizeof(SCHSPattern));
    printf("Unique Patterns: %" PRIu32 "\n", mpm_ctx->pattern_cnt);
    printf("Smallest:        %" PRIu32 "\n", mpm_ctx->minlen);
    printf("Largest:         %" PRIu32 "\n", mpm_ctx->maxlen);
    printf("\n");

    if (ctx) {
        PatternDatabase *pd = ctx->pattern_db;
        char *db_info = NULL;
        if (hs_database_info(pd->hs_db, &db_info) == HS_SUCCESS) {
            printf("HS Database Info: %s\n", db_info);
            SCFree(db_info);
        }
        printf("HS Database Size: %" PRIuMAX " bytes\n",
               (uintmax_t)ctx->hs_db_size);
    }

    printf("\n");
}

/************************** Mpm Registration ***************************/

/**
 * \brief Register the Hyperscan MPM.
 */
void MpmHSRegister(void)
{
    mpm_table[MPM_HS].name = "hs";
    mpm_table[MPM_HS].InitCtx = SCHSInitCtx;
    mpm_table[MPM_HS].InitThreadCtx = SCHSInitThreadCtx;
    mpm_table[MPM_HS].DestroyCtx = SCHSDestroyCtx;
    mpm_table[MPM_HS].DestroyThreadCtx = SCHSDestroyThreadCtx;
    mpm_table[MPM_HS].AddPattern = SCHSAddPatternCS;
    mpm_table[MPM_HS].AddPatternNocase = SCHSAddPatternCI;
    mpm_table[MPM_HS].Prepare = SCHSPreparePatterns;
    mpm_table[MPM_HS].Search = SCHSSearch;
    mpm_table[MPM_HS].PrintCtx = SCHSPrintInfo;
    mpm_table[MPM_HS].PrintThreadCtx = SCHSPrintSearchStats;
    mpm_table[MPM_HS].RegisterUnittests = SCHSRegisterTests;

    /* Set Hyperscan memory allocators */
    SCHSSetAllocators();
}

/**
 * \brief Clean up global memory used by all Hyperscan MPM instances.
 *
 * Currently, this is just the global scratch prototype.
 */
void MpmHSGlobalCleanup(void)
{
    SCMutexLock(&g_scratch_proto_mutex);
    if (g_scratch_proto) {
        printf("Cleaning up Hyperscan global scratch\n");
        hs_free_scratch(g_scratch_proto);
        g_scratch_proto = NULL;
    }
    SCMutexUnlock(&g_scratch_proto_mutex);

    SCMutexLock(&g_db_table_mutex);
    if (g_db_table != NULL) {
        printf("Clearing Hyperscan database cache\n");
        oryx_htable_destroy(g_db_table);
        g_db_table = NULL;
    }
    SCMutexUnlock(&g_db_table_mutex);
}

/*************************************Unittests********************************/

#define UNITTESTS
#ifdef UNITTESTS

static int __oryx_unused__ SCHSTest01(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghjiklmnopqrstuvwxyz";

    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest02(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abce", 4, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghjiklmnopqrstuvwxyz";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 0)
        result = 1;
    else
        printf("0 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest03(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"bcde", 4, 0, 0, 1, 0, 0);
    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"fghj", 4, 0, 0, 2, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghjiklmnopqrstuvwxyz";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 3)
        result = 1;
    else
        printf("3 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest04(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"bcdegh", 6, 0, 0, 1, 0, 0);
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"fghjxyz", 7, 0, 0, 2, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghjiklmnopqrstuvwxyz";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int SCHSTest05(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

	u64 longest_cost = 0;
	u64 shortest_cost = 10000000;
		
	struct  timeval  start;
	struct  timeval  end;
	u64 t;

	u8 mpm_type = MPM_HS;
	
    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, mpm_type);
    PmqSetup(&pmq);

    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"ABCD", 4, 0, 0, 0, 0, 0);
    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"bCdEfG", 6, 0, 0, 1, 0, 0);
    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"fghJikl", 7, 0, 0, 2, 0, 0);

#if 1
	int i;
	char pattern[128] = {0};
	
	/** */
	for (i = 0; i < 10240; i ++) {
		int pl = oryx_pattern_generate (pattern, 128);
		//printf ("%s\n", pattern);
		MpmAddPatternCI(&mpm_ctx, (uint8_t *)&pattern[0], pl, 0, 0, 4 + i, 1, 0);
	}
#endif


    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghjiklmnopqrstuvwxyz";

	gettimeofday(&start,NULL);

    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

	gettimeofday(&end,NULL);

	t = tm_elapsed_us (&start, &end);
	longest_cost = MAX(longest_cost, t);
	shortest_cost = MIN(shortest_cost, t);
	printf("lookup from \"%s\", hits %u, cost %llu us (shortest=%llu, longest=%llu)\n", 
		buf, cnt,  t, shortest_cost, longest_cost);
	
    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest06(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcd";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest07(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* should match 30 times */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"A", 1, 0, 0, 0, 0, 0);
    /* should match 29 times */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AA", 2, 0, 0, 1, 0, 0);
    /* should match 28 times */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AAA", 3, 0, 0, 2, 0, 0);
    /* 26 */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AAAAA", 5, 0, 0, 3, 0, 0);
    /* 21 */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AAAAAAAAAA", 10, 0, 0, 4, 0, 0);
    /* 1 */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA", 30,
                    0, 0, 5, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 6)
        result = 1;
    else
        printf("6 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest08(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    uint32_t cnt =
        SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)"a", 1);

    if (cnt == 0)
        result = 1;
    else
        printf("0 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest09(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"ab", 2, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    uint32_t cnt =
        SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)"ab", 2);

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest10(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcdefgh", 8, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "01234567890123456789012345678901234567890123456789"
                "01234567890123456789012345678901234567890123456789"
                "abcdefgh"
                "01234567890123456789012345678901234567890123456789"
                "01234567890123456789012345678901234567890123456789";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest11(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    if (MpmAddPatternCS(&mpm_ctx, (uint8_t *)"he", 2, 0, 0, 1, 0, 0) == -1)
        goto end;
    if (MpmAddPatternCS(&mpm_ctx, (uint8_t *)"she", 3, 0, 0, 2, 0, 0) == -1)
        goto end;
    if (MpmAddPatternCS(&mpm_ctx, (uint8_t *)"his", 3, 0, 0, 3, 0, 0) == -1)
        goto end;
    if (MpmAddPatternCS(&mpm_ctx, (uint8_t *)"hers", 4, 0, 0, 4, 0, 0) == -1)
        goto end;
    PmqSetup(&pmq);

    if (SCHSPreparePatterns(&mpm_ctx) == -1)
        goto end;

    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    result = 1;

    const char *buf = "he";
    result &= (SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                          strlen(buf)) == 1);
    buf = "she";
    result &= (SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                          strlen(buf)) == 2);
    buf = "his";
    result &= (SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                          strlen(buf)) == 1);
    buf = "hers";
    result &= (SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                          strlen(buf)) == 2);

end:
    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest12(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"wxyz", 4, 0, 0, 0, 0, 0);
    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"vwxyz", 5, 0, 0, 1, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyz";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 2)
        result = 1;
    else
        printf("2 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest13(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcdefghijklmnopqrstuvwxyzABCD";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyzABCD";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest14(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcdefghijklmnopqrstuvwxyzABCDE";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyzABCDE";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest15(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcdefghijklmnopqrstuvwxyzABCDEF";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyzABCDEF";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest16(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcdefghijklmnopqrstuvwxyzABC";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyzABC";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest17(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcdefghijklmnopqrstuvwxyzAB";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyzAB";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest18(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    const char *pat = "abcde"
                "fghij"
                "klmno"
                "pqrst"
                "uvwxy"
                "z";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcde"
                "fghij"
                "klmno"
                "pqrst"
                "uvwxy"
                "z";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest19(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 */
    const char *pat = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAA";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest20(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 */
    const char *pat = "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AA";
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)pat, strlen(pat), 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AAAAA"
                "AA";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest21(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AA", 2, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    uint32_t cnt =
        SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)"AA", 2);

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest22(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcd", 4, 0, 0, 0, 0, 0);
    /* 1 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"abcde", 5, 0, 0, 1, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "abcdefghijklmnopqrstuvwxyz";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 2)
        result = 1;
    else
        printf("2 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest23(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"AA", 2, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    uint32_t cnt =
        SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)"aa", 2);

    if (cnt == 0)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest24(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 1 */
    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"AA", 2, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    uint32_t cnt =
        SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)"aa", 2);

    if (cnt == 1)
        result = 1;
    else
        printf("1 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest25(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"ABCD", 4, 0, 0, 0, 0, 0);
    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"bCdEfG", 6, 0, 0, 1, 0, 0);
    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"fghiJkl", 7, 0, 0, 2, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 3)
        result = 1;
    else
        printf("3 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest26(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0x00, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    MpmAddPatternCI(&mpm_ctx, (uint8_t *)"Works", 5, 0, 0, 0, 0, 0);
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"Works", 5, 0, 0, 1, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "works";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 1)
        result = 1;
    else
        printf("3 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest27(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 0 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"ONE", 3, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "tone";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 0)
        result = 1;
    else
        printf("0 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest28(void)
{
    int result = 0;
    MpmCtx mpm_ctx;
    MpmThreadCtx mpm_thread_ctx;
    PatternMatcherQueue pmq;

    memset(&mpm_ctx, 0, sizeof(MpmCtx));
    memset(&mpm_thread_ctx, 0, sizeof(MpmThreadCtx));
    MpmInitCtx(&mpm_ctx, MPM_HS);

    /* 0 match */
    MpmAddPatternCS(&mpm_ctx, (uint8_t *)"one", 3, 0, 0, 0, 0, 0);
    PmqSetup(&pmq);

    SCHSPreparePatterns(&mpm_ctx);
    SCHSInitThreadCtx(&mpm_ctx, &mpm_thread_ctx);

    const char *buf = "tONE";
    uint32_t cnt = SCHSSearch(&mpm_ctx, &mpm_thread_ctx, &pmq, (uint8_t *)buf,
                              strlen(buf));

    if (cnt == 0)
        result = 1;
    else
        printf("0 != %" PRIu32 " ", cnt);

    SCHSDestroyCtx(&mpm_ctx);
    SCHSDestroyThreadCtx(&mpm_ctx, &mpm_thread_ctx);
    PmqFree(&pmq);
    return result;
}

static int __oryx_unused__ SCHSTest29(void)
{
#if 0
    uint8_t *buf = (uint8_t *)"onetwothreefourfivesixseveneightnine";
    uint16_t buflen = strlen((char *)buf);
    Packet *p = NULL;
    ThreadVars th_v;
    DetectEngineThreadCtx *det_ctx = NULL;
    int result = 0;

    memset(&th_v, 0, sizeof(th_v));
    p = UTHBuildPacket(buf, buflen, IPPROTO_TCP);

    DetectEngineCtx *de_ctx = DetectEngineCtxInit();
    if (de_ctx == NULL)
        goto end;
    de_ctx->mpm_matcher = MPM_HS;

    de_ctx->flags |= DE_QUIET;

    de_ctx->sig_list = SigInit(
        de_ctx, "alert tcp any any -> any any "
                "(content:\"onetwothreefourfivesixseveneightnine\"; sid:1;)");
    if (de_ctx->sig_list == NULL)
        goto end;
    de_ctx->sig_list->next =
        SigInit(de_ctx, "alert tcp any any -> any any "
                        "(content:\"onetwothreefourfivesixseveneightnine\"; "
                        "fast_pattern:3,3; sid:2;)");
    if (de_ctx->sig_list->next == NULL)
        goto end;

    SigGroupBuild(de_ctx);
    DetectEngineThreadCtxInit(&th_v, (void *)de_ctx, (void *)&det_ctx);

    SigMatchSignatures(&th_v, de_ctx, det_ctx, p);
    if (PacketAlertCheck(p, 1) != 1) {
        printf("if (PacketAlertCheck(p, 1) != 1) failure\n");
        goto end;
    }
    if (PacketAlertCheck(p, 2) != 1) {
        printf("if (PacketAlertCheck(p, 1) != 2) failure\n");
        goto end;
    }

    result = 1;
end:
    if (de_ctx != NULL) {
        SigGroupCleanup(de_ctx);
        SigCleanSignatures(de_ctx);

        DetectEngineThreadCtxDeinit(&th_v, (void *)det_ctx);
        DetectEngineCtxFree(de_ctx);
    }

    UTHFreePackets(&p, 1);

    return result;
#else
	return 0;
#endif
}

#endif /* UNITTESTS */
void SCHSRegisterTests(void)
{
#ifdef UNITTESTS
#if 0
    UtRegisterTest("SCHSTest01", SCHSTest01);
    UtRegisterTest("SCHSTest02", SCHSTest02);
    UtRegisterTest("SCHSTest03", SCHSTest03);
    UtRegisterTest("SCHSTest04", SCHSTest04);
#endif
    UtRegisterTest("SCHSTest05", SCHSTest05);
#if 0
    UtRegisterTest("SCHSTest06", SCHSTest06);
    UtRegisterTest("SCHSTest07", SCHSTest07);
    UtRegisterTest("SCHSTest08", SCHSTest08);
    UtRegisterTest("SCHSTest09", SCHSTest09);
    UtRegisterTest("SCHSTest10", SCHSTest10);
    UtRegisterTest("SCHSTest11", SCHSTest11);
    UtRegisterTest("SCHSTest12", SCHSTest12);
    UtRegisterTest("SCHSTest13", SCHSTest13);
    UtRegisterTest("SCHSTest14", SCHSTest14);
    UtRegisterTest("SCHSTest15", SCHSTest15);
    UtRegisterTest("SCHSTest16", SCHSTest16);
    UtRegisterTest("SCHSTest17", SCHSTest17);
    UtRegisterTest("SCHSTest18", SCHSTest18);
    UtRegisterTest("SCHSTest19", SCHSTest19);
    UtRegisterTest("SCHSTest20", SCHSTest20);
    UtRegisterTest("SCHSTest21", SCHSTest21);
    UtRegisterTest("SCHSTest22", SCHSTest22);
    UtRegisterTest("SCHSTest23", SCHSTest23);
    UtRegisterTest("SCHSTest24", SCHSTest24);
    UtRegisterTest("SCHSTest25", SCHSTest25);
    UtRegisterTest("SCHSTest26", SCHSTest26);
    UtRegisterTest("SCHSTest27", SCHSTest27);
    UtRegisterTest("SCHSTest28", SCHSTest28);
    UtRegisterTest("SCHSTest29", SCHSTest29);
#endif
#endif

    return;
}

#endif /* HAVA_HYPERSCAN */

