# Peer-to-peer file sharing on a mesh

Each Raspberry Pi:
- Has a unique name in the form of `<hostname>.local`
- Advertises a WiFi SSID `<hostname>` which you can connect with `password` as password
- Connects to other in-range Raspberry Pis via a second WiFi interface to form a mesh

We will use the [InterPlanetary File System (IPFS)](https://ipfs.io), a peer-to-peer hypermedia protocol, to share content with each other on our own network.

You can think of the Raspberry Pi as your home router and modem connecting to your Internet Service Provider (ISP), except now it has a direct line to other content-serving mesh nodes just like itself, and has superpowers because it runs like a full computer.
