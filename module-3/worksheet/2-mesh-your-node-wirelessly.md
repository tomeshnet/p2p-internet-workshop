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

You are now connected to and able to run commands from your Raspberry Pi. The Raspberry Pis are currently not connected to all the other ones in the room. Find a partner and we will manually get the two Raspberry Pis to talk over a mesh with a series of commands provided. For the rest of this activity, we will use `example` to represent one node, and `example2` to represent the other.

## Determine your interface

1. Raspberry pi can prepare interfaces out of order.  To make sure we do not accidently change the settings on the node running the Access Point wi will confirm the interface names.
    **root@example:~#** `iw dev`
 
   You should see one interfaces with `type: AP`. This is your Access Point that use use to conenct to the node wirelessly.
   
1. Make note of the interface node that is *NOT* your `AP`. It will most likly be `wlan1`

## Creating your mesh

1. Partner up with some one at the table.  You will be a new mesh group.

1. Decide on a name for your newly formed mesh.  Keep it simple and one word.  Don't spend to much time on this.

1. Use the commands provided to create a mesh network between the two nodes

## Grow your mesh

1. Now that you have successfully created your mesh, find another group in your proximity

1. Expand your mesh two include the new group
