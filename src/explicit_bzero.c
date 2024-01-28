#include <string.h>

void explicit_bzero(void *s, size_t n) {
  memset(s, 0, n);
  __asm__ volatile("" : : "r"(s) : "memory");
}
