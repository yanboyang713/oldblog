---
title: "Getting started with FFmpeg"
date: 2020-00-07T06:11:32+10:00
tags: [ "ffmpeg" ]
---
## Overview
FFmpeg is a free software project and is the leading software for everything related to multimedia like video encoding, streaming and muxing.

FFmpeg - "FF" mean "Fast Forward", "mpeg" mean "Moving Picture Expers Group"

## Installation
https://github.com/jrottenberg/ffmpeg

https://www.whoishostingthis.com/compare/ffmpeg/resources/



alias ffmpeg='docker run -v=`pwd`:/tmp/ffmpeg opencoconut/ffmpeg'



```bash
yay -S ffmpeg
```



## Using Linux Terminal to Install VLC in Ubuntu
sudo snap install vlc

## Invert the video stream to a virtual video camera
If your video stream is inverted, you can make a new virtual video camera which inverts the inverted video. You need to install v4l-utils and also v4l2loopback-dkms.

```bash
yay -S v4l-utils v4l2loopback-dkms
```

## Create the virtual video camera:
```bash
modprobe v4l2loopback
```

Check the name of the newly created camera:
```console
[yanboyang713@boyang ~]$ v4l2-ctl --list-devices
Dummy video device (0x0000) (platform:v4l2loopback-000):
	/dev/video0
```

Then you can run ffmpeg to read from your actual webcam (here /dev/video0) and invert it and feed it to the virtual camera:

$ ffmpeg -f v4l2 -i /dev/video0 -vf "vflip" -f v4l2 /dev/video1
You can use the "Dummy" camera in your applications instead of the "Integrated" camera.

Bad image quality
If you experience images being too bright, too dark, too exposed or any other, you can install v4l2ucpAUR to tweak your image output.

