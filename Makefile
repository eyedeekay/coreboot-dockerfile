
dummy:

build:
	docker build -f Dockerfile -t coreboot .

run:
	docker run -i --name coreboot -t coreboot
