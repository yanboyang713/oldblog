---
title: "Install Tensorflow 2.1 on Ubuntu 18.04 LTS with GPU support"
subtitle: "Nvidia Drivers, CUDA 10 and cuDNN"
date: 2020-00-01T06:11:32+10:00
tags: [ "Tensorflow", "Machine Learning", "Nvidia GPU" ]
categories: [ "GPU" ]
---
## Introduction
This post document is about how to build GPU support environment for Tensorflow 2.1. This document will include install Nvidia driver, CUDA Toolkit, cuDNN on Ubuntu 18.04.

## Hardware Environment

## Secure UEFI Boot

An issue that often arises when attempting to install Nvidia drivers on Linux involves a motherboard setting known as Secure UEFI Boot. In order for the driver installation to be successful it is necessary to disable this setting on most motherboards.

The procedure for carrying this out is highly specific to each particular motherboard. Hence it is difficult to provide detailed instructions that apply to a range of system configurations.

In broad terms it will be necessary to enter the BIOS as the machine boots up. This can usually be achieved by pressing the Del or F10 key. Once in the BIOS it is necessary to navigate to the section that determines boot settings. To disable Secure UEFI Boot it sometimes involves backing up and removing certain keys while in other instances it is simply a boolean setting that is easily modified.

If this feature is not disabled then in all likelihood trouble will arise subsequent to the Nvidia driver installation. Issues may occur when attempting to login in to Ubuntu after bootup. The problem is particularly difficult to resolve as it often involves an inability to load the Ubuntu GUI!

![Installing TensorFlow 2.2 on Ubuntu 18.04 with an Nvidia GPU](https://www.quantstart.com/articles/installing-tensorflow-22-on-ubuntu-1804-with-an-nvidia-gpu/)

![Deep Learning GPU Installation on Ubuntu 18.4](https://towardsdatascience.com/deep-learning-gpu-installation-on-ubuntu-18-4-9b12230a1d31)

TensorFlow GPU support requires an assortment of drivers and libraries. To simplify installation and avoid library conflicts, we recommend using a TensorFlow Docker image with GPU support (Linux only). This setup only requires the NVIDIA® GPU drivers.

## TensorFlow Docker requirements
1. Install Docker on your local host machine.
2. For GPU support on Linux, install NVIDIA Docker support.
+ Take note of your Docker version with docker -v. Versions earlier than 19.03 require nvidia-docker2 and the --runtime=nvidia flag. On versions including and after 19.03, you will use the nvidia-container-toolkit package and the --gpus all flag. Both options are documented on the page linked above.

## Download a TensorFlow Docker image
The official TensorFlow Docker images are located in the tensorflow/tensorflow Docker Hub repository. Image releases are tagged using the following format:

| Tag | Description |
| --- |:-----------:|
| latest | The latest release of TensorFlow CPU binary image. Default.|
| nightly | Nightly builds of the TensorFlow image. (Unstable.) |
| version | Specify the version of the TensorFlow binary image, for example: 2.1.0 |
| devel | Nightly builds of a TensorFlow master development environment. Includes TensorFlow source code.|
| custom-op | Special experimental image for developing TF custom ops. More info [here](https://github.com/tensorflow/custom-op).

Each base tag has variants that add or change functionality:

| Tag Variants | Description |
| ------------ |:-----------:|
| tag-gpu      | The specified tag release with GPU support. (See below) |
| tag-jupyter  | The specified tag release with Jupyter (includes TensorFlow tutorial notebooks) |

You can use multiple variants at once. For example, the following downloads TensorFlow release images to your machine:

```bash
docker pull tensorflow/tensorflow                     # latest stable release
docker pull tensorflow/tensorflow:devel-gpu           # nightly dev release w/ GPU support
docker pull tensorflow/tensorflow:latest-gpu-jupyter  # latest release w/ GPU support and Jupyter

```

## Example
```bash
docker run -it --gpus all --rm -v $(realpath ~/notebooks):/tf/notebooks -p 8888:8888 tensorflow/tensorflow:latest-gpu-jupyter
```
