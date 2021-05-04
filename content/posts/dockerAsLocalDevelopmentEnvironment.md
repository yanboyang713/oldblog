---
title: "Docker as Local Development Environment"
date: 2020-00-09T06:11:32+10:00
tags: [ "Docker" ]
categories: [ "virtual environment" ]
---
## Introduction
https://blog.atulr.com/docker-local-environment/

## Perrequires
+ Install Docker
+ Install Docker Compose
## Docker
Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package.

### Docker container

To form a mental picture, for the time being just consider a Docker Container as an extremely light weight isolated linux based virtual machine inside which we will run our application service (although containers are not exactly VMs). The container will contain our code and all of its dependencies (system libraries, tools, etc). For our setup we will use one docker container per service and separate docker containers for our database.

containers_mental_modal

### Docker-Compose

Docker compose is a tool for defining and running multi-container Docker applications. With Compose, you use a YAML file to configure your application’s services. Then, with a single command, you create and start all the services from your configuration.

TLDR; Docker compose lets you run all your services at once (also in the right order) and manage them via a unified interface.

#### Docker compose in general will contain:

1. **Services**: Services are the list of induvidual docker containers that will be run by the compose tool. We will specify the ports and other configurations needed to run the docker containers here.
2. **Networks**: Network provides a way by which different services can interact with each other. Each container can attach itself to a network and all containers within same networks can communicate with each other. We will use a single network for our case.
3. **Volumes**: Docker containers by default do not contain any kind of persistence storage. If a docker container is killed then all the data in its memory gets lost. So in order to save some persistant data you need volumes. Think of volumes as permanent hard drives for these containers. We will have one volume per service.

## Setting it up
I have created a basic setup of services as described above. To follow along, take a clone of the repo with the following commands.

```bash
git clone https://github.com/boyyan713/docker-as-dev-environment.git

cd docker-as-dev-environment/

git checkout tags/basic-setup

git checkout -b tryingout

```

Now you should have the following project structure to start with:
```console
(base) yanboyang713@boyang:~/Documents/docker-as-dev-environment$ tree .
.
├── go1
│   ├── main.go
│   └── README.md
├── njs1
│   ├── index.js
│   ├── package.json
│   ├── package-lock.json
│   └── README.md
├── njs2
│   ├── index.js
│   ├── package.json
│   ├── package-lock.json
│   └── README.md
└── py1
    ├── README.md
    ├── requirements.txt
    └── server
        ├── __init__.py
        └── __main__.py

5 directories, 14 files

```
You could browse through each project inside and read the README to understand how to run those projects induvidually.

### Enter docker
Make sure you have docker running by following the instructions here https://www.docker.com/get-started.

First step is to create a docker file for our service njs1. Create a Dockerfile: blog-docker-dev-environment-example/njs1/Dockerfile

njs1/Dockerfile
```
FROM node:6.17.0

WORKDIR /root
ADD . /root
```

Create the file at blog-docker-dev-environment-example/docker-compose.yml .
Now let jump to docker-compose.

Lets add our first service (njs1) to it.
```yml
version: '3'
services:
  njs1:
    build: ./njs1
    command: sh -c "npm install && npm start"
    environment:
      - NODE_ENV=development
      - PORT=7000
    ports:
      - '7000:7000'
    working_dir: /root/njs1
```

The above docker compose file has only one service (njs1). We will add more services incrementally. Before that lets run it and see what we get.

In the folder which contains our docker-compose.yml run:

```bash
docker-compose up
```

if all goes well you should see it building our app container and in the very end

```bash
NJS1 app listening on port 7000!
```
Open it up on the browser: http://localhost:7000 to test it out.

docker-compose service in detail:

+ build: : Path to the dockerfile. Note: you can either specify the folder which contains the Dockerfile or the complete path to Dockerfile itself. Both works.
+ command: : Command to run when docker container is started.
+ environment: : All the environment variables you need to set.
+ ports:: This specifies the mapping of the port inside the container to that of the host machine. They need not be same.
+ working_dir: : This is the path inside the container where you want to the run the command you specified above.

### All this is good and fine but how can I use it for efficient development?

To make an efficient development environment we need to be able to edit the source code (which with current setup is not possible without re building container again and again). To achieve this we will make use of volumes.

Make the following changes. First lets tell our njs1/Dockerfile to not copy the project files to the container.

njs1/Dockerfile
```
FROM node:latest

## WORKDIR /root <-- comment out
## ADD . /root   <-- these two lines
```

then tell docker-compose to mount our project directory from our local machine as a directory inside the container.

docker-compose.yml
```yml
version: '3'
services:
  njs1:
    build: ./njs1
    command: sh -c "npm install && npm start"
    environment:
      - NODE_ENV=development
      - PORT=7000
    ports:
      - '7000:7000'
    working_dir: /root/njs1
    volumes:
      - ./njs1:/root/njs1:cached # <--- This will map ./njs1 to /root/njs1 inside the container.
```
In detail

+ volumes: - volumes gives us a way to map our local directories to a directory inside the container. Here we are saying map njs1 folder from our local machine to /root/njs1 inside the docker container. Here we are not copying the files into the container, instead we are mounting it as a shared volume. And thats the trick that makes it useful.

To test it out. Lets add nodemon to our njs1 service.

```
cd njs1
npm install --save-dev nodemon
```

