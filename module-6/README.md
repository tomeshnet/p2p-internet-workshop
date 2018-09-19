# 6: Living on a decentralized network

| **Section**                                                                        | **Length** |
|------------------------------------------------------------------------------------|------------|
| [**1: Topic introduction**](#1-topic-introduction)                                 | 15 min     |
| [**2: Hands-on and material exploration**](#2-hands-on-and-material-exploration)   | 40 min     |
| [**3: Discussion and reflection activity**](#3-discussion-and-reflection-activity) | 20 min     |
| [**4: Wrap-up and week ahead**](#4-wrap-up-and-week-ahead)                         | 5 min      |
| **Workshop length**                                                                | 1:30 min   |

## 1: Topic introduction

- As the cost of hardware (specifically processors and sensors) drops a lot of the compution and network that's being done isn't just in our computers but in embedded systems all around us
- Discussion format questions:
  - What are some examples of internet connected devices that are not personal computers?
  - As more devices come online what are some new challenges that can arise? Are the security stakes higher?
  - When can it be a bad idea to connect something to the internet? What is at risk?
- Motivation to use low power networks:
  - Accessibility: Energy, cost, simplicity
  - Ideal for community projects (eg. citizen science projects, emergency communication systems)

## 2: Hands-on and material exploration

Try out a toy 900 MHz long range low power network and visualize the packet flow

### Objectives
- Visualize modulated packets using a software defined radio
- Leave the classroom and measure the range of the network using a map software like Google Maps
- Estimate power requirements using a coulomb counter

### Materials
- 1 Rasberry Pi running the "steamlink" LoRa back-end connected to a display unit (projecter would be ideal)
- 4-6 LoRa radio ARM boards (sensor nodes)  with a push-button as the sensor device
- 1 SDR
- 1 coulomb counter

See [this repository](https://github.com/steamlink/p2p-workshop-nodes) for help with setup

### Format
- 4-6 groups

### Activity
- Boot all the sensor nodes and the single Raspberry Pi. The Raspberry Pi should detect sign-on packets from the LoRa nodes and display them on the screen
- Additional packets are sent everytime the button is pressed
- Take turns using the SDR to visual the chirp spread spectrum modulation
- Walk around (including leaving the class room) and see how the packet RSSI changes. How does the RSSI change as the radio signal passes through walls and other objects?
- How far can we go and still receive packets? Use a map software to calculate the distance
- Pass around a coulomb counter to see how much power data packets take during transmission
- Estimate the power limitations for your sensor node by extrapolating from the value you have observed from the Coulomb counter
- If there is more time, we can program the LoRa boards (using Arduino software) to send custom information (for example text or measurement from a light sensor)

## 3: Discussion and reflection activity
- We used a button as a sensor. What are some useful sensors we can use instead?
- What are some applications for a low power network that you would like to build to sense information about your environment or to automate events?
- Based on  our experience so far, what are some things to keep in mind if we build an alternative long-range network for emergency communication?
- Discuss new smart-city projects currently underway. What are some ethical considations we should think about when building private sensor networks in public spaces?
- Is there a trade-off between convenience and privacy/security?

## 4: Wrap-up and week ahead
- Provide useful resources to design and develop with other radio technologies (eg. Mike McCauley's excellent RadioHead library)
- Provide resources on low power micro-controllers for those interested
