---
title: "Launching RStudio in Docker"
date: 2021-03-01T06:11:32+10:00
tags: [ "r", "r language", "docker" ]
categories: [ "virtual environment" ]
---
## Introduction
RStudio Server enables you to provide a browser based interface to a version of R running on a remote Linux server, bringing the power and productivity of the RStudio IDE to server-based deployments of R.

In this blog, I will talk about how to launch a Docker container that allows us to run RStudio in a browser using the --rm flag when we run Docker makes the container ephemeral that mean it is automatically deleted after we close the container. We do this as to not build up a large collection of containers on our machine and waste space. After, I will talk how to link a volume of our local host disk to the Docker container if we want to be able to access and save data, scripts and any other files.

## Prerequisite
Docker installation. Docker is available for Mac/Windows/Linux and is easily installed. You can following the link at the below for install Docker.
{% post_link dockerInstall %}

## Launching RStudio in Docker
We will ask Docker to run an image that already exists, we will use the **verse** Docker image from [Rocker](https://github.com/rocker-org/rocker/wiki) which will allow us to run RStudio inside the container and has many useful R packages already installed.

This command will lead RStudio-Server to launch invisibly.
```bash
docker run --rm -e PASSWORD=yourpasswordhere -p 8787:8787 rocker/verse
```

**NOTE:** You must set a unique PASSWORD (not 'rstudio') first!

Optional: -p and --rm are flags that allow you to customize how you run the container. ***-p*** tells Docker that you will be using a port to see RStudio in your web browser (at a location which we specify afterwards as port 8787:8787). Finally, ***–rm*** ensures that when we quit the container, the container is deleted. If we did not do this, everytime we run a container, a version of it will be saved to our local computer. This can lead to the eventual wastage of a lot of disk space until we manually remove these containers. Later we will show you how to save your container if you want to do so.

If you try to run a Docker container which you have not installed locally then Docker will automatically search for the container on Docker Hub (an online repository for docker images) and download it if it exists.

## Connect RStudio from browser
To connect to it, open a browser and enter http://, followed by your ip address, followed by :8787

If you are running a Linux machine, you can use localhost as the ip address. For example: http://localhost:8787

This should lead to you being greeted by the RStudio welcome screen. Log in using:

username: rstudio password: **The PWD you set**.

Now you should be able to work with RStudio in your browser in much the same way as you would on your desktop.

**Importance Note:**
If you want to bypass the authentication, you can simply set the environmental variable, like below.
```bash
-e DISABLE_AUTH=true
```

Try to now look at your files of your virtual computer (docker container). Go to file -> open file. You will see that there are actually no files. The reason for this is that this image came with no files. Next, open a new R Script, e.g. by going to file -> New file -> R Script. Enter the following code in the script, run it and save it.

```
## make x the numbers from 1 to 5, and y the numbers from 6-10
x <- 1:5
y <- 6:10

## plot x against y
plot(x, y)
```

If you look at your files again now, you will see the script file.

**Importance Note:**
Now, given that we used the --rm flag when we launched the Docker container, **anything we create on the machine will be gone**, if we are not link a volume to a Docker container. Please, continue read this blog, how to link a volume to a Docker container at the below.

## Stopping RStudio in Docker 
Close the browser tab where you have RStudio open, and then go to your terminal window from where you launched the Docker container and type **Contol+C**. This shuts down the Docker container.

## Linking a volume to a Docker container to access data and save files
This section, we will talk about how can we save our work if the container is deleted when we exit the container. One solution is to link a volume (for example your local hard drive) to the container so that you can access the data there as well as being able to save things there.

This time when we launch our container we will use the -v flag along with the path to our project’s directory path.

Your launch command should look something like this at the below, although the path will differ depending on where you saved the data to on your computer.

On the left hand side of the : is the path on your own computer. On the right hand side is the path on the container. This should almost always start with /home/rstudio/.


1. From your project's root directory:
```bash
docker run --rm -e PASSWORD=yourpasswordhere -v $(pwd):/home/rstudio -p 8787:8787 rocker/verse
```

2. Using full directory path:
```bash
docker run --rm -e PASSWORD=happyman -v /home/yanboyang713/Documents/Rdemo:/home/rstudio/ -p 8787:8787 rocker/verse
```

Again, typing like http://127.0.0.1:8787 in your browser as the url to get RStudio to run.

This time when you launch RStudio in a Docker container and you try to open/create a file you should be able to see in your local host directories. There is a example at the below. Let’s also save && run the script as demo.R. After you can run this script. Now close the RStudio browser and exit your Docker container via the terminal. Then look inside the directories on your local host to see if you can see the two files you created.

```R
## load ggplot library
library(ggplot2)

## make x the numbers from 1 to 5, and y the numbers from 6-10
x <- 1:5
y <- 6:10

## plot
qplot(x, y)

## save the plot
ggsave(filename = 'demo.pdf')
```

```console
[yanboyang713@boyang Rdemo]$ ls
demo.pdf  demo.R
```

