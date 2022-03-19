# ham2mon Docker image

[ham2mon](https://github.com/madengr/ham2mon) is a GNU Radio based SDR scanner wich can scan multiple radio channels in parallel.  
As newer versions of GNURadio are only linked with python3 and there is no python3 version of han2mon this docker makes it working by containerizing it in Ubuntu 18.04

## Build

    docker build . -t ham2mon
## Before Run
First you need to unload conflicting sdr drivers from host kernel: 

    rmmod dvb_usb_rtl28xxu
    rmmod dvb_usb_rtl2832u
    rmmod rtl2832
    rmmod rtl2832_sdr
 or permanently:

    echo 'blacklist dvb_usb_rtl28xxu\nblacklist dvb_usb_rtl2832u\nblacklist rtl2832\nblacklist rtl2832_sdr' | tee – append /etc/modprobe.d/blacklist-rtl.conf 

## Run

    docker run -it --privileged ham2mon

WARNING: it is possible you need to do the `rmmod` part inside docker too, so connect SDR while checking `dmesg -w`  and make sure `dvb` driver is **NOT** loaded. 
you can also check presence of rtl-sdr by running `rtl_test` command.
 
