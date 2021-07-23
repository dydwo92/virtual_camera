
.PHONY: module utility

all: module utility

module: bin bin/vcmod.ko bin/vcctrl

bin: 
	mkdir bin

bin/vcmod.ko:
	cd module; $(MAKE) ; cd ..; mv module/vcmod.ko bin/

bin/vcctrl:
	$(MAKE) -C utils; mv utils/vcctrl bin/

clean:
	rm -r bin; cd module; $(MAKE) clean; cd ..; $(MAKE) clean -C utils;
