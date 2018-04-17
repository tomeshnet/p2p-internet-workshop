# Top-level domains

What happens when you register `tomesh.net` through a Domain Name Registrar like Namecheap?

- Namecheap requests the Internet Corporation for Assigned Names and Numbers (ICANN) to add a new entry
- ICANN directs the Top-Level Domain (TLD) server to add the new entry

When I type `tomesh.net` into my browser:

- One of those thirteen root servers check which TLD server is responsible for resolving `.net`
- The TLD server for `.net` run by Verisign replies `159.203.15.166` is where I want to go

In reality, most resolutions are done by root server-mirroring DNS servers run by ISPs and other institutions.
