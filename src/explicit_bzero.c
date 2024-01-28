#include <string.h>

void explicit_bzero(void *s, size_t n) {
  memset(s, 0, n);
  __asm__ __volatile__("" : : "r"(s) : "memory");
}
