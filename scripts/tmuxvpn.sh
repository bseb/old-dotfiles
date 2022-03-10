#!/bin/bash

TUNNEL="NO TUNNEL"


ip link show | grep proton &> /dev/null

if [[ $? -eq 0 ]]; then
	IP= $(curl icanhazip.com)
	TUNNEL="PROTONVPN: ${IP}"
fi

for x in {0..5}; do
	ip link show | grep tun${x} &> /dev/null
	if [[ $? -eq 0 ]]; then
        INTERFACE=tun${x}
		IP=$(ip addr show dev $INTERFACE  | grep inet |head -1| awk '{print $2}' | cut -d / -f 1)
		TUNNEL="tun${x}: ${IP}"
		break
	fi
done

echo $TUNNEL

