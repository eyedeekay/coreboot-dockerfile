# coreboot-dockerfile
Dockerfile with a coreboot build environment

lspci -nnvvvxxxx > lspci.log 2> lspci.err.log
lsusb -vvv > lsusb.log 2> lsusb.err.log
superiotool -deV > superiotool.log 2> superiotool.err.log
inteltool -a > inteltool.log 2> inteltool.err.log
ectool -i > ectool.log 2> ectool.err.log
msrtool > msrtool.log 2> msrtool.err.log
dmidecode > dmidecode.log 2> dmidecode.err.log
biosdecode > biosdecode.log 2> biosdecode.err.log
nvramtool -x > nvramtool.log 2> nvramtool.err.log
dmesg > dmesg.log 2> dmesg.err.log
acpidump > acpidump.log 2> acpidump.err.log
for x in /sys/class/sound/card0/hw*; do cat "$x/init_pin_configs" > pin_"$(basename "$x")"; done
for x in /proc/asound/card0/codec#*; do cat "$x" > "$(basename "$x")"; done
cat /proc/cpuinfo > cpuinfo.log 2> cpuinfo.err.log
cat /proc/ioports > ioports.log 2> ioports.err.log
cat /sys/class/input/input*/id/bustype > input_bustypes.log
