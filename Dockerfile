FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
#ENV COMMAND=/bin/bash
ENV COMMAND=./start.sh
#Setup basic Ubuntu Server
RUN apt-get update && apt-get install -y ubuntu-server
RUN apt-get update && apt-get install -y systemd liblttng-ust0 vim iputils-ping
RUN apt-get -y install git  software-properties-common wget dkms build-essential

#Download RainbowMiner
RUN git clone https://github.com/rainbowminer/RainbowMiner
WORKDIR RainbowMiner
RUN  chmod +x *.sh && ./install.sh

#Install powershell
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.1.1/powershell_7.1.1-1.ubuntu.20.04_amd64.deb
RUN dpkg -i powershell_7.1.1-1.ubuntu.20.04_amd64.deb && apt-get install -f
RUN rm powershell_7.1.1-1.ubuntu.20.04_amd64.deb

RUN mkdir /RainbowMiner/Config
RUN mkdir /RainbowMiner/Bin
VOLUME /RainbowMiner/Bin
VOLUME /RainbowMiner/Config

CMD $COMMAND
EXPOSE 4000/tcp

#CMD /bin/bash
