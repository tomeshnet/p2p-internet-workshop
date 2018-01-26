# 3: Building nodes (hardware)

Total length:  1.5 hour
Planned:      1.25 hour

| **Section**                                        | **Length** |
|----------------------------------------------------|------------|
| **1: Topic introduction**                          | 15 min     |
| **2: Hands-on and material exploration**           | 40 min     |
| **3: Discussion and reflection activity**          | 20 min     |
| **4: Wrap-up and week ahead**                      | 5 min      |

## 1: Topic introduction

* Break apart NODE into base components and brief overview of its role
  * Single Board Computer
  * Storage (SD Card) and OS
  * Power Supply
  * Radio (Onboard and External)
* Review Homework from Module 2 (Wireless Frequencies)
* Introduce Wi-Fi concepts as they relate to configuring the radio (Frequencies, Bands, Bandwidth  (40mhz vs 20mhz), SSID)
* Touch upon licensed and unlicensed frequencies. (900Mhz, 2.4Ghz, 5Ghz) how they change from jurisdiction  to jurisdiction and some properties of each.
* Quite overview of Wi-Fi descriptions and buzz words (Dual Band, AP, AdHoc/MeshPoint, dBn, Noise, SSID)

## 2: Hands-on and material exploration

### Objectives

Learn to establish wireless links between nodes and manipulate the nodes radio properties.
  * Understand the roll that Frequency, bands, bandwidth and SSIDs play in a wireless mesh
  * Allow opportunity for students to tinker with the radios and create a mesh
  * Discuss modular nature of the node and its components, and alternative solutions and real-world applications of them
  * Discover real-world problems on growing the mesh (foreshadowing module 3 - planning networks)
  
### Materials

* An even number of Raspberry Pi 3s
* SD cards with mesh-orange images with all necessary interfaces pre-configured and programs pre-installed (e.g. ifconfig, netcat, cjdns, iperf3)
* Laptops that can make a SSH session to each Raspberry Pi (each running a Host AP with unique SSID) 
* Two USB Wi-Fi radios that are ad-hoc and 802.11s-capable (e.g. TP-Link TL-WN722N) and if possible dual band

### Format

* Pairs to start, then work to a class large mesh.

### Activity

* Each group needs a pair of Raspberry Pis
* Each group will require to connect to their Raspberry Pi's Host AP and initiate a SSH session to pi@10.0.0.1 (the pre-configured address of the Host AP interface)
* Use ifconfig to identify which wlan interface is which (Hint: look for 10.0.0.1)
* Use ifconfig and iw to create a mesh between the nodes with this starter script

 ```
  ifconfig wlan1 down
  iw wlan1 set type mp
  ifconfig wlan1 up
  iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 2412
  ifconfig wlan1 192.168.1.x
```

**IDEA:** *Provide a "starter script" with slight variation in the configuration permutations (meshpoint vs ad-hoc, frequency changes ip address ranges, mesh name) to each group, this will provide a more "real world" example of what happens when two groups of people want to mesh together which we will see in the later part of this workshop *

* Use ```iw wlan1 station dump``` to see of connections are established
* Use ```iperf -s``` on one node and ```iperf -c 192.168.1.x``` on another node to test the speed across the link
* Make a note that all the hostapds are using channel 1 (2412Mhz) creating additional noise
* Manipulate the configuration (starter script) to change the frequencies and bandwidth and retest
* Test CJDNS IPV6 address speeds as well
* Make contact with another group and work out a way to connect all 4 of your nodes together
* Test the speed between the various nodes
* Make contact with yet another group, and continue to expand your network
* End the group stage by discussing
  * Did you work with another group in phase one of the project?
  * What where the barriers of connecting to another group?
  * How did you come to a consensus of mesh method, frequency, ssid, ip address schema? Build upon discussion in module 2 regarding this.
  * Was it easier or harder to connect as the groups got bigger?
  * Did we manage to mesh the whole class? Why, Why not?
  * Provide insight that this is what happens in the real world, as these are some challenges that are faced in community owned networks.

## 3: Discussion and reflection activity

* Discuss alternate components  that could be used in a node, what are the advantages, disadvantages and environments.
  * SBC Orange Pi Zero, Rock64, ExpressoBin, Raspberry  Pi Etc
    * Price point
    * Processing Power
    * Power consumption
    * Features (10/100 ethernet, mPcie, usb ports etc)
  * Power Supply (Wall Wart, POE, Battery, Solar Panal)
  * Storage and OS (OpenWrt/Lede, LibreMesh, SD cards write wear and lifespan)
  * Radios 2.4 Ghz, vs 5 Ghz, support, FCC ruling  regarding SDR and binary blobs making drivers harder to come by.
  
## 4: Wrap-up and week ahead

