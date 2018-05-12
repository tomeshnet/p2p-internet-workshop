Test bandwidth speed on streaming
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

2. For this workshop you will need to open two SSH connections.  Repeat step 1 to open a second one.

## Measuring Bandwidth with `bwm-ng`

bwm-ng (Bandwidth Monitor - Next Generation) is a software that allows you to see your network usage in real time. It will list all your interfaces, and how much traffic is moving through them in each direction.

1. In one of your SSH prompts start bwm-ng with the following command

**root@example:~#** `bwm-ng`

Notice the screen that displays all the interfaces on your Raspberry Pi and the current bandwidth being used.   Locate the line that container "wlan0:". This is the interface for your wireless access point.  We will be monitoring this connection.

There are 3 columns of numbers in each time
RX - This is the amount of data that is being received
TX - This is the amount of data that is being send (or transmit)
Total - The sum of RX and TX

Here are some ways to interact with bwm-ng

Values by default are updated every 0.500 seconds (half a second).   
You can use the **+** and **-** keys to increase or decrease the sampling. 
Set this value to 0.500 s

Values by default are in KB/s (Kilo Bytes per Second)  
You can use the *u* key to cycle between 
 * KB/s (Kilo Bytes per second)
 * kb/s (kilo bits per second)
 * P/s (Packets per second)
 * E/s (Errors per second)

Set this to kb/s

Values by default are shown at Rate 

You can use the `t` key to cycle between 
 * rate - the value that was on the interface when it was polled
 * max - highest number seen on the interface
 * sum - total data that has passed since the program was started
 * avg (30s) - The average of the past 30 seconds

Set this to rate


## Stream a video

Leaving the bwm-ng open we will now use the other shell window we will interact with the Raspberry Pi there.

1. Start a mini webserver sharing the contents of the folder www on the Raspberry Pi by running
**root@example:~#**  ```./server.bin 8080 www```


2. In your browser visit

`http://10.0.0.1:8080/bunny.mp4`

While you enjoy the first few seconds of this short movie, notice the values of the *bwm-ng* window.

Do you notice spikes in traffic every 30 seconds or so? If not change to avg 30 they will seem to last longer.

Keep the video playing at least 30 seconds to see these spikes?

When streaming a video the computer will buffer information ahead of time.  This allows it to continue playing if there is an interruption in the link. With a fast connection the buffer fills up very quickly. These are the short spikes.

3. If you can, save the video to your computer. What happened to the bandwidth?

Did you see the bandwidth increase and stay high for the period of the download.  Since you requested the file to download, it did not buffer, but rather just request the file as fast as it could.  The 9 minute video downloaded in seconds.


Now we will now use the Linux `tc` (Traffic Control) command to limit the available bandwidth on the wireless interface of the Raspberry Pi. This will emulate a slower internet connection.

4. In the shell window not running *bwm-ng* run the following command

**root@example:~#** ```tc qdisc add dev wlan0 handle 1: root htb default 1```
**root@example:~#** ```tc class add dev wlan0 parent 1:1 classid 1:1 htb rate 512Kbit```


This limits the bandwith to only 512Kilo bits per second.  This is about the upload (tx) speed of a classic 6Mbps adsl, that is still used in many areas in Canada.

Then reload the video on your browser.

What happened to the bandwidth? How did it differ from the previous step(s)
What happened to the video? Does the video play smoothly?


5.  Clear the traffic control by running 
**root@example:~#** ```tc qdisc del dev wlan0 root```

6. Repeat the process using values of 1Mbit and 3Mbit. Accomplish this by replacing the 512Kbit value in the above commands with one of the new values.

*Tip* To save yourself from having to re-type the whole line, you should be able to use the arrows up and down to cycle through the last command you entered, then you can modify them.

Remember to keep the video playing at least 30 seconds.

Run `tc qdisc del dev wlan0 root` to clear the settings.

