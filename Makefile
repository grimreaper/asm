LD=/opt/local/bin/ld
NASM=/opt/local/bin/nasm
NASMFLAGS=-f macho64 
LDFLAGS=-macosx_version_min 10.8.0 -lSystem
foo: foo.o
	$(LD) $(LDFLAGS) -o $@ $<

foo.o: foo.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

clean:
	rm -f foo *.o
