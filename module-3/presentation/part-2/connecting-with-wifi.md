# Connecting with WiFi

## Infrastructure mode

Most common setup for WiFi:

* Router acts as an Access Point (AP)
* Each device connects to it to communicate
* Single point of failure, the router

## Mesh mode

There are two different modes that we can use to create a mesh:

* Independent Basic Service Set (IBSS)
  * Also known as Ad-hoc
  * Much older and more supported
* Mesh Point (802.11s)
  * A new specification
  * Not many devices support this mode
  * Many useful features
 
## Meshing in Linux

To mesh in Linux you issue the following commands:

* Turn off the interface:
  * `ip link set dev <interface> down`
* Switch to a mesh mode:
  * `iw <interface> set type <mode>`
* Turn on the interface:
  * `ip link set dev <interface> up`
* Join a group at a particular frequency:
  * `iw dev <interface> <mode> join <group name> <frequency>`
* Assign an IP address:
  * `ip addr add <ip address>/24 dev <interface>`
