Peer-to-peer social network on a mesh
=====================================

## Running Secure Scuttlebutt (SSB)

1. Start SSB in the background:

    **root@example:~#** `docker load --input ~/docker/tomeshnet-ssb-0.6.tar`
    **root@example:~#** `docker run --name ipfs --network host --detach tomeshnet/ssb:0.6`

    With these two commands, we have used a tool called `docker` (which we will not go into detail for now) to load all the files required to run IPFS, then told the Raspberry Pi to run IPFS in the background. You won't see much visual output, but next we will start interacting with this application.

1. Initiate an interactive session:

    **root@example:~#** `docker exec -it ssb sh`

1. Check your identity within the social network:

    **/ #** `sbot whoami`

    This SSB ID represents you, and only you can post legitimate messages associated with this ID.

1. See who else is around:

    **/ #** `sbot gossip.peers`

    Nodes running SSB are announcing their presence across this mesh network. If the list is empty, that means no one else is running SSB in here yet. Ask around!

1. Publish a message:

    **/ #** `sbot publish --type post --text "Hello, world"`

    This publishes a public message associate with your SSB ID.

1. See what messages have been published:

    **/ #** `sbot log`

    You should see your published message, and those published by others across the network, each associated with their author's ID.

1. We have starting building a proof-of-concept web interface, it is running on your Raspberry Pi at:

    `http://example.local/view.php`

    Much more polished SSB clients exist that run as a standalone application on your desktop. Visit https://www.scuttlebutt.nz for more information!