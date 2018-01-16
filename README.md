# coreboot-dockerfile
Dockerfile with a coreboot build environment

It's a way to cheat cached builds too. To get my last coreboot toolchain, one
could simply

        docker pull eyedeekay/coreboot-dockerfile

which is convenient as I am heavily reliant on build automation.

If you want to try out my experimental coreboot builds, the plan is to make it
so you can just:

        git clone https://github.com/eyedeekay/coreboot-dockerfile.git && cd coreboot-dockerfile
        docker pull eyedeekay/coreboot-dockerfile
        make rebuild

Right now, that will fully build the coreboot image for the Alienware m11xR1
and copy the build result to a folder in the working directory named "build."

## Usage:

I use this as a base container to build other containers from. It keeps a copy
of all dependencies for building coreboot installed system-wide, and the
corebooot tree in /home/coreboot/coreboot. This makes it really easy to put up
and tear down pristine build environments in containers. To use this as a base
container, just use FROM, copy your files, and run make in the container.
