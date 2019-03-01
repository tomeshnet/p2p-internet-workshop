Mesh your node wirelessly
===========================

## Connecting to your Raspberry Pi

1. Verify that the Raspberry Pi has the SD card in place. Power on the device and wait for a solid green light with a flashing red light.

1. Connect your computer's WiFi Client to the Raspberry Pi's WiFi Access Point:

    - SSID: `<hostname>`
    - Password: `password`

1. Once your computer is connected to the WiFi Access Point, you can access the Raspberry Pi via a Secure Shell (SSH):

    - Host: `<hostname>.local` (or `10.0.0.1`)
    - Username: `root`
    - Password: `root`

    On **macOS or Linux** using **Terminal**, enter `ssh root@example.local` followed by the password `root`.

    On **Windows** using the **PuTTY** graphical interface, enter the `Host` and select `SSH` then click `Open` to initiate an SSH session. Enter the `Username` and `Password` when prompted.

You are now connected to and able to run commands from your Raspberry Pi. The Raspberry Pis are currently not connected to all the other ones in the room. Find a partner and we will manually get the two Raspberry Pis to talk over a wireless mesh with a series of commands provided. For the rest of this activity, we will use `example` to represent your node.

## Finding your mesh interface

1. The Raspberry Pi may prepare network interfaces out of order. To make sure we do not accidentally change the settings on the interface running the Access Point (and disconnect us from the Pi) we will first confirm the interface names:

    **root@example:~#** `iw dev`
 
   You should see one of the interfaces with `type: AP`. This is the Access Point that your computer uses to connect to the node wirelessly.
   
1. Make note of the interface that is _not_ your `AP`. It will most likely be `wlan1`.

## Creating your mesh network

1. Partner up with someone at the table to form a new mesh group.

1. Decide on a name for your newly formed mesh. Keep it simple and a single word. Don't spend too much time on this.

1. Use the commands provided to create a mesh network between the two nodes, with the following substitutions:

    * Make sure you use the correct `wlanX` network interface that you noted above.
    * Replace `MY_MESH_NAME` with the mesh name you decided on.
    * Assign each node a different IP address. For example, `192.168.0.1` for the first and `192.168.0.2` for the second.

## Testing your mesh network

1. Use `ping` to ping the other connected node and see if it responds.

1. You can check to see what nodes are connected by doing a station dump:

    **root@example:~#** `iw wlanX station dump`

## Growing your mesh network

1. Now that you have successfully created your small mesh network, find another group in your proximity.

1. Expand your mesh to include the new group.

1. Now repeat it with another group.
