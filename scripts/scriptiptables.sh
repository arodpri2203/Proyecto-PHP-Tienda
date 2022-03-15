iptables -F
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#Para el ping
iptables -A INPUT -i ens37 -p icmp -s 192.168.10.0/24 -j ACCEPT
iptables -A OUTPUT -o ens37 -p icmp -s 192.168.10.0/24 -j ACCEPT
iptables -A INPUT -i ens38 -p icmp -s 192.168.10.0/24 -j ACCEPT
iptables -A OUTPUT -o ens38 -p icmp -s 192.168.10.0/24 -j ACCEPT

#Para el dns
iptables -A FORWARD -i ens37 -o ens38 -s 192.168.10.0/24 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -o ens37 -i ens38 -d 192.168.10.0/24 -p udp --sport 53 -j ACCEPT
iptables -A FORWARD -i ens37 -o ens38 -s 192.168.20.0/24 -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -o ens37 -i ens38 -d 192.168.20.0/24 -p udp --sport 53 -j ACCEPT

#Entrada y salida puerto 80
iptables -A FORWARD -i ens37 -o ens38 -s 192.168.10.0/24 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -o ens37 -i ens38 -d 192.168.10.0/24 -p tcp --sport 80 -j ACCEPT

#Entrada y salida puerto ssh
iptables -A FORWARD -i ens33 -o ens37 -s 192.168.10.0/24 -p tcp --dport 22 -j ACCEPT
iptables -A FORWARD -o ens33 -i ens37 -d 192.168.10.0/24 -p tcp --sport 22 -j ACCEPT
 
