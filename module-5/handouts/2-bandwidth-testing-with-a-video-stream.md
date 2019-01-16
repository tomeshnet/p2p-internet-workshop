Bandwidth testing with a video stream
=====================================

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

For this workshop you will need to open two SSH connections. Repeat the last step to open a second session.

## Measuring bandwidth with `bwm-ng`

1. `bwm-ng` (Bandwidth Monitor - Next Generation) is a software tool that allows you to see your network usage in real-time. It will list all your interfaces, and how much traffic is moving through them in each direction. In one of your SSH prompts, start `bwm-ng` with the following command:

    **root@example:~#** `bwm-ng`

    Notice the screen that displays all the interfaces on your Raspberry Pi and the current bandwidth being used. Locate the line that contains `wlan0:`. This is the interface for your wireless Access Point. We will be monitoring this connection.

1. Understand what the three number columns for each interface represent:

    | Column  | Description                              |
    |:--------|:-----------------------------------------|
    | `Rx`    | Amount of data being received            |
    | `Tx`    | Amount of data that is being transmitted |
    | `Total` | The sum of Rx and Tx                     |

1. Values by default are updated every `0.500s` (half a second). You can use the `+` and `-` keys to increase or decrease the sampling. Set the probing interval to `0.500s`.

1. Values by default are in `KB/s` (kilobytes per second). You can use the `u` key to cycle between:

    | Unit   | Description          |
    |:-------|:---------------------|
    | `KB/s` | Kilobytes per second |
    | `kb/s` | Kilobits per second  |
    | `P/s`  | Packets per second   |
    | `E/s`  | Errors per second    |

    Set the unit to `kb/s`.

1. Values by default are shown as `rate`. You can use the `t` key to cycle between:

    | Type        | Description                                     |
    |:------------|:------------------------------------------------|
    | `rate`      | Value on the interface when it was polled       |
    | `max`       | Highest number seen on the interface            |
    | `sum`       | Total data passed since the program was started |
    | `avg (30s)` | Average of the past 30 seconds                  |

    Set the type to `rate`.

## Streaming video content with the wireless interface

1. Keeping the `bwm-ng` program open in our first SSH session, we will now use the other SSH session to start a mini webserver with `nweb` to share the contents of the `www` folder on the Raspberry Pi:

    **root@example:~#** `nweb 8080 www`

1. From the browser of your computer, go to:

    `http://10.0.0.1:8080/bunny.mp4`

    While you enjoy the first few seconds of this short movie, notice the changing values in the `bwm-ng` window. Do you notice spikes in traffic every 30 seconds or so? If not, change to `avg (30s)`, and the spikes will seem to last longer. Keep the video playing for at least 30 seconds to see the spikes.

    When streaming a video, the computer will buffer information ahead of time. This allows the video to continue playing even if there is an interruption in the link. With a fast connection, the buffer fills up very quickly. These are the short spikes.

1. Download the video to your computer. What happens to the bandwidth in `bwm-ng`?

    Did you see the bandwidth increase and stay high for the duration of the download? Since you requested the file to be downloaded, instead of buffering blocks as you stream, your computer fetched the entire file as fast as it could. The 9-minute video downloaded in seconds!

1. Now we will now use the `tc` (Traffic Control) command to limit the available bandwidth on the wireless interface of the Raspberry Pi. This will emulate a slower internet connection. In the SSH session not running `bwm-ng`, run the following:

    **root@example:~#** `tc qdisc add dev wlan0 handle 1: root htb default 1`
    **root@example:~#** `tc class add dev wlan0 parent 1:1 classid 1:1 htb rate 512kbit`

    This limits the bandwidth to only 512 kilobits per second. This is approximately the upload (Tx) speed of a classic 6 Mbps ADSL, that is still used in many areas in Canada.

    Reload the video on your browser:

    - What happens to the bandwidth?
    - How does it differ from the previous steps?
    - What happens to the video?
    - Does the video play smoothly?

1. Clear the traffic control by running:

    **root@example:~#** `tc qdisc del dev wlan0 root`

1. Repeat the process using values of `1mbit` and `3mbit`. Accomplish this by replacing the `512kbit` value in the above commands with one of the new values.

    To save yourself from having to re-type the whole line, you should be able to use the ↑ and ↓ keys to cycle through previous commands you entered, then you can modify them.

    Remember to keep the video playing for at least 30 seconds, and to run `tc qdisc del dev wlan0 root` to clear the settings.