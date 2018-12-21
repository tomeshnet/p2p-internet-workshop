# Building the Peer-to-Peer Internet
_**Workshop Series** by [Toronto Mesh](https://tomesh.net)_

[![Build Status](https://travis-ci.org/tomeshnet/p2p-internet-workshop.svg?branch=master)](https://travis-ci.org/tomeshnet/p2p-internet-workshop)
[![GitHub release](https://img.shields.io/github/release/tomeshnet/p2p-internet-workshop.svg)](https://github.com/tomeshnet/p2p-internet-workshop/releases)

## Description

Participants will learn about community networks, wireless mesh networks, distributed applications, and train their pet Raspberry Pi to do networking things. While this course assumes no technical expertise, all sessions contain a technical hands-on component and a reflection activity to explore the role of technologies on our society. A socially-minded tinkerer who enjoys a collaborative learning experience will be the ideal participant.

This course can be facilitated in an environment without internet access. Participants will be expected to bring their own laptop.

**Duration:** 1.5 hours per week for 6 weeks  
**Discussion:** [#p2p-internet-workshop:tomesh.net](https://chat.tomesh.net/#/room/#p2p-internet-workshop:tomesh.net)

## Module Topics

1. [What is mesh?](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-1/)
1. [Setting up your first node](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-2/)
1. [Building nodes (hardware)](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-3/)
1. [Planning a network](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-4/)
1. [Measuring networks](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-5/)
1. [Living on a decentralized network](https://tomeshnet.github.io/p2p-internet-workshop/articles/module-6/)

## Learning Outcomes

- Working with Raspberry Pi's to make a network router
- Building mesh networks and running peer-to-peer applications
- Understanding the barriers to access and the history of the internet in Toronto as well as mesh networks worldwide
- Unpacking the values of distributed vs. centralized systems
- Applying network security and private communications
- Starting and maintaining a sustainable community mesh network

## Expectations

- Each participant will have a hardware kit
- Participants will bring their own laptop
- Participants will receive primer information via a [welcome email](https://tomeshnet.github.io/p2p-internet-workshop/articles/general/general-welcome-email.pdf), which includes [laptop setup instructions](https://tomeshnet.github.io/p2p-internet-workshop/articles/general/general-laptop-setup-instructions.pdf), a Linux shell primer, and a [pre-workshop survey](https://tomeshnet.github.io/p2p-internet-workshop/articles/general/general-pre-workshop-survey.pdf)
- Participants are comfortable using a computer before, with no assumptions about prior programming or networking knowledge

## Facilitation Guidelines

- Each module should be presented by a lead facilitator driving the session according to the lesson plan
- Aim to have one helper for every 6 students, responsible for:
    - Providing assistance during hands-on sections
    - Keeping groups on schedule for each activity
    - Having one helper observe the class and providing feedback ([sample reflection questions](http://www.teachhub.com/teaching-strategies-value-self-reflection))
- Use a [shared notepad](https://pad.riseup.net/p/peer-to-peer-internet) for:
    - Sharing notes and links
    - Jargon-busting
- Conclude with a [ticket out the door](http://www.ideasforeducators.com/idea-blog/a-twist-on-ticket-out-the-door) activity where students can optionally and anonymously leave feedback as they leave the class

## Workshop Materials

Class materials are written as [Markdown](https://en.wikipedia.org/wiki/Markdown) files and presentation slides are created as a Markdown-based [GitBook](https://www.gitbook.com). All generated assets are hosted on [GitHub Pages](https://tomeshnet.github.io/p2p-internet-workshop/) and packaged as a downloadable archive on [GitHub Releases](https://github.com/tomeshnet/p2p-internet-workshop/releases/latest).

When facilitating the workshop in an offline environment, you can run `gitbook serve` from a `presentation` directory to serve the slides on `http://localhost:4000`.

If you want to generate course assets yourself, simply run `./install-dependencies.sh` and `./build.sh`. You will find the generated assets in the `output` folder. The `./package.sh` script is used to zip up the generated assets into downloadable archives and to create the course website.

[Travis CI](https://travis-ci.org/) is configured to build, package, and publish a new release to GitHub Pages and Releases whenever a new tag is pushed. So all you need to create a new release is to push a new tag with `git tag <version>` and `git push --tag`.

## Hardware

Each node consists of one:

* Raspberry Pi 3B or 3B+ with power supply
* SD card with 8 GB or more space
* [TOP-S5 USB WiFi adapter](https://github.com/phillymesh/802.11s-adapters/blob/master/toplinkst-top-s5/toplinkst-top-s5.md) from [Toplinkst](https://toplinkst-wifi.en.made-in-china.com/product/NyaQzvYEsGWL/China-Top-S5-802-11A-B-G-N-300Mbps-Rt5572-Dual-Band-USB-Wireless-Module-with-Ce-FCC-for-STB.html)

It is possible to use other [USB WiFi adapters](https://github.com/phillymesh/802.11s-adapters/blob/master/README.md) with `rt2800usb`, `ath9k_htc`, or `rtl8192cu` drivers with [slight modifications to the software](https://github.com/benhylau/mesh-workshop/tree/master/src/custom/etc/systemd/network).

Other accessories:

* Ethernet cables
* A network switch may come in handy
* LoRa hardware for _Module 6: Living on a decentralized network_

## Software

1. Download the [latest mesh-orange release](https://github.com/benhylau/mesh-router-builder/releases/latest) of `raspberrypi3-<version>_default.img`, then flash the image onto an SD card with a tool like [Etcher](https://www.balena.io/etcher/).

2. Download the [latest mesh-workshop release](https://github.com/benhylau/mesh-workshop/releases/latest) and unpack it. Mount the FAT partition of the SD card you flashed in the previous step, then use the tool `mesh-workshop` to install workshop files on each node:

		$ ./mesh-workshop
		Usage:   mesh-workshop confpath nodename
		Example: mesh-workshop /Volumes/BOOT/conf.d/ bloor

	The example shows a path to your SD card on Mac OS, your local path may differ. The command installs node profile and workshop files to the SD card `conf.d` for the node with hostname `bloor`.

## Credits

The first version of this syllabus is created by [Toronto Mesh](https://tomesh.net) contributors: [@benhylau](https://github.com/benhylau), [@darkdrgn2k](https://github.com/darkdrgn2k), [@dcwalk](https://github.com/dcwalk), [@uditvira](https://github.com/uditvira), [@Shrinks99](https://github.com/Shrinks99), and [@Pedro-on-a-bike](https://github.com/Pedro-on-a-bike). While most of the material is created new, the course also incorporates many prior works listed [here](https://tomeshnet.github.io/p2p-internet-workshop/articles/general/general-extra-resources.pdf), or otherwise referenced in their individual course modules.

Hands-on activities rely on software from many projects: [mesh-orange](https://github.com/tomeshnet/mesh-orange), [mesh-router-builder](https://github.com/benhylau/mesh-router-builder), [mesh-workshop](https://github.com/benhylau/mesh-workshop/), [steamlink](https://github.com/steamlink), [cjdns](https://github.com/cjdelisle/cjdns/), [Yggdrasil](https://yggdrasil-network.github.io/about.html), [IPFS](https://ipfs.io/), [Secure Scuttlebutt](https://github.com/ssbc/). Course material generation uses [markdown-pdf](https://github.com/alanshaw/markdown-pdf) and [gitbook-cli](https://github.com/GitbookIO/gitbook-cli). The course website is built with [Jekyll](https://jekyllrb.com/), and the theme is from [Mozilla's Open Leadership Training Series](https://github.com/mozilla/open-leadership-training-series). Icons from [Font Awesome](http://fontawesome.io/) and [Jake Ingman](https://thenounproject.com/search/?q=mesh&i=74809) are used.

## License

All _Building the Peer-to-Peer Internet_ workshop materials at [github.com/tomeshnet/p2p-internet-workshop/](https://github.com/tomeshnet/p2p-internet-workshop/) are licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/), the text of which is included in the repository `LICENSE` file.
