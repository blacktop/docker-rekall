#![rekall-logo](https://raw.githubusercontent.com/blacktop/docker-rekall/master/rekall-logo.png)  Dockerfile

This repository contains a **Dockerfile** of [Rekall](http://www.rekall-forensic.com/index.html) for [Docker](https://www.docker.io/)'s [trusted build](https://index.docker.io/u/blacktop/rekall/) published to the public [Docker Registry](https://index.docker.io/).

### Dependencies

* [blacktop/yara](https://registry.hub.docker.com/u/blacktop/yara/)

### Image Tags
```bash
$ docker images

REPOSITORY                 TAG           VIRTUAL SIZE
blacktop/rekall            latest         416.4 MB
blacktop/rekall            w_profiles     707.2 MB
```

### Installation

1. Install [Docker](https://www.docker.io/).

2. Download [trusted build](https://index.docker.io/u/blacktop/rekall/) from public [Docker Registry](https://index.docker.io/): `docker pull blacktop/rekall`

#### Alternatively, build an image from Dockerfile
```bash
$ docker build -t blacktop/rekall github.com/blacktop/docker-rekall
```
### Usage
```bash
$ docker run -i -t -v /path/to/mem:/data:rw blacktop/rekall -f silentbanker.vmem pslist
```
#### Output:
![pslist-example](https://raw.githubusercontent.com/blacktop/docker-rekall/master/pslist_example.gif) 

> Note: To use rekall **offline** use `blacktop/rekall:w_profiles`

### To Run on OSX
 - Install [Homebrew](http://brew.sh)

```bash
$ brew install cask
$ brew cask install virtualbox
$ brew install docker
$ brew install boot2docker
$ boot2docker init
$ boot2docker up
$ $(boot2docker shellinit)
```
Add the following to your bash or zsh profile

```bash
alias rekall='docker run -it --rm -v $(pwd):/data:rw blacktop/rekall $@'
```

### Todo
- [x] Install/Run rekall
- [ ] Start Daemon and watch folder with supervisord
- [ ] Have container take a URL as input and download/scan memory dump
