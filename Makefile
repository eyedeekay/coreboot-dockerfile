export PWD = $(shell pwd)

#source config.mk

readout:
	docker run -i --rm -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot-readout \
		-t "eyedeekay/coreboot-dockerfile" 'cat .config'

clean:
	rm *log *err

debug:
	docker rm -f coreboot-build; \
	docker run -i -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot-build \
		-t "eyedeekay/tlhab" 'make --debug=v; make --debug=v'

compile:
	docker rm -f coreboot-build; \
	docker run -i -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot-build \
		-t "eyedeekay/tlhab" 'make'

build:
	docker build -f Dockerfile -t "eyedeekay/coreboot-dockerfile" .

better-build:
	docker build -f Dockerfiles/Dockerfile.deps -t "eyedeekay/coreboot-dockerfile:deps" .
	docker build -f Dockerfiles/Dockerfile.i386 -t "eyedeekay/coreboot-dockerfile:i386" .
	docker build -f Dockerfiles/Dockerfile.x64 -t "eyedeekay/coreboot-dockerfile:x64" .
	docker build -f Dockerfiles/Dockerfile.arm -t "eyedeekay/coreboot-dockerfile:arm" .
	docker build -f Dockerfiles/Dockerfile.aarch64 -t "eyedeekay/coreboot-dockerfile:aarch64" .
	docker build -f Dockerfiles/Dockerfile.mips -t "eyedeekay/coreboot-dockerfile:mips" .
	docker build -f Dockerfiles/Dockerfile.riscv -t "eyedeekay/coreboot-dockerfile:riscv" .
	docker build -f Dockerfiles/Dockerfile.power8 -t "eyedeekay/coreboot-dockerfile:power8" .
	docker build -f Dockerfiles/Dockerfile.nds32le -t "eyedeekay/coreboot-dockerfile:nds32le" .
	docker build -f Dockerfiles/Dockerfile -t "eyedeekay/coreboot-dockerfile" .

run:
	docker rm -f coreboot; \
	docker run -i -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot -t "eyedeekay/tlhab" bash

menuconfig:
	docker run -i --name coreboot-config -t "eyedeekay/tlhab" 'make menuconfig'
	docker cp coreboot-config:/home/coreboot/coreboot/.config .; \
	docker rm -f coreboot-config

rebuild:
	docker run -i --name coreboot-config -t "eyedeekay/tlhab" 'make menuconfig && make'
	docker cp coreboot-config:/home/coreboot/coreboot/.config .; \
	docker rm -f coreboot-config

nconfig:
	docker run -i --name coreboot-config -t "eyedeekay/tlhab" 'make nconfig'
	docker cp coreboot-config:/home/coreboot/coreboot/.config .; \
	docker rm -f coreboot-config

child:
	docker build -f Dockerfile.tlhab -t "eyedeekay/tlhab" .

