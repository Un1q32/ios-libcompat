#include <string.h>

char *stpncpy(char *dst, const char *src, size_t size) {
    char *ret = strncpy(dst, src, size);
    return strchr(ret, '\0');
}
