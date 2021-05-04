---
title: Launching RStudio in Docker
date: 2021-03-01T06:11:32+10:00
tags:
categories: virtual environment
---
## Introduction
RStudio Server enables you to provide a browser based interface to a version of R running on a remote Linux server, bringing the power and productivity of the RStudio IDE to server-based deployments of R.

In this blog, I will talk about how to launch a Docker container that allows us to run RStudio in a browser using the --rm flag when we run Docker makes the container ephemeral that mean it is automatically deleted after we close the container. We do this as to not build up a large collection of containers on our machine and waste space. After, I will talk how to link a volume of our local host disk to the Docker container if we want to be able to access and save data, scripts and any other files.

### Prerequisite
Docker installation. Docker is available for Mac/Windows/Linux and is easily installed. You can following the link at the below for install Docker.
{% post_link dockerInstall %}

#### Launching RStudio in Docker
We will ask Docker to run an image that already exists, we will use the **verse** Docker image from [Rocker](https://github.com/rocker-org/rocker/wiki) which will allow us to run RStudio inside the container and has many useful R packages already installed.

This command will lead RStudio-Server to launch invisibly.
```bash
docker run --rm -e PASSWORD=yourpasswordhere -p 8787:8787 rocker/verse
```

**NOTE:** You must set a unique PASSWORD (not 'rstudio') first!

Optional: -p and --rm are flags that allow you to customize how you run the container. ***-p*** tells Docker that you will be using a port to see RStudio in your web browser (at a location which we specify afterwards as port 8787:8787). Finally, ***–rm*** ensures that when we quit the container, the container is deleted. If we did not do this, everytime we run a container, a version of it will be saved to our local computer. This can lead to the eventual wastage of a lot of disk space until we manually remove these containers. Later we will show you how to save your container if you want to do so.

If you try to run a Docker container which you have not installed locally then Docker will automatically search for the container on Docker Hub (an online repository for docker images) and download it if it exists.

