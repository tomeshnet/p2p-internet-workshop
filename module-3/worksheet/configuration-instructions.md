=Table 1=
```
ip link set dev wlan1 down
iw wlan1 set type mp
ip link set dev wlan1 up
iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 2412
ip addr add 192.168.0.1/24 dev wlan1
```

```
ip link set dev wlan1 down
iw wlan1 set type mp
ip link set dev wlan1 up
iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 5240 
ip addr add 192.168.0.1/24 dev wlan1
```



=Table 2=
```
ip link set dev wlan1 down
iw wlan1 set type mp
ip link set dev wlan1 up
iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 2437
ip addr add 192.168.0.1/24 dev wlan1
```

```
ip link set dev wlan1 down
iw wlan1 set type ibss
ip link set dev wlan1 up
iw dev wlan1 ibss join MY_MESH_NAME_HERE 2437
ip addr add 192.168.0.1/24 dev wlan1
```


=Table 3=

```
ip link set dev wlan1 down
iw wlan1 set type ibss
ip link set dev wlan1 up
iw dev wlan1 ibss join MY_MESH_NAME_HERE 5745
ip addr add 192.168.0.1/24 dev wlan1
```


```
ip link set dev wlan1 down
iw wlan1 set type ibss
ip link set dev wlan1 up
iw dev wlan1 ibss join MY_MESH_NAME_HERE 5180 
ip addr add 192.168.0.1/24 dev wlan1
```
