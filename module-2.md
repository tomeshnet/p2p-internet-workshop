# 2: Setting up your first node 

Total length:  1.5 hour
Planned:      1.25 hour

| **Section**                                        | **Length** |
|----------------------------------------------------|------------|
| **1: Topic introduction**                          | 15 min     |
| **2: Hands-on and material exploration**           | 40 min     |
| **3: Discussion and reflection activity**          | 20 min     |
| **4: Wrap-up and week ahead**                      | 5 min      |

## 1: Topic introduction

- Summarize "homework" takeaways and answer questions around basic networking
- Discuss network security and privacy primitives

## 2: Hands-on and material exploration

### Objective

Set up a very basic network in class as manually as possible with the following goals:

- Allow students to relate familiar day-to-day user interfaces (i.e. a desktop browser or a mobile app) to the physical infrastructure that carry our communications (i.e. an ethernet cable or a wireless radio)
- Allow opportunity for students to tinker with command line tools, and help each other out to encourage an atmosphere of peer-to-peer learning, since we expect varying degrees of experience and comfort with typing into a shell from our audience (small set of simple commands with recoverable states)
- Concretize abstract concepts discussed earlier such as _IP addresses_ and _centralize points of failure in hierarchical networks_
- As we go through the steps in the activity, make a connection between what we are building to concepts that we have discussed before

### Materials

- An even number of Raspberry Pi 3s
- SD cards with mesh-orange images with all necessary interfaces pre-configured and programs pre-installed (e.g. ifconfig, netcat, cjdns)
- Ethernet cables equaling the number of Raspberry Pis
- Laptops that can make a SSH session to each Raspberry Pi (each running a Host AP with unique SSID)
- Two USB WiFi radios that are ad-hoc or 802.11s-capable (e.g. TP-Link TL-WN722N)
- A 4-port network switch (to demo network centralization)
- A physical lock with a key (to demo end-to-end encryption)

### Activity

- Each group needs a pair of Raspberry Pis and one ethernet cable connecting them
- Each group will have two laptops, each connecting to one of their Raspberry Pi's Host AP and initiate a SSH session to `pi@10.0.0.1` (the pre-configured address of the Host AP interface)
- Use `ifconfig eth0 192.168.1.X` to assign IPs to their interfaces
    - Assignment of an IP address with `ifconfig` is like associating a street address to your mailbox
- Use `netcat` to send plaintext messages to one another
- Use `netcat` to send HTTP protocol messages to one side running a pre-configred webserver and receive a response back
    - Manually `echo`ing plaintext and HTTP messages into `netcat` is like you performing the task of an application (including our day-to-day ones, and the peer-to-peer ones we were playing with the week before)
- End the group stage and take four volunteers to form a more-than-two-node network using the network switch
    - Point out two people in different groups may have selected the same IPv4 address, like how two previously disjoint communities gave the same street name and house number, which only becomes a problem when we bridge these two communities (talk about NAT and self-assignment of IPv6)
- Show how we can talk to multiple addresses from one node
    - If there is an outage at the switch none of the nodes can communicate anymore, and that is similar to our Internet Service Providers in traditional network topologies
- As a class, construct the following network topology to form a mesh network and send a message from one edge node to the other, utilizing the middle one as relay:
    ```
    +--------------------+          +-------------------------------------+                +----------------+
    | NODE_A with        | wireless | NODE_B with                         | ethernet cable | NODE_C with    |
    | mesh point adapter +----------+ mesh point adapter + ethernet cable +================+ ethernet cable |
    | running cjdns      |          | running cjdns                       |                | running cjdns  |
    +--------------------+          +-------------------------------------+                +----------------+
    ```
    - Explain mesh routing over relay `NODE_B`
    - Explain IPv6 self-addressing
    - Explain how end-to-end encryption makes the middle node unaware of what is in the data stream (also make analogy to mailing a locked package where the recipient has the key to open the lock)
- We have built a mesh network by hand!

## 3: Discussion and reflection activity



## 4: Wrap-up and week ahead

- Go home and connect to a Hyperboria server to retrieve some content / solve a riddle
