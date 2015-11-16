LD=/opt/local/bin/ld
NASM=/opt/local/bin/nasm
NASMFLAGS=-f macho64 -g -w+macro-selfref -w+gnu-elf-extensions -w+float-denorm -w+float-underflow
LDFLAGS=-macosx_version_min 10.8.0 -lSystem -arch x86_64 -e _main -lc

LIB_IO=lib/io.o

PGMS=hello_world hello_world2 argv
LIBS=$(LIB_IO)
MACRO=macro/libc.inc

.SUFFIXES: .asm .o
.PHONY: clean

all: $(PGMS)

hello_world2 argv: $(LIB_IO)

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

$(PGMS) : % : %.o
	$(LD) $(LDFLAGS) -o $@ $^

clean:
	rm -f $(PGMS) *.o $(LIBS)
