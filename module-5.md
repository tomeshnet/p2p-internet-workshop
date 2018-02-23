# 5: Measuring networks

Total length:  1.5 hour
Planned:      1.25 hour

| **Section**                                        | **Length** |
|----------------------------------------------------|------------|
| **1: Topic introduction**                          | 15 min     |
| **2: Hands-on and material exploration**           | 40 min     |
| **3: Discussion and reflection activity**          | 20 min     |
| **4: Wrap-up and week ahead**                      | 5 min      |

## 1: Topic introduction

* Review of homework - Net Neutrality
  * Did you know about Net Neutrality?
  * Did you think it was a good thing?
  * Did you ever think about the negative aspects of it being put into law?
  * Are there reasons for traffic shaping or blocking connections
  * Why are large tel-cos interested in having it fail.
* Point: Network is a limited resource that is determined by the infrastructure
* Discuss the need for keeping a pulse of the network
  * What attributes are important to monitor
  * How are these attributes measured?
  * Identify units and what they mean
  * Where have we seen it in our daily lives?

## 2: Hands-on and material exploration

Monitor flow of network traffic using different tools as we do every day digital things.

### Objectives

Learn how these metrics affect us in our day to day lives, and in contrast how the same metrics affect others.

### Materials

* Your cellphone
* Some sort of public WiFi or some sort of Internet connection
* A Raspberry Pi 3 for each participant labeled with the SSID for the node
* SD cards with pre-flashed images with all required software
* Laptops that can establish a SSH session to each Raspberry Pi (each running a Host AP with unique SSID)
* 802.11s capable (e.g. [TP-Link TL-WN722N v1](https://www.tp-link.com/us/download/TL-WN722N_V1.html)) Radio for each Raspberry Pi 3

### Format

Groups (or pairs) to start, class discussion then back to groups again

### Activity

* Review your cell phone usage
  * Identify your apps' data usage
  * Record a few of the top apps that took up the most data
  * Was this data cellular, or WiFi?
* Public WiFi Speed Test
  * Use a speed test tool to test the speed of the public WiFi, record the result
    - IE: Speedtest.net
  * Is it faster or slower than the one you have at home? 
  * Run the speed test again, record the result
  
* Discuss
  * What unit is the data usage of your apps measured in?
  * What does MB mean?
  * What was some of the top app and how much MB did it use? 
    - Have participants volunteer their info if they feel comfortable doing so.
  * Was that surprising?
  * Would you be more/less surprised if it was cellular data? What if it was WiFi data? 
    * Are different data sources worth more?
    * Why? What is your cell data limit?
  
  * What was the unit that the WiFi speed was measured in?
  * What does Mbps mean?
  * How does this relate to the MB from apps?
  * Why was the speed different between tests?
  
* Show Grafana functioning on a node, and describe what it is
  * Access via web interface
  * Show how to select nodes
  
* Break into groups
  * Connect to the node
  * Access the Grafana interface and look around
  * Stream a music file that is located on a node's local webserver and observe the metrics
  * Stream a video file that is located on a node's local webserver and observe the metrics
  * Observe what metrics change if you do the same from a remote node (over the mesh)
  * Can you measure both nodes at the same time?

* Discuss results, ask the following questions:
  * Did difficulty increase measuring two nodes at the same time?
  * What would happen if you had a citywide mesh?
    - Ping time
    - Throughput
    - CPU usage
  * Are some metrics more important than others?
  * How do you represent a mesh network?
    * Physical network topology (i.e. Toronto Mesh map)
    * Virtual peering topology (i.e. fc00.org)

## 3: Discussion and reflection activity

Q & A about sharing broken Internet experiences, understanding failure points and why we measure

  * Break into 3 groups.
  * Each group is assigned a user profile
    - Gamer
    - Streamer (Youtube, Netflix etc)
    - Basic Web user (Email, Web, Im.)
  * Spend 10 minutes discussing the characteristics of this user and what metrics are important to them and why. Consider some of these questions.
    - What are the most used services on the users network? 
    - How would the user be affected if the Internet went down?
    - What would the user consider "down".
    - What is the threshold for the user
      - Packet loss/poor link quality
      - Latency/ping
      - Bandwidth speed
      - Bandwidth allotment
    - Does network traffic trend change throughout the day for the user's connection?
    - Look at your local Internet provider (Bell, Rogers etc), which plan would you suggest for them and why
    - Does wired vs Wireless affect the experience?

  * Have each group spend 2 minutes presenting their user Profile and their findings
  * Make the assumption that the 3 profiles live in the same household
  * Pose the question - 
    - Does that change any of the recommendations is so how?

    ## 4: Wrap-up and week ahead

