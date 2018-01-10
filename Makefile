
compile:
	docker run -i --name coreboot-build -t "eyedeekay/coreboot-dockerfile"

build:
	docker build -f Dockerfile -t "eyedeekay/coreboot-dockerfile" .

run:
	docker run -i --name coreboot -t "eyedeekay/coreboot-dockerfile"

menuconfig:
	docker run -i --name coreboot-config -t "eyedeekay/coreboot-dockerfile" make menuconfig

nconfig:
	docker run -i --name coreboot-config -t "eyedeekay/coreboot-dockerfile" make nconfig
