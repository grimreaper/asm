LD=/opt/local/bin/ld
NASM=/opt/local/bin/nasm
NASMFLAGS=-f macho64 
LDFLAGS=-macosx_version_min 10.8.0 -lSystem

PGMS=foo

.SUFFIXES: .asm .o
.PHONY: clean

all: foo

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

$(PGMS) : % : %.o
	$(LD) $(LDFLAGS) -o $@ $<

clean:
	rm -f $(PGMS) *.o
