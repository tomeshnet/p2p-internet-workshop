# Mesh topology

```
                                                +---------+
                                                | Dropbox |
               Last-mile mesh network           | data    |
                                                | centre  |
                                  +----------+  +---------+
                     +------+     | Other    |    ^  ^
                     |      |---->| internet |    |  |
       +------------>| +------+   | service  +----+  | Internet
       |             +-|      |-->| provider |       |
+------+--+----------->| +------+ +----------+  +----+-----+
| Your    |            +-| Mesh |               | Internet |
| home    +------------->| peer +-------------->| service  |
| devices |              +------+               | provider |
+---------+  https://dropbox.com/some-resource  +----------+
```

- [Great Firewall of China](https://en.wikipedia.org/wiki/Great_Firewall) routinely scans, censors, and modifies internet traffic
- In 2017 leading up to the Catalan referendum, the Spanish government [raided the .cat internet registry to take down domains](https://www.theregister.co.uk/2017/09/23/spanish_government_criticized_over_catalan_internet_registry_raid/) and [had Google remove the polling station app from the Android app store](https://www.thespainreport.com/articles/1166-170929190146-google-removes-catalan-referendum-app-from-google-play-after-catalan-high-court-issues-take-down-order)
- [Equifax data breach of 2017](https://arstechnica.com/information-technology/2017/09/why-the-equifax-breach-is-very-possibly-the-worst-leak-of-personal-info-ever/) demonstrated significant security risk associated with large collections of personal information
