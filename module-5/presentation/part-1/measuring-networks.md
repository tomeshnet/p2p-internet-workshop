# Measuring networks

>Measuring networks provides a single point-in-time calculation of an attribute of a network.

## Why do we measure networks?

- What is expected of our network and what is the reality?
- How can we improve the network?
- Is the user experience acceptable?

## Monitoring as long-term measuring

- Monitoring networks provides a constant measurement
- Most monitoring suites provide:
  - Means of collecting measurement results, _push_ or _poll_
  - Means of storing this data for a long period of time
  - Means of querying or viewing the data collected

## Push vs. poll

**Push**

- Provides event-driven information
- Requires nodes to be operational
- Usually only one node provides access to the information

**Poll**

- Monitoring node requests information from each reporting device
- Monitoring node knows when a node is non-responsive
- Allows possiblity for any node to be monitor
- Provides more consistent information but uses more bandwidth