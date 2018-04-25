#ifndef MPM_MEMORY_H
#define MPM_MEMORY_H

#ifndef __GNUC__
#  define  __attribute__(x)  /*NOTHING*/
#endif

#define __oryx_unused_val__		0

/* Shorthand for attribute to mark a function as part of our public API.
 * Functions without this attribute will be hidden. */
#if defined(__GNUC__)
#define __oryx_always_extern__		__attribute__((visibility("default")))
#define	__oryx_always_inline__		__attribute__((always_inline)) inline
#define	__oryx_unused__				__attribute__((unused))
#define __oryx_noreturn__(fn)		__attribute__((noreturn))
//#define __oryx_format_func__(f,a)	__attribute__((format(__NSString__, f, a)))
#else
// TODO: dllexport defines for windows
#define __oryx_always_extern__
#define	__oryx_always_inline__	
#define	__oryx_unused__
#endif

/** Alway treated the expr as true */
#ifndef likely
#define likely(expr) __builtin_expect(!!(expr), 1)
#endif

/** Alway treated the expr as false */
#ifndef unlikely
#define unlikely(expr) __builtin_expect(!!(expr), 0)
#endif


/** memory flags */
#define MPF_NOFLGS  (0)
#define MPF_CLR     (1 << 0)      /** Clear it after allocated */

void *kmalloc(int s, 
                 int flags, int __oryx_unused__ node);

void *kcalloc(int c, int s, 
				int flags, int node);

void *krealloc(void *sp,  int s, 
				int flags, int __oryx_unused__ node);

void kfree(void *p);


#endif
