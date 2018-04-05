# Peer-to-peer applications

```
          Last-mile content mesh network
                     +----------------+
                     |                |    ...
       +------------>| +----------------+
       |             +-|                |    ...
+------+--+----------->| +----------------+
| Your    |            +-| Mesh peer with +--> More peers
| home    +------------->| content store  |
| devices |              +----------------+
+---------+  ipfs://some-resource-hash
```

- Distribute the content to mesh nodes such that you can access them from your peers, or through your peers to their peers, and so on
- The content-addressing scheme, as opposed to traditional host-addressing, allows you to self-verify integrity of the data, so you generally don't have to trust where the data is coming from
- The replication of content across distributed nodes along with the point-to-point nature of the physical communication infrastructure make it difficult for single actors to monitor, censor, or destroy information access to a region, it does not necessitate large collections of personal information, and makes possible more democratic forms of moderation
