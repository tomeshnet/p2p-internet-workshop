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
- Discuss social, political and technical reasons for a mesh
- Succinct high-level slides on many pieces that will be explored in more detail in upcoming modules:
    - two minutes on historic Toronto networks
    - two minutes on community mesh networks in North America and other parts of the world
    - general landscape of technologies like flashing routers with OpenWrt to install some mesh routing software
- Set realistic expectations of the state of mesh technology

## 2: Hands-on and material exploration

### Objectives

- Experience local peer-to-peer applications that are relatable to those we are familiar with from the Internet (e.g. Facebook, Dropbox, Whatsapp, Twitter, Spotify)
- "Run your own app" on pre-configured nodes and contrast "serverless" applications on a distributed physical network vs. traditional centralized edge services via ISP networks

**Ideas for peer-to-peer applications:**

_Preference to those that require minimal steps (e.g. exchanging keys, after `docker start`) and have a familiar UI._

    - Secure Scuttlebutt / Patchwork (need to pin public keys)
    - IPFS (auto peer but need to share content hash)
    - RetroShare
    - (Chat?)
    - (Collaborative text editor?)
    - (Audio/Video streaming, could be part of IPFS?)
    - See [Portable Network Kit](http://pnkgo.com) for types of services they run on a Raspberry Pi

### Materials

A _Raspberry Pi 3 Kit_ for each student that includes:

- USB WiFi radio that is ad-hoc or 802.11s-capable (e.g. TP-Link TL-WN722N)
- SD card with [mesh-orange](https://github.com/tomeshnet/mesh-orange) pre-configured to mesh wirelessly with cjdns
- Tools to discover node identity in the ad-hoc network and share human-readable names with others (e.g. [ssb-dns](https://github.com/ansuz/dnssb))
- Contain Docker image for Secure Scuttlebutt and multiple Patchwork clients (i.e. [scuttlebot](https://github.com/ssbc/scuttlebot), [patchwork](https://github.com/ssbc/patchwork), [patchbay](https://github.com/ssbc/patchbay), [patchfoo](https://github.com/ssbc/patchfoo))

### Format

- Individuals

### Activity

- Boot all the Raspberry Pi nodes and see that they all wirelessly mesh with one another
- Connect student laptop to each Raspberry Pi's Host AP and initiate a SSH session to `pi@10.0.0.1` (the pre-configured address of the Host AP interface)
- Run `docker up` on each node to start a Secure Scuttlebutt node on this ad-hoc Patchwork social network
- Visit `http://10.0.0.1:PORT` to use the desired Patchwork UI and send public and private messages to new friends in this class' local mesh network

## 3: Discussion and reflection activity

- Reflect on the role of technology in society

## 4: Wrap-up and week ahead

- [Routing and the Postal System](https://www.youtube.com/watch?v=n7NBgJAhzZ0) from the [Metamesh YouTube channel](https://www.youtube.com/channel/UCGEnntxbGKMU9J9GIZ1LQUQ)
    - Compares IP routing to postal delivery system
    - Explains acronyms like IP, DHCP, and NAT
    - Explains how addresses are distributed and routing in hierarchical ISP networks
    - Provides background for future discussions about self-addressing of IPv6 and mesh based "flat" routing
