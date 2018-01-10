FROM debian:sid
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git make build-essential gnat flex bison libncurses5-dev wget zlib1g-dev
RUN adduser --home /home/coreboot/ --shell /bin/bash --gecos 'coreboot,,,,' --disabled-password coreboot
RUN git clone https://review.coreboot.org/coreboot /home/coreboot/coreboot
WORKDIR /home/coreboot/coreboot
RUN git submodule update --init --checkout
RUN make iasl
RUN make crossgcc
ENTRYPOINT [ "bash", "-i", "-c" ]
