---
title: "Getting started with Opencv"
date: 2021-02-06T06:11:32+10:00
tags: [ "Opencv" ]
categories: [ "Opencv" ]
---
## Introduction
OpenCV is a popular framework widely used in the development of products for intelligent video analytics. Such solutions use both classic algorithms of computer vision (e.g. an algorithm for optical flow detection), and AI-based approaches, in particular, neural networks.

## Installing with Docker
build:
```bash
docker build -t my_pi_opencv_img .
```

run:
```bash
docker run -it --rm \
       -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
       -v /home/yanboyang713/Documents/imagezmq:/home \
       --name my_opencv_app_run \
       my_pi_opencv_img \
       /bin/bash
```
+ python -c "import cv2; print(cv2.__version__)" \
+ –device=/dev/video0:/dev/video0 allows use of webcam
+ -v /tmp/.X11-unix:/tmp/.X11-unix helps in X11 forwarding so that we can use functions like cv::imshow.
