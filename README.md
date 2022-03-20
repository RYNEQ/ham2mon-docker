# ham2mon Docker image

[ham2mon](https://github.com/madengr/ham2mon) is a GNU Radio based SDR scanner wich can scan multiple radio channels in parallel.  
As newer versions of GNURadio are only linked with python3 and there is no python3 version of ham2mon this docker makes it working by containerizing it in Ubuntu 18.04

## Build

    docker build . -t ham2mon

## Before Run
First you need to blacklist & unload conflicting sdr drivers from host kernel: 

    echo -e 'blacklist dvb_usb_rtl28xxu\nblacklist dvb_usb_rtl2832u\nblacklist rtl2832\nblacklist rtl2832_sdr' | sudo tee – append /etc/modprobe.d/blacklist-rtl.conf 

and then:

    rmmod dvb_usb_rtl28xxu
    rmmod dvb_usb_rtl2832u
    rmmod rtl2832
    rmmod rtl2832_sdr


## Run

    docker run -it --privileged ham2mon

you can check presence of rtl-sdr by running `rtl_test` command.
 
