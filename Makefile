export PWD = $(shell pwd)

readout:
	docker run -i --rm -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot-readout \
		-t "eyedeekay/coreboot-dockerfile" 'cat .config'

compile:
	docker run -i -v $(PWD)/.config:/home/coreboot/coreboot/.config \
		--name coreboot-build \
		-t "eyedeekay/coreboot-dockerfile" make

build:
	docker build -f Dockerfile -t "eyedeekay/coreboot-dockerfile" .

run:
	docker run -i --name coreboot -t "eyedeekay/coreboot-dockerfile"

menuconfig:
	docker run -i --name coreboot-config -t "eyedeekay/coreboot-dockerfile" 'make menuconfig'
	docker cp coreboot-config:/home/coreboot/coreboot/.config .; \
	docker rm -f coreboot-config

nconfig:
	docker run -i --name coreboot-config -t "eyedeekay/coreboot-dockerfile" 'make nconfig'
	docker cp coreboot-config:/home/coreboot/coreboot/.config .; \
	docker rm -f coreboot-config
