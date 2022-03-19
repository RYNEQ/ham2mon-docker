FROM ubuntu:18.04
 
ENV DEBIAN_FRONTEND=noninteractive 
ENV TZ=Etc/UTC 
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get install -y gnuradio python-pip git gr-osmosdr
RUN apt-get -y install kmod
RUN apt-get -y install vim
RUN echo 'blacklist dvb_usb_rtl28xxu' | tee – append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
RUN echo 'blacklist dvb_usb_rtl2832u' | tee – append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
RUN echo 'blacklist rtl2832' | tee – append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
RUN echo 'blacklist rtl2832_sdr' | tee – append /etc/modprobe.d/blacklist-dvb_usb_rtl28xxu.conf
#RUN rmmod dvb_usb_rtl28xxu

RUN git clone https://github.com/madengr/ham2mon
WORKDIR /ham2mon/apps/
ENTRYPOINT ["bash"]
