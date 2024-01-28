#ifndef _LIBCOMPAT_FCNTL_H_
#define _LIBCOMPAT_FCNTL_H_

extern int openat(int, const char *, int, ...);

#endif

#include_next <fcntl.h>
