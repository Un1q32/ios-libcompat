#ifndef _LIBCOMPAT_SYS_STAT_H_
#define _LIBCOMPAT_SYS_STAT_H_

#include <sys/types.h>

extern int mkdirat(int, const char *, mode_t);

#endif

#include_next <sys/stat.h>
