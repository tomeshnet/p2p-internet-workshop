# Network metrics

## Volume _(bits or bytes)_

- Collected over time
- Sum of all bits/bytes sent and received
- Common tool to keep track of this is `MRTG` (Multi Router Traffic Grapher)
 
## Speed _(bps or Bps)_

- Also called "bandwidth" sometimes
- How much data over a period of time
- Common to test between two points using `iperf3`
 
## Round trip time _(seconds)_

- Commonly called "RTT"
- Time for a packet to reach the destination and back
- Common tool to test this is `ping` or `noping`

## Jitter _(seconds)_

- Difference between time packets take to reach the destination
- Usually measured with UDP packets
- Common tool to test this is `iperf3` using UDP packets
 
## Packet loss

- The number of packets that do not reach the destination
- Packets are sometimes re-transmitted, other times ignored
- Common tool to test this is `ping` and `noping`