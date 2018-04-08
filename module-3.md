# 3: Building nodes (hardware)

| **Section**                                                                        | **Length** |
|------------------------------------------------------------------------------------|------------|
| [**1: Topic introduction**](#1-topic-introduction)                                 | 15 min     |
| [**2: Hands-on and material exploration**](#2-hands-on-and-material-exploration)   | 40 min     |
| [**3: Discussion and reflection activity**](#3-discussion-and-reflection-activity) | 20 min     |
| [**4: Wrap-up and week ahead**](#4-wrap-up-and-week-ahead)                         | 5 min      |
| **Workshop length**                                                                | 1:30 min   |

## 1: Topic introduction

- Break apart the mesh node into its base modules and brief overview of each module's role:
  - Single board computer
  - Storage (SD card) and software (OS)
  - Power supply
  - Radio (onboard and external)
  - Antennas
- Review Homework from Module 2 (radio waves)
- Introduce WiFi concepts as they relate to configuring the radio (frequencies, bands, bandwidth (40 MHz vs 20 MHz), SSID, etc)
- Touch upon licensed and unlicensed frequencies (900Mhz, 2.4Ghz, 5Ghz), how they change from jurisdiction to jurisdiction, and the CRTC as the governing body in Canada.

## 2: Hands-on and material exploration

Group activity to wirelessly mesh with other groups by configuring Raspberry Pis.

### Objectives

- Learn to establish wireless links between nodes and manipulate the nodes' radio properties
- Understand the role that frequency, bands, bandwidth and SSIDs play in a wireless mesh
- Allow opportunity for students to tinker with the radios and create a mesh
- Discover first hand real-world problems with growing the mesh

### Materials

- A Raspberry Pi 3 for each member labeled with the SSID for the node
- SD cards with pre-flashed images with all required software 
- Laptops that can establish a SSH session to each Raspberry Pi (each running a Host AP with unique SSID) 
- USB WiFi radio that is [ad-hoc or 802.11s-capable](https://github.com/phillymesh/802.11s-adapters) for each Raspberry Pi 3 

### Format

- Pairs to start, then work toward establishing a class-wide mesh

### Activity

- As a class review the purpose of each command in a sample starter script
    ```
    ip link set dev wlan1 down
    iw wlan1 set type mp
    ip link set dev wlan1 up
    iw dev wlan1 mesh join MY_MESH_NAME_HERE freq 2412
    ip addr add 192.168.0.1/24 dev wlan0
    ```
- Break into groups of two
- Each group needs a pair of Raspberry Pis
- Each group will connect to their Raspberry Pi's Host AP and initiate a SSH session
- Use ifconfig to identify which wlan interface is which (Hint: look for 10.0.0.1)
- Use ifconfig and iw to create a mesh between the nodes with this sample starter script
- Use `iw wlan1 station dump` to see if connections are established
- Use `iperf3 -s` on one node and `iperf3 -c 192.168.1.x` on another node to test the speed across the link
- Once the nodes are properly meshed, have groups seek out another group that has finished
- Work together to integrate all 4 nodes into one mesh
- Encourage group to continue to merge meshes until all the groups are meshed into one
- End the group stage by discussing
  - Did you seek help with another group to mesh your first two nodes?
  - What where the barriers of connecting to another group?
  - How did you come to a consensus of mesh method, frequency, SSID, ip address schema? Build upon discussion in Module 2
  - Was it easier or harder to connect as the mesh got bigger?
  - Did we manage to mesh the whole class? Why, Why not?
  - Parallel the experience with the real world
    - Mesh locals working together
    - Coming to a consensus working in larger groups
  
## 3: Discussion and reflection activity

Q & A discussion around the different hardware we employ to build a network.

* Discuss alternative components that could be used in a node for different applications and environments
  * SBC (Orange Pi Zero, Rock64, ExpressoBin, Raspberry Pi, etc.)
    * Price point
    * Processing power
    * Power consumption
    * Features (10/100 Ethernet, mPci-e, USB ports, etc.)
  * Power Supply (wall wart, POE, battery, solar panel, lamp post)
  * Storage and OS (OpenWrt/Lede, LibreMesh)
  * Radios 
    * 2.4 Ghz vs 5 Ghz
    * Ubiquiti proprietary protocols meshed over Ethernet

## 4: Wrap-up and week ahead

- Next session we will discuss important factors to consider for deployment and use a mapping activity of the nearby area for planning

### Homework

- Watch Meta Mesh [quick tour of a mesh networking installation](https://www.youtube.com/watch?v=aLusYsScrv0): [https://www.youtube.com/watch?v=aLusYsScrv0](https://www.youtube.com/watch?v=aLusYsScrv0) (4:03)
- Optionally read "[Wireless Networking in the Developing World, Chapter 10: Deployment Planning](http://wndw.net/pdf/wndw3-en/ch10-deployment-planning.pdf)": [http://wndw.net/pdf/wndw3-en/ch10-deployment-planning.pdf](http://wndw.net/pdf/wndw3-en/ch10-deployment-planning.pdf)
- Optionally watch
    - SmartrekTech [How to install a Smartrek wireless mesh network for sugar making purposes](https://www.youtube.com/watch?v=eKkVEeVNhm8 ): [https://www.youtube.com/watch?v=eKkVEeVNhm8](https://www.youtube.com/watch?v=eKkVEeVNhm8) (4:31)
    - [Rural Next Generation Broadband Project](https://www.youtube.com/watch?v=QM7MUWDcNxk): [https://www.youtube.com/watch?v=QM7MUWDcNxk](https://www.youtube.com/watch?v=QM7MUWDcNxk) (6:12)
