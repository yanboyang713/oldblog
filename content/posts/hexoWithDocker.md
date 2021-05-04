---
title: "Creating a Hexo blog with Docker"
date: 2020-02-05T06:11:32+10:00
tags: [ "Hexo", "Blog" ]
categories: [ "Blog" ]
---

## Overview

This is a tutorial on creating a blog or website using hexo.io (a static site generator). 


We will use Docker as our development environment. Also, we will storge our Hexo development code in Github main branche and all of our generate static pages will hosting in Github Page on gh-pages branches with your own custom domain and https.

## Why we choose Hexo

After comparing a multitude of offerings, I settled on the excellent hexo.io platform, ‘A fast, simple & powerful blog framework’. The great thing about hexo, is that your blog/site is generated as a collection of static files. You don’t need anything other than a decent web server to host your page and given that it’s a static site, it reduces security concerns significantly in comparison to other popular blogging platforms.

With the use of Hexo, you’ve also got a means that you can work on your blog locally, without internet connectivity. So, before we public our blog, we can check on our local host.

The platform is built with node.js and subsequently, there are for it’s configuration, a variety of modules that need to be installed through npm. Whilst this is not that difficult in itself, it is a process that can result in a lot of installation residual on ones system. For this reason, we’re going to be using Docker to encapsulate the main blogging component that will run our system, keeping our own system shipshape and shiny.

Github, offers a great solution for hosting sites with it’s pages.github.io service, all you need to have is a github account to make use of this. You can even, configure the service to leverage your own domain name, with Github taking care of aspects like https for you for free.

## Prerequisites
You will need to have the following:

+ Docker installation. Docker is available for Mac/Windows/Linux and is easily installed. You can following the link at the below for install Docker.
{% post_link dockerInstall %}

+ Domain Name (optional). I will be using a domain name for my configuration. If you wish to follow along fully, you’ll need a domain name but, you can just as easily stick with the free subdomain provided by Github pages, i.e. name.github.io, and skip the domain name related aspects in this tutorial. If you don’t have a domain name but wish to purchase one, [namecheap](https://www.namecheap.com/) is an excellent provider and fits in well with this tutorial.

+ Github account, sign up for free on [github.com](https://github.com/)

In the subsequent sections, we will be covering the complete setup of https://yanboyang.com

## Set-up
### On Github, create a repository called something.github.io
In my case, I created yanboyang.github.io
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608974742/hexo/Sat_Dec_26_05_24_25_PM_CST_2020_zbblkc.png)

### Clone this repository to Local
```console
[yanboyang713@boyang Documents]$ git clone https://github.com/yanboyang713/yanboyang.github.io.git
Cloning into 'yanboyang.github.io'...
remote: Enumerating objects: 760, done.
remote: Counting objects: 100% (760/760), done.
remote: Compressing objects: 100% (148/148), done.
remote: Total 760 (delta 289), reused 743 (delta 276), pack-reused 0
Receiving objects: 100% (760/760), 4.13 MiB | 1.88 MiB/s, done.
Resolving deltas: 100% (289/289), done.
```

### Docker image build
```bash
docker build -t hexo .
```
NOTE: If you face "error checking context: 'can't stat '/home/yanboyang713/Documents/yanboyang.github.io/.ssh''.",
this means: **Docker client does not have sufficient permissions to read some of the files in the context**
You can run:
```bash
sudo chmod -R 777 .ssh/
```

### Docker Pull the spurin/hexo Image
On Docker Hub there is a pre-made image made by spurin, containing the steps to install both Hexo and Hexo-Admin. More details about the image can be reviewed here. With docker installed, from a command prompt/terminal, issue the following command to pull the latest version of the image.

```bash
docker pull spurin/hexo
```

### Create a container for your site
Access to your Local repository Folder.

```console
[yanboyang713@boyang yanboyang.github.io]$ docker create --name=yanboyang.com \
> -e HEXO_SERVER_PORT=4001 \
> -e GIT_USER="Boyang Yan" \
> -e GIT_EMAIL="yanboyang713@gmail.com" \
> -v /home/yanboyang713/Documents/yanboyang.github.io:/app \
> -p 4001:4001 \
> spurin/hexo
782be92ed7722d81f496c06b5cd350f38b570679ccd444c0cf07fdfbdcba24d6

[yanboyang713@boyang yanboyang.github.io]$ docker container ls -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
782be92ed772        spurin/hexo         "docker-entrypoint.s…"   10 seconds ago      Created                                 yanboyang.com

```
### Start yanboyang.com

```bash
docker start yanboyang.com && docker logs --follow yanboyang.com
```

```bash
docker exec -it yanboyang.com bash
```

We can press Ctrl+C at this point without concern as we’re following the logs, the container is running in the background and thus our Ctrl+C stops the following of the logs, not the actual container.

I’m performing this on my laptop so Docker is localhost, adjust the name/ip address accordingly if you’re running Docker elsewhere. If you browse to http://localhost:4001, you’ll be presented with a hexo starting page as follows

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608976868/hexo/Sat_Dec_26_06_00_30_PM_CST_2020_vf19vj.png)

