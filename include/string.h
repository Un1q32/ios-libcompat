#ifndef _LIBCOMPAT_STRING_H_
#define _LIBCOMPAT_STRING_H_

#include <sys/types.h>

extern void explicit_bzero(void *, size_t);

#endif

#include_next <string.h>
