#!/bin/bash

TUNNEL="NO TUNNEL"


ip link show | grep proton &> /dev/null

if [[ $? -eq 0 ]]; then
	TUNNEL="PROTONVPN"
fi

for x in {1..5}; do
	ip link show | grep tun${x} &> /dev/null
	if [[ $? -eq 0 ]]; then
		IP=$(ip addr show proton0 |  grep inet | awk '{print $2}' | cut -d / -f 1)
		TUNNEL="tun${x}: ${IP}"
		break
	fi
done

echo $TUNNEL

