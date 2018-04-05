# Peer-to-peer file sharing on a mesh

Each Raspberry Pi:
- Has a unique name in the form of `<hostname>.local`
- Advertises a WiFi SSID `<hostname>` which you can connect with `password` as password
- Connects to other in-range Raspberry Pis via a second WiFi interface and forms a mesh

We will use the [InterPlanetary File System (IPFS)](https://ipfs.io), a peer-to-peer hypermedia protocol, to share content with one another.

You can think of the Raspberry Pi as your home router and modem connecting to your ISP, except now it has a direct line to other content-serving mesh nodes just like itself, and has superpowers because it runs like a full computer.
