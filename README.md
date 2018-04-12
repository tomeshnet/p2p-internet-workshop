# Building the Peer-to-Peer Internet

[![GitHub release](https://img.shields.io/github/release/tomeshnet/p2p-internet-workshop.svg)](https://github.com/tomeshnet/p2p-internet-workshop/releases)

**Workshop Series** _by Toronto Mesh_, [tomesh.net/peer-to-peer-internet](https://tomesh.net/peer-to-peer-internet/)

## Description

Participants will learn about community networks, wireless mesh networks, distributed applications, and train their pet Raspberry Pi to do networking things. While this course assumes no technical expertise, all sessions contain a technical hands-on component and a reflection activity to explore the role of technologies on our society. A socially-minded tinkerer who enjoys a collaborative learning experience will be the ideal participant.

Participants will be expected to bring their own laptop. 

**Schedule:** Tuesdays April 10 - May 15, [register through the Toronto Public Library workshop](https://www.torontopubliclibrary.ca/detail.jsp?Entt=RDMEVT23011&R=EVT23011)  
**Duration:** 1.5 hours per week for 6 weeks  
**Discussion:** https://chat.tomesh.net/#/room/#reading-networks:tomesh.net

## Module Topics

1. [What is mesh?](./module-1/README.md)
1. [Setting up your first node](./module-2/README.md)
1. [Building nodes (hardware)](./module-3/README.md)
1. [Planning a network](./module-4/README.md)
1. [Measuring networks](./module-5/README.md)
1. [Living on a decentralized network](./module-6/README.md)

## Learning Outcomes

- Working with Raspberry Pi's to make a network router
- Building mesh networks and running peer-to-peer applications
- Understanding the barriers to access and the history of the internet in Toronto as well as mesh networks worldwide
- Unpacking the values of distributed vs. centralized systems
- Applying network security and private communications
- Starting and maintaining a sustainable community mesh network

## Expectations

- TPL will provide Raspberry Pi 2s and 3s
- Participants will bring their own laptop
- Participants will receive primer information via a [welcome email](./general/welcome-email.txt), which includes [laptop setup instructions](./SETUP.md), a Linux shell primer, and a [pre-workshop survey](./general/pre-workshop-survey.md)
- Participants are comfortable using a computer before, with no assumptions about prior programming or networking knowledge

## Facilitation Guidelines

- Each module should be presented by a lead facilitator driving the session according to the lesson plan
- Aim to have one helper for every 3 to 4 students, responsible for:
    - Providing assistance during hands-on sections
    - Keeping groups on schedule for each activity
    - Having one helper observe the class and providing feedback ([sample reflection questions](http://www.teachhub.com/teaching-strategies-value-self-reflection))
- Use a [shared notepad](https://pad.riseup.net/p/peer-to-peer-internet) for:
    - Sharing notes and links
    - Jargon-busting
- Conclude with a [ticket out the door](http://www.ideasforeducators.com/idea-blog/a-twist-on-ticket-out-the-door) activity where students can optionally and anonymously leave feedback as they leave the class

## Course Design

### Objectives

- Create syllabus with sufficient flexibility so it can be adapted to Toronto Libraries in other areas and other settings
- With a community network project as basis, establish regular hack nights at the Toronto Libraries' Innovation Hubs
- Engage students and equip them with necessary knowledge to continue involvement in local mesh community efforts
- Publish this as open-source syllabus that other communities can adopt to kick-start a mesh community

### Workshop Materials

Workshop materials such as lesson plans and worksheets are written as simple [Markdown](https://en.wikipedia.org/wiki/Markdown) files. Each presentation slide deck is created as a Markdown-based [GitBook](https://www.gitbook.com). All generated assets are published to [GitHub Releases for download](https://github.com/tomeshnet/p2p-internet-workshop/releases).

If you want to generate these assets yourself, simply run `./build` and you will find the generated assets in the `output` folder. The `./release` script is used to zip up the generated assets into archives convenient for publishing, which is the form you will find in the GitHub Releases.

When using the GitBook presentations at a workshop, it is most convenient to clone this repository, navigate to the appropriate presentation directory of the module, and serve the gitbook locally by running `gitbook serve`, then navigate to [localhost:4000](http://localhost:4000) from your browser to see the slides.

### Credits

- [@benhylau](https://github.com/benhylau)
- [@darkdrgn2k](https://github.com/darkdrgn2k)
- [@uditvira](https://github.com/uditvira)
- [@Pedro-on-a-bike](https://github.com/Pedro-on-a-bike)
- [@Shrinks99](https://github.com/Shrinks99)
- [@dcwalk](https://github.com/dcwalk)
