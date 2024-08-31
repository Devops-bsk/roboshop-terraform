#!/bin/bash
export AUTO_INSTALL=y
export ENDPOINT=$(curl http://169.254.169.254/latest/metadata/public-ipv4)
export APPROVE_INSTALL=y
export IPV6_SUPPORT=y
export PORT_CHOICE=1
export PROTOCOL_CHOICE=2
export DNS=1
export COMPRESSION_ENABLED=n
export CUSTOMIZE_ENC=n
export CLIENT=bsk
export PASS=1
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
./openvpn-install.sh
