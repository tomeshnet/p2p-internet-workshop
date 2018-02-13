# 1: What is mesh?

Total length:  1.5 hour
Planned:      1.25 hour

| **Section**                                        | **Length** |
|----------------------------------------------------|------------|
| **1: Topic introduction**                          | 15 min     |
| **2: Hands-on and material exploration**           | 40 min     |
| **3: Discussion and reflection activity**          | 20 min     |
| **4: Wrap-up and week ahead**                      | 5 min      |

## 1: Topic introduction

- Introduce yourself, why you are interested in this workshop
- Discuss familiar topics like net neutrality, internet service providers, and internet censorship
- Explain how a mesh topology differs from ISP internet
- Discuss social, political and technical reasons for a mesh
- Succinct high-level slides on many pieces that will be explored in more detail in upcoming modules:
    - Two minutes on historic Toronto networks
    - Two minutes on community mesh networks in North America and other parts of the world
    - General landscape of technologies like flashing routers with OpenWrt to install mesh routing software
- Set realistic expectations of the state of mesh technology:
	- One minute on low-cost computing and hardware capabilities
	- One minute on WiFi and directional radios
	- State of peer-to-peer applications and how that differs from familiar applications

## 2: Hands-on and material exploration

Trying out peer-to-peer applications running over a decentralized infrastructure.

### Objectives

- Experience local peer-to-peer applications that are relatable to those we are familiar with from the Internet (e.g. Facebook, Dropbox, Whatsapp, Twitter, Spotify)
- "Run your own app" on pre-configured nodes and contrast "serverless" applications on a distributed physical network vs. traditional centralized edge services via ISP networks
- Run [Secure Scuttlebutt](https://github.com/ssbc/secure-scuttlebutt) on Raspberry Pi 3s and exchange content on an ad-hoc peer-to-peer social network

### Materials

A _Raspberry Pi 3 Kit_ for each student that includes:

- Raspberry Pi 3 and power supply
- USB WiFi radio that is [ad-hoc or 802.11s-capable](https://github.com/phillymesh/802.11s-adapters)
- SD card with [mesh-workshop](https://github.com/benhylau/mesh-workshop) pre-configured to mesh wirelessly with cjdns and [scuttlebot-ws](https://github.com/vuldin/scuttlebot-ws) docker
- Paper print-outs with instructions and commands (since no internet connectiviy is required)

### Format

- Individuals

### Activity

- Boot all the Raspberry Pi nodes and see that they all wirelessly mesh with one another
- Connect student laptop to each Raspberry Pi's Host AP and initiate a SSH session to `root@<hostname>.local` (the pre-configured address of the Host AP interface)
- Run `docker load` on each node to start a scuttlebot-ws docker container (pre-loaded into each SD image) to form an ad-hoc social network
- In the SSH session, use [`sbot` CLI](https://scuttlebot.io/docs/basics/publish-a-message.html) in the SSH session to publish messages to each other
- Explain how Secure Scuttlebutt propagates messages across the network
- From laptop clients, browse to `http://<hostname>.local` to use the web UI and send public and private messages to new friends in this class' local mesh network
- Compare the peer-to-peer social network to familiar social networks and discuss differences in data ownership and accessibility

## 3: Discussion and reflection activity

Reflect on the role of technology in society and power, based on [Explore Community Technology: Investigate Technology](https://communitytechnology.github.io/docs/intro-ct/investigate-tech/).

Put a list of popular mobile/web applications on the board (e.g. Facebook, Dropbox, Whatsapp, Twitter, Spotify) and pick the one most used by the audience (e.g. put your hand up if you use this daily). Divide the class into five groups, they spend 10 min to dissect this application (questions sourced from _Investigate Technology_ linked above):

    1. Mission & Ownership
        - What is the goal or mission of the technology?
        - Who owns the technology? 
        - Who makes decisions about it? 
        - How are decisions made?
    1. Design & Access
        - Who designs the technology or system?
        - Who is it designed for?
        - Who can use the technology? 
        - Who is left out?
    1. Community & Local Impact
        - Who is strengthened? 
        - Are local relationships strengthened or weakened? 
        - Is anyone negatively impacted?
        - Is the content made by people in your community? 
        - Is the content for people in your community? 
        - How is the local media ecosystem strengthened or weakened?
    1. Profit & Sustainability
        - Who profits from the technology?
        - Are the profits or results shared?
        - Where does the money go? 
        - Does that technology generate jobs in your community?
    1. Teaching & Learning
        - How are skills and knowledge shared about the technology?
        - Who installs it?
        - Who repairs it?

In the next 10 min, have each group present their findings. As a class, discuss how these answers may differ if the technology is created and maintained by its community of users.

## 4: Wrap-up and week ahead

- Recap that we have:
    - Presented the general state of peer-to-peer networks and services
    - Experimented with a distributed peer-to-peer application run over off-internet mesh network infrastructure
    - Touched upon community models for creating and managing technologies
- Emphasize how distributed systems are less susceptible to some risks that come with centrally governed platforms but also present challenges
- Extrapolate a world where all our day-to-day technologies are run off devices in people's homes
- Next session we will dive into networking on GNU/Linux and explore the layers between the application we used today and the cable or WiFi radio connecting these nodes

### Homework

- [Routing and the Postal System](https://www.youtube.com/watch?v=n7NBgJAhzZ0) from the [Metamesh YouTube channel](https://www.youtube.com/channel/UCGEnntxbGKMU9J9GIZ1LQUQ)
    - Compares IP routing to postal delivery system
    - Explains acronyms like IP, DHCP, and NAT
    - Explains how addresses are distributed and routing in hierarchical ISP networks
    - Provides background for future discussions about self-addressing of IPv6 and mesh based "flat" routing
