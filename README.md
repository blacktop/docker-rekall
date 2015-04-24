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
```bash
_EPROCESS          Name          PID   PPID   Thds    Hnds    Sess  Wow64           Start                     Exit
---------- -------------------- ----- ------ ------ -------- ------ ------ ------------------------ ------------------------
0x810b1660 System                   4      0     59      183      - False  -                        -
0xff25a7e0 alg.exe                216    676      6      105      0 False  2010-08-11 06:06:39+0000 -
0xff3667e8 VMwareTray.exe         432   1724      1       49      0 False  2010-08-11 06:09:31+0000 -
0xff374980 VMwareUser.exe         452   1724      7      192      0 False  2010-08-11 06:09:32+0000 -
0x80f94588 wuauclt.exe            468   1028      4      135      0 False  2010-08-11 06:09:37+0000 -
0xff2ab020 smss.exe               544      4      3       21      - False  2010-08-11 06:06:21+0000 -
0xff1ecda0 csrss.exe              608    544     11      365      0 False  2010-08-11 06:06:23+0000 -
0xff1ec978 winlogon.exe           632    544     18      511      0 False  2010-08-11 06:06:23+0000 -
0xff247020 services.exe           676    632     16      269      0 False  2010-08-11 06:06:24+0000 -
0xff255020 lsass.exe              688    632     19      345      0 False  2010-08-11 06:06:24+0000 -
0xff218230 vmacthlp.exe           844    676      1       24      0 False  2010-08-11 06:06:24+0000 -
0x80ff88d8 svchost.exe            856    676     17      199      0 False  2010-08-11 06:06:24+0000 -
0xff364310 wscntfy.exe            888   1028      1       27      0 False  2010-08-11 06:06:49+0000 -
0xff217560 svchost.exe            936    676     10      270      0 False  2010-08-11 06:06:24+0000 -
0x80fbf910 svchost.exe           1028    676     71     1355      0 False  2010-08-11 06:06:24+0000 -
0xff38b5f8 TPAutoConnect.e       1084   1968      1       61      0 False  2010-08-11 06:06:52+0000 -
0xff22d558 svchost.exe           1088    676      4       79      0 False  2010-08-11 06:06:25+0000 -
0xff3856c0 cmd.exe               1136   1668      0        -      0 False  2010-08-15 19:01:51+0000 2010-08-15 19:01:51+0000
0xff203b80 svchost.exe           1148    676     14      208      0 False  2010-08-11 06:06:26+0000 -
0xff1d7da0 spoolsv.exe           1432    676     13      135      0 False  2010-08-11 06:06:26+0000 -
0xff1b8b28 vmtoolsd.exe          1668    676      5      222      0 False  2010-08-11 06:06:35+0000 -
0xff3865d0 explorer.exe          1724   1708     12      317      0 False  2010-08-11 06:09:29+0000 -
0xff1fdc88 VMUpgradeHelper       1788    676      4      100      0 False  2010-08-11 06:06:38+0000 -
0x80f1b020 IEXPLORE.EXE          1884   1724      9      351      0 False  2010-08-15 18:54:05+0000 -
0xff143b28 TPAutoConnSvc.e       1968    676      5      100      0 False  2010-08-11 06:06:39+0000 - 2010-08-15 19:01:51 UTC+0000
```

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
