![rekall-logo](https://github.com/blacktop/docker-rekall/raw/master/docs/logo.png) Dockerfile
=============================================================================================

[![CircleCI](https://circleci.com/gh/blacktop/docker-rekall.png?style=shield)](https://circleci.com/gh/blacktop/docker-rekall) [![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org) [![Docker Stars](https://img.shields.io/docker/stars/blacktop/rekall.svg)](https://hub.docker.com/r/blacktop/rekall/) [![Docker Pulls](https://img.shields.io/docker/pulls/blacktop/rekall.svg)](https://hub.docker.com/r/blacktop/rekall/) [![Docker Image](https://img.shields.io/badge/docker image-114.5 MB-blue.svg)](https://hub.docker.com/r/blacktop/rekall/)

This repository contains a **Dockerfile** of [Rekall](http://www.rekall-forensic.com/index.html).

### Dependencies

-	[blacktop/yara:3.4](https://registry.hub.docker.com/u/blacktop/yara/)

### Image Tags

```bash
REPOSITORY          TAG                 SIZE
blacktop/rekall     latest              114.5 MB
blacktop/rekall     1.6                 114.5 MB
blacktop/rekall     w-gui               130.7 MB
blacktop/rekall     1.5                 97.84 MB
blacktop/rekall     profiles            1.972 GB
```

> NOTE: To use rekall **offline** use `blacktop/rekall:profiles`

### Installation

1.	Install [Docker](https://docs.docker.com).
2.	Download [trusted build](https://hub.docker.com/r/blacktop/rekall/) from public [Docker Registry](https://hub.docker.com/): `docker pull blacktop/rekall`

### Getting Started

```bash
$ docker run -it --rm -v /path/to/mem:/data:rw blacktop/rekall -f silentbanker.vmem pslist
```

![pslist-example](https://github.com/blacktop/docker-rekall/raw/master/docs/pslist_example.gif)

### Documentation

#### Rekall GUI

```bash
 $ docker run -d -p 80:8000 -v /path/to/mem:/data:ro blacktop/rekall:w-gui webconsole --worksheet /tmp --host 0.0.0.0 --port 8000
```

![gui-home](https://github.com/blacktop/docker-rekall/raw/master/docs/gui-home.png)

![gui-silentbanker](https://github.com/blacktop/docker-rekall/raw/master/docs/gui-silentbanker.png)

##### To use **blacktop/rekall** like a host binary

Add the following to your bash or zsh profile

```bash
alias rekall='docker run -it --rm -v $(pwd):/data:rw blacktop/rekall $@'
```

### Issues

Find a bug? Want more features? Find something missing in the documentation? Let me know! Please don't hesitate to [file an issue](https://github.com/blacktop/docker-rekall/issues/new) and I'll get right on it.

### CHANGELOG

See [`CHANGELOG.md`](https://github.com/blacktop/docker-rekall/blob/master/CHANGELOG.md)

### Contributing

[See all contributors on GitHub](https://github.com/blacktop/docker-rekall/graphs/contributors).

Please update the [CHANGELOG.md](https://github.com/blacktop/docker-rekall/blob/master/CHANGELOG.md) and submit a [Pull Request on GitHub](https://help.github.com/articles/using-pull-requests/).

### License

MIT Copyright (c) 2014-2016 **blacktop**
