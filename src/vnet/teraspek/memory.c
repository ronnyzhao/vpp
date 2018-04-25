#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>

#include "memory.h"

#if defined(HAVE_ATOMIC)
static atomic64_t times;
#endif

void *kmalloc(int s, 
                 int flags, int __oryx_unused__ node)

{
    void *p;

    if(likely((p = malloc(s)) != NULL)){
        if(flags & MPF_CLR)
            memset(p, 0, s);
#if defined(HAVE_ATOMIC)
        atomic64_inc(&times);
#endif
    }

    return p;
}
void *kcalloc(int c, int s, 
			 int flags, int node)

{ 
    return kmalloc(c * s, flags, node);
}

void *krealloc(void *sp,  int s, 
			 int flags, int __oryx_unused__ node)
{
    void *p;
 
    if(likely((p = realloc(sp, s)) != NULL)) {
        if(flags & MPF_CLR)
            memset(p, 0, s);
#if defined(HAVE_ATOMIC)
        atomic64_inc(&times);
#endif
    }

    return p;
}

void kfree(void *p)
{

    if(likely(p)){
        free(p);
#if defined(HAVE_ATOMIC)
        atomic64_dec(&times);
#endif
    }

    p = NULL;
}
