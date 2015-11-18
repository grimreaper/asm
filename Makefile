LD=/opt/local/bin/ld
NASM=/opt/local/bin/nasm
NASMFLAGS=-f macho64 -g -w+macro-selfref -w+gnu-elf-extensions -w+float-denorm -w+float-underflow -O0
LDFLAGS=-macosx_version_min 10.8.0 -lSystem -arch x86_64 -e _main $(LDLIBS)

LIB_IO_PGMS=hello_world2 argv
LIB_IO=lib/io.o

PGMS=$(sort $(LIB_IO_PGMS) hello_world)
LIBS=$(LIB_IO)
MACRO=macro/libc.inc macro/common.inc

.SUFFIXES: .asm .o
.PHONY: clean test

all: $(PGMS)

$(LIB_IO): lib/io.inc
$(LIB_IO_PGMS): LDLIBS+=-lc
$(LIB_IO_PGMS): $(LIB_IO)

%.o: %.asm $(MACRO)
	$(NASM) $(NASMFLAGS) -o $@ $<

$(PGMS) : % : %.o
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(PGMS) *.o $(LIBS)

test: $(PGMS)
	./tests.py
