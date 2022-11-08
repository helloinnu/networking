# nov/08/2022 22:11:49 by RouterOS 6.49.7
# software id = 
#
#
#
/interface bridge
add name=loopback
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/routing ospf instance
set [ find default=yes ] distribute-default=if-installed-as-type-1 router-id=\
    1.1.1.1
/ip neighbor discovery-settings
set discover-interface-list=all protocol=lldp
/ip address
add address=10.10.10.1/30 interface=ether2 network=10.10.10.0
add address=10.10.10.5/30 interface=ether3 network=10.10.10.4
add address=1.1.1.1 interface=loopback network=1.1.1.1
/ip dhcp-client
add disabled=no interface=ether1
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1
add action=accept chain=dstnat in-interface=ether1
/routing ospf network
add area=backbone network=10.10.10.0/30
add area=backbone network=10.10.10.4/30
/system identity
set name=R1
