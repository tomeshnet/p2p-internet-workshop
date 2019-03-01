```
ip link set dev wlanX down
iw wlanX set type mp
ip link set dev wlanX up
iw dev wlanX mesh join MY_MESH_NAME freq 2412
ip addr add 192.168.0.Y/24 dev wlanX
```

---

```
ip link set dev wlanX down
iw wlanX set type mp
ip link set dev wlanX up
iw dev wlanX mesh join MY_MESH_NAME freq 5240 
ip addr add 192.168.0.Y/24 dev wlanX
```

---

```
ip link set dev wlanX down
iw wlanX set type mp
ip link set dev wlanX up
iw dev wlanX mesh join MY_MESH_NAME freq 2437
ip addr add 192.168.0.Y/24 dev wlanX
```

---

```
ip link set dev wlanX down
iw wlanX set type ibss
ip link set dev wlanX up
iw dev wlanX ibss join MY_MESH_NAME 2437
ip addr add 192.168.0.Y/24 dev wlanX
```

---

```
ip link set dev wlanX down
iw wlanX set type ibss
ip link set dev wlanX up
iw dev wlanX ibss join MY_MESH_NAME 5745
ip addr add 192.168.0.Y/24 dev wlanX
```

---

```
ip link set dev wlanX down
iw wlanX set type ibss
ip link set dev wlanX up
iw dev wlanX ibss join MY_MESH_NAME 5180 
ip addr add 192.168.0.Y/24 dev wlanX
```
