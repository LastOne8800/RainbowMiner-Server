FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y ubuntu-server

RUN apt-get update && apt-get install -y systemd liblttng-ust0 vim iputils-ping
RUN apt-get -y install git  software-properties-common wget dkms build-essential
#RUN apt-get -y install libicu60

RUN git clone https://github.com/rainbowminer/RainbowMiner
WORKDIR RainbowMiner
RUN  chmod +x *.sh && ./install.sh


#Install powershell
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.1/powershell_7.1.1-1.ubuntu.20.04_amd64.deb
RUN dpkg -i powershell_7.1.1-1.ubuntu.20.04_amd64.deb && apt-get install -f
RUN rm powershell_7.1.1-1.ubuntu.20.04_amd64.deb
VOLUME /RainbowMiner/Config

EXPOSE 4000/tcp

CMD /bin/bash
