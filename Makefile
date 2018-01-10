
compile:
	docker run -i --name coreboot-build

build:
	docker build -f Dockerfile -t "eyedeekay/coreboot" .

run:
	docker run -i --name coreboot -t coreboot

menuconfig:
	docker run -i --name coreboot-config -t coreboot make menuconfig

nconfig:
	docker run -i --name coreboot-config -t coreboot make nconfig
