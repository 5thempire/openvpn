FROM debian:stretch-slim

RUN apt-get update \
    && apt-get install -y iptables net-tools wget ntp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /openvpn
WORKDIR /openvpn

RUN wget https://openvpn.net/downloads/openvpn-as-latest-debian9.amd_64.deb
RUN dpkg -i openvpn-as-latest-debian9.amd_64.deb
