LD=/opt/local/bin/ld
NASM=/opt/local/bin/nasm
NASMFLAGS=-f macho64 
LDFLAGS=-macosx_version_min 10.8.0 -lSystem

PGMS=hello_world
LIBS=lib/io.o

.SUFFIXES: .asm .o
.PHONY: clean

all: $(PGMS)

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

$(PGMS) : % : %.o $(LIBS)
	$(LD) $(LDFLAGS) -o $@ $<

clean:
	rm -f $(PGMS) *.o $(LIBS)