You can also, access the admin interface for hexo-admin at http://localhost:4001/admin -

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608976979/hexo/Sat_Dec_26_06_02_28_PM_CST_2020_kzynos.png)

### Customising the Theme
This theme may suit your needs but personally, I am a big fan of the [Next theme](https://github.com/theme-next/hexo-theme-next). The next steps cover the installation of this particular theme.

Each theme will have their own requirements but this give an overall idea of the process.

Execute a bash shell in the running container, giving you a prompt similar to the following -

We will clone the theme from it’s source github repository, and whilst we’re in the shell, we’re going to rename the default configuration file to the expected name. Although we’re doing this in the shell, we’re in the app volume so all changes here are persistent. Technically, we could do this directly in the app volume on our local OS if that is more convenient.
a

```console
[yanboyang713@boyang newBlog]$ docker exec -it yanboyang.com bash
root@6e0c33f789be:/app# ls
_config.landscape.yml  db.json	     package-lock.json	scaffolds  themes
_config.yml	       node_modules  package.json	source	   yarn.lock
root@6e0c33f789be:/app# git clone https://github.com/theme-next/hexo-theme-next themes/next
Cloning into 'themes/next'...
remote: Enumerating objects: 12564, done.
remote: Total 12564 (delta 0), reused 0 (delta 0), pack-reused 12564
Receiving objects: 100% (12564/12564), 8.00 MiB | 2.59 MiB/s, done.
Resolving deltas: 100% (7996/7996), done.
root@6e0c33f789be:/app# ls
_config.landscape.yml  db.json	     package-lock.json	scaffolds  themes
_config.yml	       node_modules  package.json	source	   yarn.lock
root@6e0c33f789be:/app# exit
exit
```

### Blog Configuration
The next change, is to our blog configuration file which again, is now accessible in two ways

1. In the container under \/app\/\_config.yml
2. Outside of the container in the local directory, in my case this would be /home/yanboyang713/Documents/newBlog\_config.yml

**NOTE:** If you could NOT change source folder and \_post folder.
Please, 
```bash
sudo chmod 777 ./source/

sudo chmod 777 _posts/

sudo chmod 777 ./next/
```

### Add Requirements in the app volume
To reiterate, when we created the container, we specified the volume location so these files are accessible both inside the container (via an interactive shell) and outside of the container (via your filesystem). If you wish to make changes inside the container using an editor like vim, you will need to install an editor as the container is built from a lightweight image that has no default editors (i.e. apt update && apt -y install vim), n.b. this change is to the running container and won’t persist should the container be destroyed/recreated).

For this, we’re going to need some additional npm requirements, fortunately, the image has been built to accomodate this. Execute a shell, and then add the requirement to requirements.txt in the app volume.

```console
[yanboyang713@boyang newBlog]$ docker exec -it yanboyang.com bash
root@6e0c33f789be:/app# ls
_config.landscape.yml  _config.yml.old	node_modules	   package.json  scaffolds  themes
_config.yml	       db.json		package-lock.json  public	 source     yarn.lock
root@6e0c33f789be:/app# echo hexo-deployer-git >> requirements.txt
root@6e0c33f789be:/app# exit
exit
```

After making these change, if you’re in the running container, exit and then restart the Docker container.

```console
[yanboyang713@boyang newBlog]$ docker restart yanboyang.com && docker logs --follow yanboyang.com
```

### Using the SSH Deploy Key
We’re going to use SSH keys to deploy our site to Github, this is conveniently done as part of the application generation and we can use the SSH key generated, i.e.

```file
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCkbxMRt/BuilZBGwBNMEdjF7Xny+D/DF+X/Ee+Nbq/UnfX3vTL1EovCxPeX8QWDmcYkkSchNK4V3Cvw5dlTnEZEvyUXCsqAEjTC+wfpAJ2cRMiApPgqg4Px0OyBA4dI5nxs03tMVmRk4B+LxLLS4QVhXL/R4eOnYl+he3lQ8ouzqb7nFKCg5psohvEvEtaSib3AKVE/eRSgevN34PDKrSFdxemQDne9JrSPH7nFgQLfmYt/MYkAxkWur1bjopfkS/KvNrh/jN493TZ+BB6onBYdXy9eNvNQrJGTD7HuiF2IBhmTAXQdeXQEHOmTjhygfn17AnU8TwkE7RpcV1BLtc3 root@782be92ed772

```

