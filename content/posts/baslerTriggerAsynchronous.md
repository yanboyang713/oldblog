---
title: "Getting started with Multi-Basler Trigger Asynchronous"
date: 2020-01-02T06:11:32+10:00
tags: [ "Basler", "OpenCV" ]
category: [ "Basler" ]
---
## Introduction

## Software Trigger Asynchronous
### Synchronous Free Run
https://docs.baslerweb.com/synchronous-free-run
The Synchronous Free Run camera feature allows you to capture images on multiple cameras at the same time and the same frame rate.

#### How It Works
If you are using multiple cameras in free run mode, image acquisition is slightly asynchronous due to a variety of reasons, e.g., the camera's individual timings and delays.
![](https://docs.baslerweb.com/images/drawing-synchronous-free-run-disabled.svg)

The Synchronous Free Run feature allows you to synchronize cameras in free run mode. As a result, the cameras will acquire images at the same time and at the same frame rate.
![](https://docs.baslerweb.com/images/drawing-synchronous-free-run-enabled.svg)

Also, you can use the Synchronous Free Run feature to capture images with multiple cameras in precisely time-aligned intervals, i.e., in a chronological sequence. For example, you can configure one camera to start image acquisition at a specific point in time. Then you configure another camera to start 100 milliseconds after the first camera and a third camera to start 200 milliseconds after the first camera:
![](https://docs.baslerweb.com/images/drawing-synchronous-free-run-enabled-2.svg)

Also, you can configure the cameras to acquire images at the same time and the same frame rate, but with different exposure times:



### Action Commands
https://docs.baslerweb.com/action-commands

### Scheduled Action Commands
https://docs.baslerweb.com/scheduled-action-commands

## Hardware Trigger Asynchronous

