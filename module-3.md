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
* Break apart the mesh node into its base modules and brief overview of each module's role
  * Single board computer
  * Storage (SD card) and software (OS)
  * Power supply
  * Radio (onboard and external)
  * Antennas
* Review Homework from Module 2 (radio waves)
* Introduce WiFi concepts as they relate to configuring the radio (frequencies, bands, bandwidth (40 MHz vs 20 MHz), SSID, etc)
* Touch upon licensed and unlicensed frequencies (900Mhz, 2.4Ghz, 5Ghz), how they change from jurisdiction to jurisdiction, and the CRTC as the governing body in Canada.

## 2: Hands-on and material exploration

Group activity to wirelessly mesh with other groups by configuring Raspberry Pis.

### Objectives

Learn to establish wireless links between nodes and manipulate the nodes' radio properties.
* Understand the roll that frequency, bands, bandwidth and SSIDs play in a wireless mesh
* Allow opportunity for students to tinker with the radios and create a mesh
* Discover first hand real-world problems with growing the mesh

### Materials

* A Raspberry Pi 3 for each member labeled with the SSID for the node
* SD cards with pre-flashed images with all required software 
* Laptops that can establish a SSH session to each Raspberry Pi (each running a Host AP with unique SSID) 
* 802.11s capable (e.g. TP-Link TL-WN722N v1) Radio for each Raspberry Pi 3 

### Format

* Pairs to start, then work toward establishing a class-wide mesh.

### Activity

* As a class review the purpose of each command in a sample starter script
```
ifconfig wlan1 down
iw wlan1 set type mp
ifconfig wlan1 up
iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 2412
ifconfig wlan1 192.168.1.x
```
* Break into groups of two
* Each group needs a pair of Raspberry Pis
* Each group will require to connect to their Raspberry Pi's Host AP and initiate a SSH session
* Use ifconfig to identify which wlan interface is which (Hint: look for 10.0.0.1)
* Use ifconfig and iw to create a mesh between the nodes with this sample starter script
* Use `iw wlan1 station dump` to see of connections are established
* Use `iperf -s` on one node and `iperf -c 192.168.1.x` on another node to test the speed across the link
* Once the nodes are properly meshed, have groups seek out another group that has finished
* Work together to integrate all 4 nodes into one mesh
* Encourage group to continue to merge meshes until all the groups are meshed into one

* End the group stage by discussing
  * Did you seek help with another group to mesh your first two nodes?
  * What where the barriers of connecting to another group?
  * How did you come to a consensus of mesh method, frequency, SSID, ip address schema? Build upon discussion in module 2.
  * Was it easier or harder to connect as the mesh got bigger?
  * Did we manage to mesh the whole class? Why, Why not?
  * Parallel the experience with the real world
    * Mesh locals working together
    * Coming to a consensus working in larger groups
  
## 3: Discussion and reflection activity

Q & A discussion around the different hardware we employ to build a network.

* Discuss alternative components that could be used in a node for different applications and environments
  * SBC (Orange Pi Zero, Rock64, ExpressoBin, Raspberry Pi Etc)
    * Price point
    * Processing power
    * Power consumption
    * Features (10/100 Ethernet, mPci-e, USB ports etc)
  * Power Supply (wall wart, POE, battery, solar panel, lamp post)
  * Storage and OS (OpenWrt/Lede, LibreMesh)
  * Radios 
    * 2.4 Ghz vs 5 Ghz
    * Ubiquiti proprietary protocols meshed over Ethernet
    * FCC ruling regarding SDR and binary blobs making drivers harder to come by

## 4: Wrap-up and week ahead


- Watch one (or all) of:
    - https://www.youtube.com/watch?v=aLusYsScrv0 (4:03)
    - https://www.youtube.com/watch?v=eKkVEeVNhm8 (4:31)
    - https://www.youtube.com/watch?v=QM7MUWDcNxk (6:12)
- (Stretch) Read: "Wireless Networking in the Developing World, Chapter 10: Deployment Planning"
     - http://wndw.net/pdf/wndw3-en/ch10-deployment-planning.pdf