n.b. this is an example only and has not been used, outside of this tutorial, you will need to use your own SSH key.

### Adding the Deployment Keys to Github
Whilst in the repository, we can add the deployment keys that we created.

1. In Settings, choose Deploy Keys.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608977789/hexo/Sat_Dec_26_06_16_06_PM_CST_2020_fq6g39.png)

2. Select Add deploy key
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608978235/hexo/Sat_Dec_26_06_23_30_PM_CST_2020_ur7hr7.png)

3. And paste the key we created earlier
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608977693/hexo/Sat_Dec_26_06_14_23_PM_CST_2020_b4ocr2.png)

**NOTE:**
Please, check "Allow write sccess"

4. If successful, you should see something similar to this
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608978421/hexo/Sat_Dec_26_06_26_40_PM_CST_2020_tckym0.png)

## Configuring a domain name using Github and DNS record
If you wish to host your site with a custom domain, in the project settings in the github repository, you can enable as follows.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608978540/hexo/Sat_Dec_26_06_28_38_PM_CST_2020_odr7nc.png)

We need add 4 A record and one CNAME. The example at the below.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608979830/hexo/Sat_Dec_26_06_49_50_PM_CST_2020_v7xuwo.png)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1608979830/hexo/Sat_Dec_26_06_50_04_PM_CST_2020_jx6oj4.png)

### Configure CNAME in Hexo and Deploy Settings
Earlier on, when we set a custom CNAME in Github, it created a file called CNAME in the repository, we need to ensure that this file is in our source on Hexo, otherwise, this will be removed during deployment, breaking the cname configuration for our site. Create an equivalent file in the source directory -

```console
$ docker exec -it yanboyang.com bash
root@b3feb661344f:/app# echo www.yanboyang.com > source/CNAME
exit
```

Edit \_config.yml and update the deployment section with your own github settings.

```file
## Deployment
### Docs: https://hexo.io/docs/deployment.html
deploy:
  type: git
  repo: https://github.com/yanboyang713/yanboyang.github.io.git
  branch: gh-pages
  message: "Site updated"

```

**NOTE:** 
In your **requirements.txt** file add **hexo-deployer-git**

### Create a new blog post
```bash
$ docker exec yanboyang.com bash -c 'hexo new post "chineseInputMethod"'
```

### Generating content
In preparation for the launch of the site, we can request that Hexo generates the content for us

```bash
$ docker exec yanboyang.com hexo clean
$ docker exec yanboyang.com hexo generate
```

### Finally, Deploy the site

```bash
$ docker exec -it yanboyang.com hexo deploy
```

### Add gitignore for local public
```console
[yanboyang713@boyang yanboyang.github.io]$ echo /public/* >> .gitignore
[yanboyang713@boyang yanboyang.github.io]$ cat .gitignore 
/public/*
```

### Commit and Push develop code to Github main branch
```bash
git add *
git commit -m "init main branch"
git push
```

## Tips for Hexo
1. https://github.com/hexojs/hexo/wiki/Breaking-Changes-in-Hexo-3.0


### Future Changes (Generate and Deploy)
From this point forward, you can quite simply use the local Hexo-Admin interface for updates, and when ready, push changes to your live site with a one liner as follows.

```bash
$ docker exec yanboyang.com bash -c 'hexo clean && hexo generate && hexo deploy'
```

### Generate Atom 1.0 or RSS 2.0 feed
https://github.com/hexojs/hexo-generator-feed

In the requirements.txt add hexo-generator-feed

### adds an anchor to every heading
https://github.com/theme-next/hexo-theme-next-anchor

In the requirements.txt add hexo-theme-next-anchor

### Embed a YouTube/Vimeo video
#### YouTube
Inserts a YouTube video.
```
{% youtube video_id [type] [cookie] %}
```

##### Examples
+ Embed a video
```
{% youtube lJIrF4YjHfQ %}
```

+ Embed a playlist
```
{% youtube PL9hW1uS6HUfscJ9DHkOSoOX45MjXduUxo 'playlist' %}
```

+ Enable privacy-enhanced mode

YouTube’s cookie is not used in this mode.
```
{% youtube lJIrF4YjHfQ false %}
{% youtube PL9hW1uS6HUfscJ9DHkOSoOX45MjXduUxo 'playlist' false %}
```

#### Vimeo
Inserts a responsive or specified size Vimeo video.

```
{% vimeo video_id [width] [height] %}
```

