CC := armv7-apple-darwin11-cc
ifeq ($(shell uname),Darwin)
AR := ar
else
AR := llvm-ar
endif

CFLAGS := -Wall -Wextra -Werror
OPTFLAGS := -O2
_REQFLAGS := -Iinclude -std=c89

PREFIX := /usr/local

SRCS := $(wildcard src/*.c)
OBJS := $(SRCS:.c=.o)

ifndef VERBOSE
V := @
endif

.PHONY: all debug install clean

all: src/libcompat.dylib

debug: OPTFLAGS := -g
debug: all

src/libcompat.dylib: $(OBJS)
	@printf " \033[1;34mLD\033[0m %s\n" "$@"
	$(V)$(CC) -shared -install_name $(PREFIX)/lib/libcompat.dylib -o $@ $^

%.o: %.c
	@src=$<; src=$${src##*/}; printf " \033[1;32mCC\033[0m %s\n" "$$src"
	$(V)$(CC) $(_REQFLAGS) $(CFLAGS) $(OPTFLAGS) -c $< -o $@

clean:
	@printf "Cleaning up...\n"
	@rm -rf src/*.o src/libcompat.dylib

install: src/libcompat.dylib
	@printf "Installing libraries..\n"
	$(V)mkdir -p $(DESTDIR)$(PREFIX)/lib
	$(V)cp src/libcompat.dylib $(DESTDIR)$(PREFIX)/lib/libcompat.dylib
	@printf "Installing headers..\n"
	$(V)mkdir -p $(DESTDIR)$(PREFIX)/include
	$(V)cp -a include $(DESTDIR)$(PREFIX)/include/compat

clangd:
	@printf "Generating clangd config...\n"
	@rm -f .clangd
	@printf 'CompileFlags:\n  Add: [-I$(PWD)/include, --target=armv7-apple-ios5]\nDiagnostics:\n  Includes:\n    IgnoreHeader: limits\\.h\n' > .clangd
