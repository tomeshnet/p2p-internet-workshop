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

- Activity for audience to "run their own app" on pre-configured nodes, where the apps are relatable with those we are familiar with from the Internet (e.g. Facebook, Dropbox, Whatsapp, Twitter, Spotify)
- See [Portable Network Kit](http://pnkgo.com) for types of services they run on a Raspberry Pi
- Make docker container for each peer-to-peer service on pre-configured nodes so they can be launched easily and reliably (prepare two, preference for those that require minimal steps, e.g. exchanging keys, after `docker start` and have a familiar UI):
    - IPFS (auto peer but need to share content hash)
    - Secure Scuttlebutt / Patchwork (need to pin public keys)
    - RetroShare
    - (Chat?)
    - (Collaborative text editor?)
    - (Audio/Video streaming, could be part of IPFS?)

## 3: Discussion and reflection activity

- Reflect on the role of technology in society

## 4: Wrap-up and week ahead

- [Routing and the Postal System](https://www.youtube.com/watch?v=n7NBgJAhzZ0) from the [Metamesh YouTube channel](https://www.youtube.com/channel/UCGEnntxbGKMU9J9GIZ1LQUQ)
    - Compares IP routing to postal delivery system
    - Explains acronyms like IP, DHCP, and NAT
    - Explains how addresses are distributed and routing in hierarchical ISP networks
    - Provides background for future discussions about self-addressing of IPv6 and mesh based "flat" routing
