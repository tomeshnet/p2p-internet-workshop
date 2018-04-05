Peer-to-peer file sharing on a mesh
===================================

## Connecting to your Raspberry Pi

1. Verify that the Raspberry Pi has its WiFi adapter(s) proper connected SD card is in place. Power on the device and wait for a solid green LED with a flashing red LED.

1. Connect your computer's WiFi Client to the Raspberry Pi's WiFi Access Point:

        SSID:       <hostname>
        Password:   password

1. Once connected to the Access Point from your computer, you can connect to it with SSH password `root`:

        $ ssh root@<hostname>.local

    For example, on `bloor` the command would be `ssh root@bloor.local`. You can optionally connect to the IP address directly without using mDNS `ssh root@10.0.0.1`.

1. Find a Raspberry Pi near you can try to ping it to verify the mesh network interface is working. For example:

        root@bloor:~# ping college.local

    Hit `Ctrl + C` to stop the ping.

You are now a mesh node operator running commands from your pet Raspberry Pi, which is connected to the rest of the mesh network we just formed in this room! For the rest of this activity, we will continue to use `bloor` to represent your node, and `college` to represent another node near you. Be sure to replace these with the name of your own pet Raspberry Pi. 

## Running the InterPlanetary File System (IPFS)

1. Start IPFS in the background:

        root@bloor:~# docker load --input ~/docker/tomeshnet-ipfs-0.1.tar
        root@bloor:~# docker run --name ipfs --network host --detach tomeshnet/ipfs:0.1 

1. Initiate an interactive session and write a message to the peer-to-peer filesystem:

        root@bloor:~# docker exec -it ipfs sh
        / # echo "Hello World" | ipfs add

1. Using the content hash from the `ipfs add` output, which is uniquely derived from your `Hello World` text, read the content back:

        / # ipfs cat QmWATWQ7fVPP2EFGu71UkfnqhYXDYH566qy47CnJDgvs8u

1. We are also running an ipfs-to-http gateway that can be accessed from clients connected to the Access Point of the Raspberry Pi. You can use a URL formatted like this to access ipfs content from the client browser:

        http://<hostname>.local:8080/ipfs/<ipfs-content-hash>

    For example, http://bloor.local:8080/ipfs/QmWATWQ7fVPP2EFGu71UkfnqhYXDYH566qy47CnJDgvs8u

1. Try to echo other text and read it back in the shell and display it in your browser

You can actually add any type of file, such as photos and videos, to IPFS, and regardless of the file size you can address (and verify!) them with a short content hash like this. So far we have created and fetched content from the IPFS running on our pet Raspberry Pi, but we have not shared any file across the mesh network. Let's do that!

## Forming an IPFS content network

1. In order to form a network, you need two nodes to know about each other. So let's start with finding your identity in the network and sharing it with another node:

        / # ipfs id

    Note the address that starts with `/ip6/fc` and looks something like this:

        /ip6/fcb0:3f14:ebc8:1f7b:a1ce:bd44:a410:5049/tcp/4001/ipfs/QmXLWSa1AbLJfivfT9dQJdvs6AsdMkjZjjBMv5SVtimVBq

    The `/ip6/fc00::/8` is your mesh node's unique cjdns IPv6 address, which we will talk about in the next workshop, and the part after `/ipfs/` is your IPFS node ID. Copy this line to a note pad and we will paste it into another node

1. Type `exit` to leave the IPFS session for now, then start a SSH session from your Raspberry Pi to another Raspberry Pi:

        root@bloor:~# ssh college.local

1. Yes we are in two levels of SSH sessions, but that's ok :) Now we initiate an interactive session to IPFS on `college`, then add your address to tell it about your node:

        root@college:~# docker exec -it ipfs sh
        / # ipfs bootstrap add /ip6/fcb0:3f14:ebc8:1f7b:a1ce:bd44:a410:5049/tcp/4001/ipfs/QmXLWSa1AbLJfivfT9dQJdvs6AsdMkjZjjBMv5SVtimVBq

    Now your nodes are peered to form an IPFS network, which means `bloor` can access any content in the network accessible to `college`, and vice versa. It doesn't take many peerings to connect all the nodes in this room.

1. Now let's add some content on `college`, then type `exit` twice to return to `bloor`, and try to read that text back on `bloor` and from your browser. It may take a while after you first establish peering, but eventually the content will become available across the network.

To recap, we started an IPFS daemon and ipfs-to-http gateway in a docker container, then peered two nodes to create an IPFS content-addressing network. Each mesh node is now also an IPFS node that publishes and fetches content within our local mesh network.

How does this exercise compare to your experience with content storage services like Dropbox and Google Drive?
