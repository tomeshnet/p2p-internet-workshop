# Bits and Bytes

* Bits
 - A bit holds only 1 or 0 (on or off)
 - They are denoted by a lower case b (ie b or b/s Kbps etc)
* Byte
 - Contains 8 bits
 - Denoted by a upper case B (ie B or B/s KBps etc)
 
* Kilo
 - Lower case k has a value of 1000 (kbps)
 - Upper case k has a value of 1024 (KBps)
   - Used only when dealing with bytes
 
# Network Attributes

## Volume (Bytes or bits)

 * Collected over time
 * Sum of all bits/bytes sent and received
 * Common tool to keep track of this is `MRTG
 
## Speed/Bandwidth (Bytes or Bits per second)

 * How much data over a period of time
 * Common tool to test is called `iperf3`
 
## Round Trip Times (seconds)
 * Acronym RTT
 * Calculation how long it takes for a packet to reach the destination and back again
 * Common tool to test this is `ping` or `noping`

## Jitter (seconds)
 * The time difference between how long packets take to travel to the destination
 * Usually done in UDP packets
 * Common tool to test this is `ipef3` using UDP packets
 
## Packet Loss
 * Measurement of the number of packets that did not reach their destination
 * Packets sometimes are re-transmitted other times ignores
 * Common tool to test this is `ping` and `noping`