Now make the following change in
njs1/package.json
```
...
...
...
  "description": "A sample nodejs server",
   "main": "index.js",
   "scripts": {
-    "start": "node index.js"
+    "start": "nodemon index.js"
   },
...
...
...

```
Time to test it out! Go to the root folder and run
```console
(base) yanboyang713@boyang:~/Documents/docker-as-dev-environment$ docker-compose up --build
Building njs1
Step 1/1 : FROM node:latest
 ---> f47907840247

Successfully built f47907840247
Successfully tagged docker-as-dev-environment_njs1:latest
Starting docker-as-dev-environment_njs1_1 ... done
Attaching to docker-as-dev-environment_njs1_1
njs1_1  | npm WARN njs1@1.0.0 No repository field.
njs1_1  | npm WARN optional SKIPPING OPTIONAL DEPENDENCY: fsevents@2.1.3 (node_modules/fsevents):
njs1_1  | npm WARN notsup SKIPPING OPTIONAL DEPENDENCY: Unsupported platform for fsevents@2.1.3: wanted {"os":"darwin","arch":"any"} (current: {"os":"linux","arch":"x64"})
njs1_1  | 
njs1_1  | audited 171 packages in 1.633s
njs1_1  | 
njs1_1  | 10 packages are looking for funding
njs1_1  |   run `npm fund` for details
njs1_1  | 
njs1_1  | found 0 vulnerabilities
njs1_1  | 
njs1_1  | 
njs1_1  | > njs1@1.0.0 start /root/njs1
njs1_1  | > nodemon index.js
njs1_1  | 
njs1_1  | [nodemon] 2.0.4
njs1_1  | [nodemon] to restart at any time, enter `rs`
njs1_1  | [nodemon] watching path(s): *.*
njs1_1  | [nodemon] watching extensions: js,mjs,json
njs1_1  | [nodemon] starting `node index.js`
njs1_1  | NJS1 app listening on port 7000!

```

The --build tells docker-compose to rebuild the images.

### Try editing njs1 source files! 🎉

Try making some changes in the njs1/index.js file and you should see nodemon auto reloading on file change.

### Finishing things up! 🏁

Once you add other services to the docker-compose file. It should look something like this:

docker-compose.yml
```yml
version: '3'

services:
  njs1:
    build: ./njs1
    command: sh -c "npm install && npm start"
    environment:
      - NODE_ENV=development
      - PORT=7000
    ports:
      - '7000:7000'
    working_dir: /root/njs1
    volumes:
      - ./njs1:/root/njs1:cached # <--- This will map ./njs1 to /root/njs1 inside the container.

  njs2:
    image: node:12.3-alpine
    command: sh -c "npm install && npm start"
    environment:
      - NODE_ENV=development
      - PORT=8000
    ports:
      - '8000:8000'
    working_dir: /root/njs2
    volumes:
      - ./njs2:/root/njs2:cached # <--- This will map ./njs2 to /root/njs2 inside the container.

  py1:
    image: python:3-stretch
    command: sh -c "pip install -r requirements.txt && python -m server"
    environment:
      - PORT=9000
      - FLASK_ENV=development
    ports:
      - '9000:9000'
    working_dir: /root/py1
    volumes:
      - ./py1:/root/py1:cached # <--- This will map ./py1 to /root/py1 inside the container.

  go1:
    image: golang:1.12-alpine
    command: sh -c "go run ."
    environment:
      - PORT=5000
    ports:
      - '5000:5000'
    working_dir: /root/go1
    volumes:
      - ./go1:/root/go1:cached # <--- This will map ./py1 to /root/py1 inside the container.
```
### Few Changes

+ image: instead of build : In docker-compose we can specify the docker image from docker-hub directly instead of a dockerfile using the image: property. Hence for simple setups we dont need to write our own Dockerfile.

There are many more configuration options which you can use in your docker-compose.yml file. To see a complete reference of those, you can visit this link: https://docs.docker.com/compose/compose-file/

## Commands Cheatsheet

Now that you have setup your services to run via docker-compose for local development. There are few commands that can help.

### Start all services

This will start all services in the docker-compose file and detach from the terminal. So your services can run in background.
```bash
docker-compose start
```

### Stop all services

Corresponding stop command

```bash
docker-compose stop
```

### Launch a specific service

This will only launch njs1 from the list of services in the docker-compose.yml
```bash
docker-compose up njs1
```
You can use similar commands to stop, start induvidual services as well.

### Restart a single service

```bash
docker-compose restart njs1
```

### logs from specific service

This will show logs of only njs1 and also watch for more logs

```bash
docker-compose logs -f njs1
```

### ssh into a particular service container
```bash
docker-compose exec njs1 bash
```

## Some Tips for smoother workflow

### Containers / services running too slow?

You might notice that your services are running/launching at extremely slow as compared to when you launch them without docker-compose. This might be because you have allocated less CPU/RAM to docker service. The default values are very low and that causes issues when launching multiple services.

Go to : dockerIcon -> preferences -> Advanced

Change the slider to give CPU > 3 cores and RAM > 6GB

### Low on space / messed up and want to restart everything from scratch ?

### Removing all images and then refreshing the entire thing.

To remove all docker containers:

```bash
docker rm $(docker ps -a -q) -f
```

To remove all docker images:

```bash
docker rmi $(docker images) -f
```

