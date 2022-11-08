## Topology

![ospf-topology](./ospf-with-mikrotik-topology.png)

Pada topologi ini semua router akan berada terhubung pada backbone area

> Autonomous system boundary router adalah router yang mendistibusikan protokol non OSPF ke area yang menngunakan protokol OSPF
> Router yang berada di backbone area disebut dengan backbone router
> Router yang berada di masing-masing area disebut dengan router internal
> Area border routing adalah router yang menghubungkan antar area

### Role

`Router 1` Sebagai AS Boundary Router

##### Add interface loopback

interface loopback ditambahkan pada setiap router sebagai RID

> Pada OSPF Router ID digunakan untuk mengidentifikasi setiap router

```
/interface bridge
add name=loopback
```

##### Configurasi ip masing-masing router

`Router 1`

```
/ip address
add address=10.10.10.1/30 interface=ether2 network=10.10.10.0
add address=10.10.10.5/30 interface=ether3 network=10.10.10.4
add address=1.1.1.1 interface=loopback network=1.1.1.1
/ip dhcp-client
add disabled=no interface=ether1
```
