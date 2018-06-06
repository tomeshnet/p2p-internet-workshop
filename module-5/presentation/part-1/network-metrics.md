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
