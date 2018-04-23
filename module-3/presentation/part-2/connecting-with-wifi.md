# Connecting with WiFi

## Infrastructure mode
 Most common setup for WiFi
* Router acts as an Access Point (AP)
* Each device connects to it to communicate
* One point of failure, the router

## Mesh mode

There are two different modes that we can use to create a mesh

* IBSS (Independent Basic Service Set)
 * Also known as AdHoc 
 * Much older and more supported
* 802.11s (Mesh Point)
 * is a new specification 
 * Not allot of devices support them
 * Many usefull features
 
 
## Mesh in Linux

To mesh in Linux you preform the following tasks

* Turn off the interface - `ip link set dev <interface> down`
* Switch to a mesh mode - `iw <interface> set type <mode>`
* Turn on the interface ` ip link set dev <interface> up`
* Join a frequency and group `iw dev <interface> <mode> join <group name> <frequency>`
* Assign an IP address - `ip addr add <ipaddress>/24 dev <interface>`
