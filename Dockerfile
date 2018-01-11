FROM debian:sid
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git make build-essential gnat flex bison libncurses5-dev wget zlib1g-dev
RUN adduser --home /home/coreboot/ --shell /bin/bash --gecos 'coreboot,,,,' --disabled-password coreboot
USER coreboot
RUN git clone https://review.coreboot.org/coreboot /home/coreboot/coreboot
WORKDIR /home/coreboot/coreboot
RUN git submodule update --init --checkout
RUN make iasl
RUN make crossgcc-i386
RUN make crosstools-i386
RUN make crossgcc-x64
RUN make crosstools-x64
RUN make crossgcc-arm
RUN make crosstools-arm
RUN make crossgcc-aarch64
RUN make crosstools-aarch64
RUN make crossgcc-mips
RUN make crosstools-mips
RUN make crossgcc-riscv
RUN make crosstools-riscv
RUN make crossgcc-power8
RUN make crosstools-power8
RUN make crossgcc-nds32le
RUN make crosstools-nds32le
ENTRYPOINT [ "bash", "-i", "-c" ]
