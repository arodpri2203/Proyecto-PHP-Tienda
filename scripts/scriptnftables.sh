nft flush table ip filter

nft add rule ip filter INPUT iifname "ens37" ip protocol icmp ip saddr 192.168.10.0/24 counter accept
nft add rule ip filter OUTPUT oifname "ens37" ip protocol icmp ip saddr 192.168.10.0/24 counter accept
nft add rule ip filter INPUT iifname "ens38" ip protocol icmp ip saddr 192.168.10.0/24 counter accept
nft add rule ip filter OUTPUT oifname "ens38" ip protocol icmp ip saddr 192.168.10.0/24 counter accept

nft add rule ip filter FORWARD iifname "ens37" oifname "ens38" ip saddr 192.168.10.0/24 udp dport 53 counter accept
nft add rule ip filter FORWARD iifname "ens38" oifname "ens37" ip daddr 192.168.10.0/24 udp sport 53 counter accept
nft add rule ip filter FORWARD iifname "ens37" oifname "ens38" ip saddr 192.168.20.0/24 udp dport 53 counter accept
nft add rule ip filter FORWARD iifname "ens38" oifname "ens37" ip daddr 192.168.20.0/24 udp sport 53 counter accept

nft add rule ip filter FORWARD iifname "ens37" oifname "ens38" ip saddr 192.168.10.0/24 tcp dport 80 counter accept
nft add rule ip filter FORWARD iifname "ens38" oifname "ens37" ip daddr 192.168.10.0/24 tcp sport 80 counter accept

nft add rule ip filter FORWARD iifname "ens33" oifname "ens37" ip saddr 192.168.10.0/24 tcp dport 22 counter accept
nft add rule ip filter FORWARD iifname "ens37" oifname "ens33" ip daddr 192.168.10.0/24 tcp sport 22 counter accept
