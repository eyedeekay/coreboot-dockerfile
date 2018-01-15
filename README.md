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

