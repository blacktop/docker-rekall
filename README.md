![rekall-logo](https://raw.githubusercontent.com/blacktop/docker-rekall/master/logo.png) Dockerfile
===================================================================================================

[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/rekall.svg)](https://hub.docker.com/r/blacktop/rekall/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/rekall.svg)](https://hub.docker.com/r/blacktop/rekall/)

This repository contains a **Dockerfile** of [Rekall](http://www.rekall-forensic.com/index.html).

### Dependencies

-	[blacktop/yara](https://registry.hub.docker.com/u/blacktop/yara/)

### Image Tags

```bash
$ docker images

REPOSITORY                 TAG           VIRTUAL SIZE
blacktop/rekall            latest         115 MB
blacktop/rekall            w_profiles     487 MB
```

### Installation

1.	Install [Docker](https://www.docker.io/).

2.	Download [trusted build](https://index.docker.io/u/blacktop/rekall/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/rekall`

### Usage

```bash
$ docker run -it --rm -v /path/to/mem:/data:rw blacktop/rekall -f silentbanker.vmem pslist
```

#### Output:

![pslist-example](https://raw.githubusercontent.com/blacktop/docker-rekall/master/pslist_example.gif)

> Note: To use rekall **offline** use `blacktop/rekall:w_profiles`

Add the following to your bash or zsh profile

```bash
alias rekall='docker run -it --rm -v $(pwd):/data:rw blacktop/rekall $@'
```
