---
title: "Getting started with Docker Networking"
date: 2020-01-05T06:11:32+10:00
tags: [ "Docker", "Networking" ]
categories: [ "Networking" ]
---
## Networking Overview
One of the reasons Docker containers and services are so powerful is that you can connect them together, or connect them to non-Docker workloads. Docker containers and services do not even need to be aware that they are deployed on Docker, or whether their peers are also Docker workloads or not. Whether your Docker hosts run Linux, Windows, or a mix of the two, you can use Docker to manage them in a platform-agnostic way.

Docker comes with three networking drivers by default. Network adapters are also initialized using these drivers, carrying the same exact name. For example, if you run docker network ls you will see a network named bridge, this driver uses bridge networking driver. This is the default network to which every container will try and connect, unless specified otherwise.

```console
boyang:~$ docker network ls
NETWORK ID          NAME                                DRIVER              SCOPE
9180da752799        bridge                              bridge              local
67c7f5587624        host                                host                local
d15c7dd51668        none                                null                local
```

This topic defines some basic Docker networking concepts and prepares you to design and deploy your applications to take full advantage of these capabilities.

## Network drivers

Docker’s networking subsystem is pluggable, using drivers. Several drivers exist by default, and provide core networking functionality:

### Bridge
The default network driver. If you don’t specify a driver, this is the type of network you are creating. Bridge networks are usually used when your applications run in standalone containers that need to communicate. See bridge networks.

In terms of networking, a bridge network is a Link Layer device which forwards traffic between network segments. A bridge can be a hardware device or a software device running within a host machine’s kernel.

In terms of Docker, a bridge network uses a software bridge which allows containers connected to the same bridge network to communicate, while providing isolation from containers which are not connected to that bridge network. The Docker bridge driver automatically installs rules in the host machine so that containers on different bridge networks cannot communicate directly with each other.

Bridge networks apply to containers running on the same Docker daemon host. For communication among containers running on different Docker daemon hosts, you can either manage routing at the OS level, or you can use an overlay network.

When you start Docker, a default bridge network (also called bridge) is created automatically, and newly-started containers connect to it unless otherwise specified. You can also create user-defined custom bridge networks. User-defined bridge networks are superior to the default bridge network.

#### Differences between user-defined bridges and the default bridge
+ **User-defined bridges provide automatic DNS resolution between containers.**
Containers on the default bridge network can only access each other by IP addresses, unless you use the --link option, which is considered legacy. On a user-defined bridge network, containers can resolve each other by name or alias.

Imagine an application with a web front-end and a database back-end. If you call your containers web and db, the web container can connect to the db container at db, no matter which Docker host the application stack is running on.

If you run the same application stack on the default bridge network, you need to manually create links between the containers (using the legacy --link flag). These links need to be created in both directions, so you can see this gets complex with more than two containers which need to communicate. Alternatively, you can manipulate the /etc/hosts files within the containers, but this creates problems that are difficult to debug.

+ **User-defined bridges provide better isolation.**

All containers without a --network specified, are attached to the default bridge network. This can be a risk, as unrelated stacks/services/containers are then able to communicate.

Using a user-defined network provides a scoped network in which only containers attached to that network are able to communicate.

+ **Containers can be attached and detached from user-defined networks on the fly.**

During a container’s lifetime, you can connect or disconnect it from user-defined networks on the fly. To remove a container from the default bridge network, you need to stop the container and recreate it with different network options.

+ **Each user-defined network creates a configurable bridge.**

If your containers use the default bridge network, you can configure it, but all the containers use the same settings, such as MTU and iptables rules. In addition, configuring the default bridge network happens outside of Docker itself, and requires a restart of Docker.

User-defined bridge networks are created and configured using ***docker network create***. If different groups of applications have different network requirements, you can configure each user-defined bridge separately, as you create it.

+ **Linked containers on the default bridge network share environment variables.**

Originally, the only way to share environment variables between two containers was to link them using the --link flag. This type of variable sharing is not possible with user-defined networks. However, there are superior ways to share environment variables. A few ideas:

	+ Multiple containers can mount a file or directory containing the shared information, using a Docker volume.

	+ Multiple containers can be started together using docker-compose and the compose file can define the shared variables.

	+ You can use swarm services instead of standalone containers, and take advantage of shared secrets and configs.

Containers connected to the same user-defined bridge network effectively expose all ports to each other. For a port to be accessible to containers or non-Docker hosts on different networks, that port must be published using the -p or --publish flag.

#### Manage a user-defined bridge

Use the docker network create command to create a user-defined bridge network.

```console
$ docker network create my-net
```

You can specify the subnet, the IP address range, the gateway, and other options. See the docker network create reference or the output of ***docker network create --help*** for details.

Use the docker network rm command to remove a user-defined bridge network. If containers are currently connected to the network, disconnect them first.

```console
$ docker network rm my-net
```

**What’s really happening?**
When you create or remove a user-defined bridge or connect or disconnect a container from a user-defined bridge, Docker uses tools specific to the operating system to manage the underlying network infrastructure (such as adding or removing bridge devices or configuring iptables rules on Linux). These details should be considered implementation details. Let Docker manage your user-defined networks for you.

#### Connect a container to a user-defined bridge

When you create a new container, you can specify one or more --network flags. This example connects a Nginx container to the my-net network. It also publishes port 80 in the container to port 8080 on the Docker host, so external clients can access that port. Any other container connected to the my-net network has access to all ports on the my-nginx container, and vice versa.

```console
$ docker create --name my-nginx \
  --network my-net \
  --publish 8080:80 \
  nginx:latest
```

To connect a running container to an existing user-defined bridge, use the docker network connect command. The following command connects an already-running my-nginx container to an already-existing my-net network:

```console
$ docker network connect my-net my-nginx
```

#### Disconnect a container from a user-defined bridge

To disconnect a running container from a user-defined bridge, use the docker network disconnect command. The following command disconnects the my-nginx container from the my-net network.

```console
$ docker network disconnect my-net my-nginx
```

#### Use IPv6

If you need IPv6 support for Docker containers, you need to enable the option on the Docker daemon and reload its configuration, before creating any IPv6 networks or assigning containers IPv6 addresses.

When you create your network, you can specify the --ipv6 flag to enable IPv6. You can’t selectively disable IPv6 support on the default bridge network.

#### Enable forwarding from Docker containers to the outside world

By default, traffic from containers connected to the default bridge network is not forwarded to the outside world. To enable forwarding, you need to change two settings. These are not Docker commands and they affect the Docker host’s kernel.

1. Configure the Linux kernel to allow IP forwarding.

```console
$ sysctl net.ipv4.conf.all.forwarding=1
```

2. Change the policy for the iptables FORWARD policy from DROP to ACCEPT.
```console
$ sudo iptables -P FORWARD ACCEPT
```

These settings do not persist across a reboot, so you may need to add them to a start-up script.

#### Use the default bridge network
The default bridge network is considered a legacy detail of Docker and is not recommended for production use. Configuring it is a manual operation, and it has technical shortcomings.

#### Connect a container to the default bridge network

If you do not specify a network using the --network flag, and you do specify a network driver, your container is connected to the default bridge network by default. Containers connected to the default bridge network can communicate, but only by IP address, unless they are linked using the legacy --link flag.

#### Configure the default bridge network

To configure the default bridge network, you specify options in daemon.json. Here is an example daemon.json with several options specified. Only specify the settings you need to customize.
```
{
  "bip": "192.168.1.5/24",
  "fixed-cidr": "192.168.1.5/25",
  "fixed-cidr-v6": "2001:db8::/64",
  "mtu": 1500,
  "default-gateway": "10.20.1.1",
  "default-gateway-v6": "2001:db8:abcd::89",
  "dns": ["10.20.1.2","10.20.1.3"]
}
```
Restart Docker for the changes to take effect.

#### Use IPv6 with the default bridge network

If you configure Docker for IPv6 support (see Use IPv6), the default bridge network is also configured for IPv6 automatically. Unlike user-defined bridges, you can’t selectively disable IPv6 on the default bridge.

### Host
For standalone containers, remove network isolation between the container and the Docker host, and use the host’s networking directly. See use the host network.

If you use the host network mode for a container, that container’s network stack is not isolated from the Docker host (the container shares the host’s networking namespace), and the container does not get its own IP-address allocated. For instance, if you run a container which binds to port 80 and you use host networking, the container’s application is available on port 80 on the host’s IP address.

**Note:**
Given that the container does not have its own IP-address when using host mode networking, port-mapping does not take effect, and the -p, --publish, -P, and --publish-all option are ignored, producing a warning instead:

WARNING: Published ports are discarded when using host network mode

Host mode networking can be useful to optimize performance, and in situations where a container needs to handle a large range of ports, as it does not require network address translation (NAT), and no “userland-proxy” is created for each port.

The host networking driver only works on Linux hosts, and is not supported on Docker Desktop for Mac, Docker Desktop for Windows, or Docker EE for Windows Server.

You can also use a host network for a swarm service, by passing --network host to the docker service create command. In this case, control traffic (traffic related to managing the swarm and the service) is still sent across an overlay network, but the individual swarm service containers send data using the Docker daemon’s host network and ports. This creates some extra limitations. For instance, if a service container binds to port 80, only one service container can run on a given swarm node.

### Overlay
Overlay networks connect multiple Docker daemons together and enable swarm services to communicate with each other. You can also use overlay networks to facilitate communication between a swarm service and a standalone container, or between two standalone containers on different Docker daemons. This strategy removes the need to do OS-level routing between these containers. See overlay networks.

#### Docker Swarm

##### What's Docker Swarm?
A Docker Swarm is a group of either physical or virtual machines that are running the Docker application and that have been configured to join together in a cluster. Once a group of machines have been clustered together, you can still run the Docker commands that you're used to, but they will now be carried out by the machines in your cluster. The activities of the cluster are controlled by a swarm manager, and machines that have joined the cluster are referred to as nodes.

##### What is Docker Swarm used for?
Docker swarm is a container orchestration tool, meaning that it allows the user to manage multiple containers deployed across multiple host machines.

One of the key benefits associated with the operation of a docker swarm is the high level of availability offered for applications. In a docker swarm, there are typically several worker nodes and at least one manager node that is responsible for handling the worker nodes' resources efficiently and ensuring that the cluster operates efficiently. 

#### What's an overlay network?
An ***"overlay network"*** is a virtual network that runs on top of a different network. Devices in that network are unaware that they are in an overlay. Traditional VPNs, for instance are overlay networks running over Internet.

The term “overlay” has come to be used extensively (instead of VPN) only after technologies different than PPTP or L2TP have been developed to run virtual networks in Cloud environments. For those environments, protocols like VXLAN or GENEVE have been developed to address specific needs.

Connects multiple Docker daemons together to create a flat virtual network across hosts where you can establish communication between a swarm service and a standalone container, or between two standalone containers on different Docker daemons. This strategy removes the need to do OS-level routing between these containers.

This topic includes four different tutorials. You can run each of them on Linux, Windows, or a Mac, but for the last two, you need a second Docker host running elsewhere.

+ Use the default overlay network demonstrates how to use the default overlay network that Docker sets up for you automatically when you initialize or join a swarm. This network is not the best choice for production systems.

+ Use user-defined overlay networks shows how to create and use your own custom overlay networks, to connect services. This is recommended for services running in production.

+ Use an overlay network for standalone containers shows how to communicate between standalone containers on different Docker daemons using an overlay network.

+ Communicate between a container and a swarm service sets up communication between a standalone container and a swarm service, using an attachable overlay network.

#### Prerequisites
These require you to have at least a single-node swarm, which means that you have started Docker and run docker swarm init on the host. You can run the examples on a multi-node swarm as well.

#### Use the default overlay network
In this example, you start an alpine service and examine the characteristics of the network from the point of view of the individual service containers.

This tutorial does not go into operation-system-specific details about how overlay networks are implemented, but focuses on how the overlay functions from the point of view of a service.

##### Prerequisites
This tutorial requires three physical or virtual Docker hosts which can all communicate with one another. This tutorial assumes that the three hosts are running on the same network with no firewall involved.

These hosts will be referred to as **manager**, **worker-1**, and **worker-2**.
+ The **manager host** will function as both a manager and a worker, which means it can both run service tasks and manage the swarm.
+ worker-1 and worker-2 will function as workers only

If you don’t have three hosts handy, an easy solution is to set up three Ubuntu hosts on a cloud provider such as Amazon EC2, all on the same network with all communications allowed to all hosts on that network (using a mechanism such as EC2 security groups), and then to follow the installation instructions for Docker Engine - Community on Ubuntu.

Or you can use Azure, create three VM in the same vnet and same subnet.
##### Walkthrough
###### Create the swarm
At the end of this procedure, all three Docker hosts will be joined to the swarm and will be connected together using an overlay network called **ingress**.

1. On manager. initialize the swarm. If the host only has one network interface, the **--advertise-addr** flag is optional.

**Note:**
the --advertise-addr is the address other nodes in the Docker swarm use to connect into your node. You need to provide an IP address of your host, or a network interface which Docker will use to lookup your IP address, and a port number which defaults to 2377.

```console
$ docker swarm init --advertise-addr=<IP-ADDRESS-OF-MANAGER>
```
Or
```console
boyang:~$ docker swarm init
Swarm initialized: current node (fw5wqlml3lqteplml6l187t1s) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-2hxfhny2wxcp8yzrbb24q7fojsdzmse893tmye19zl7vadvlu5-26jolbhw2yxuzpam991x0k5lt 10.172.0.35:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

Make a note of the text that is printed, as this contains the token that you will use to join **worker-1** and **worker-2** to the swarm. It is a good idea to store the token in a password manager.

2. On worker-1, join the swarm. If the host only has one network interface, the **--advertise-addr** flag is optional.

```console
$ docker swarm join --token <TOKEN> \
  --advertise-addr <IP-ADDRESS-OF-WORKER-1> \
  <IP-ADDRESS-OF-MANAGER>:2377
```

3. On worker-2, join the swarm. If the host only has one network interface, the --advertise-addr flag is optional.
```console
$ docker swarm join --token <TOKEN> \
  --advertise-addr <IP-ADDRESS-OF-WORKER-2> \
  <IP-ADDRESS-OF-MANAGER>:2377
```

4. On **manager**, list all the nodes. This command can only be done from a manager.
```console
boyang:~$ docker node ls
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
fw5wqlml3lqteplml6l187t1s *   boyang              Ready               Active              Leader              19.03.13
390whrgv9nhjtgsq2egocru59     docker-desktop      Down                Active                                  19.03.13
sis0p2wgug8ex4xa894pgilux     docker-desktop      Ready               Active                                  19.03.13
```

You can also use the **--filter** flag to filter by role:

```console
boyang:~$ docker node ls --filter role=manager
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
fw5wqlml3lqteplml6l187t1s *   boyang              Ready               Active              Leader              19.03.13
```

```console
boyang:~$ docker node ls --filter role=worker
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS      ENGINE VERSION
390whrgv9nhjtgsq2egocru59     docker-desktop      Down                Active                                  19.03.13
sis0p2wgug8ex4xa894pgilux     docker-desktop      Ready               Active                                  19.03.13
```
5. List the Docker networks on **manager**, **worker-1**, and **worker-2** and notice that each of them now has an overlay network called **ingress** and a bridge network called **docker_gwbridge**. Only the listing for manager is shown here:
```console
boyang:~$ docker network ls
NETWORK ID          NAME                                DRIVER              SCOPE
a4fcdb4a1130        bridge                              bridge              local
cb5178dbb630        docker-as-dev-environment_default   bridge              local
67c7f5587624        host                                host                local
p8tnia46u002        ingress                             overlay             swarm
d15c7dd51668        none                                null                local
```

The **docker_gwbridge** connects the **ingress** network to the Docker host’s network interface so that traffic can flow to and from swarm managers and workers. If you create swarm services and do not specify a network, they are connected to the ingress network. It is recommended that you use separate overlay networks for each application or group of applications which will work together. In the next procedure, you will create two overlay networks and connect a service to each of them.

###### Create the services
1. On **manager**, create a new overlay network called **nginx-net**:
```console
boyang:~$ docker network create -d overlay nginx-net
zph4h9bddrj0loajnvqyit5q0
```
ou don’t need to create the overlay network on the other nodes, because it will be automatically created when one of those nodes starts running a service task which requires it.
2. On manager, create a 5-replica Nginx service connected to nginx-net. The service will publish port 80 to the outside world. All of the service task containers can communicate with each other without opening any ports.
**Note:** Services can only be created on a manager.
```console
boyang:~$ docker service create \
>   --name my-nginx \
>   --publish target=80,published=80 \
>   --replicas=5 \
>   --network nginx-net \
>   nginx
9cl5n3ja6kbjjwnzuzzsya6hq
overall progress: 5 out of 5 tasks 
1/5: running   
2/5: running   
3/5: running   
4/5: running   
5/5: running   
verify: Service converged 
```
The default publish mode of **ingress**, which is used when you do not specify a **mode** for the **--publish** flag, means that if you browse to port 80 on **manager**, **worker-1**, or **worker-2**, you will be connected to port 80 on one of the 5 service tasks, even if no tasks are currently running on the node you browse to. If you want to publish the port using **host** mode, you can add **mode=host** to the **--publish** output. However, you should also use **--mode global** instead of **--replicas=5** in this case, since only one service task can bind a given port on a given node.
3. Run **docker service ls** to monitor the progress of service bring-up, which may take a few seconds.
```console
boyang:~$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE               PORTS
9cl5n3ja6kbj        my-nginx            replicated          5/5                 nginx:latest        *:80->80/tcp
```
4. Inspect the **nginx-net** network on **manager**, **worker-1**, and **worker-2**. Remember that you did not need to create it manually on **worker-1** and **worker-2** because Docker created it for you. The output will be long, but notice the **Containers** and **Peers** sections. **Containers** lists all service tasks (or standalone containers) connected to the overlay network from that host.
5. From **manager**, inspect the service using **docker service inspect my-nginx** and notice the information about the ports and endpoints used by the service.
6. Create a new network **nginx-net-2**, then update the service to use this network instead of **nginx-net**:
```console
boyang:~$ docker network create -d overlay nginx-net-2
ceg90igxgtqtp2dpnkq6xhcvf
```

```bash
docker service update \
  --network-add nginx-net-2 \
  --network-rm nginx-net \
  my-nginx
```

7. Run **docker service ls** to verify that the service has been updated and all tasks have been redeployed. Run **docker network inspect nginx-net** to verify that no containers are connected to it. Run the same command for **nginx-net-2** and notice that all the service task containers are connected to it.

**NOTE:** Even though overlay networks are automatically created on swarm worker nodes as needed, they are not automatically removed.

8. Clean up the service and the networks. From **manager**, run the following commands. The manager will direct the workers to remove the networks automatically.
```bash
$ docker service rm my-nginx
$ docker network rm nginx-net nginx-net-2
```

#### Use a user-defined overlay network
##### Prerequisites
This tutorial assumes the swarm is already set up and you are on a manager.
##### Walkthrough
1. Create the user-defined overlay network.
```bash
boyang:~$ docker network create -d overlay my-overlay
qf6fthvw6f7dth9ek8x2z9ybf
```
2. Start a service using the overlay network and publishing port 80 to port 8080 on the Docker host.
```console
boyang:~$ docker service create \
>   --name my-nginx \
>   --network my-overlay \
>   --replicas 1 \
>   --publish published=8080,target=80 \
>   nginx:latest
222stypuvo2kdfvth4qrntwce
overall progress: 1 out of 1 tasks 
1/1: running   
verify: Service converged 
```
3. Run **docker network inspect my-overlay** and verify that the **my-nginx** service task is connected to it, by looking at the **Containers** section.
4. Remove the service and the network.
```bash
$ docker service rm my-nginx

$ docker network rm my-overlay
```
#### Use an overlay network for standalone containers
This example demonstrates DNS container discovery -- specifically, how to communicate between standalone containers on different Docker daemons using an overlay network. Steps are:

+ On host1, initialize the node as a swarm (manager).
+ On host2, join the node to the swarm (worker).
+ On host1, create an attachable overlay network (test-net).
+ On host1, run an interactive alpine container (alpine1) on test-net.
+ On host2, run an interactive, and detached, alpine container (alpine2) on test-net.
+ On host1, from within a session of alpine1, ping alpine2.

##### Prerequisites
For this test, you need two different Docker hosts that can communicate with each other. Each host must have the following ports open between the two Docker hosts:

+ TCP port 2377
+ TCP and UDP port 7946
+ UDP port 4789
One easy way to set this up is to have two VMs (either local or on a cloud provider like AWS), each with Docker installed and running. If you’re using AWS or a similar cloud computing platform, the easiest configuration is to use a security group that opens all incoming ports between the two hosts and the SSH port from your client’s IP address.

This example refers to the two nodes in our swarm as host1 and host2. This example also uses Linux hosts, but the same commands work on Windows.

##### Walk-through
1. Set up the swarm.
a. On **host1**, initialize a swarm (and if prompted, use **--advertise-addr** to specify the IP address for the interface that communicates with other hosts in the swarm, for instance, the private IP address on AWS):
```bash
docker swarm init
```
b. On **host2**, join the swarm as instructed above:
```bash
docker swarm join --token <your_token> <your_ip_address>:2377
```
If the node fails to join the swarm, the **docker swarm join** command times out. To resolve, run **docker swarm leave --force** on **host2**, verify your network and firewall settings, and try again.

2. On **host1**, create an attachable overlay network called **test-net**:
```console
boyang:~$ docker network create --driver=overlay --attachable test-net
94xusd2l3mvr6nt7k5k6d5utj
```
**Notice** the returned NETWORK ID -- you will see it again when you connect to it from **host2**.
3. On **host1**, start an interactive (**-it**) container (**alpine1**) that connects to **test-net**:

```bash
docker run -it --name alpine1 --network test-net alpine
```
**NOTE:** If you faing "docker unable to enable skip dnat rule", please **sudo systemctl restart docker**

4. On **host2**, list the available networks -- notice that **test-net** does not yet exist:
```bash
docker network ls
```

5. On **host2**, start a detached (**-d**) and interactive (**-it**) container (**alpine2**) that connects to **test-net**:
```bash
docker run -dit --name alpine2 --network test-net alpine
```
**NOTE:** Automatic DNS container discovery only works with unique container names.

6. On **host2**, verify that **test-net** was created (and has the same NETWORK ID as **test-net** on **host1**):
```bash
docker network ls
```

7. On **host1**, ping **alpine2** within the interactive terminal of **alpine1**:
```bash
ping -c 2 alpine2
```

The two containers communicate with the overlay network connecting the two hosts. If you run another alpine container on host2 that is not detached, you can ping alpine1 from host2 (and here we add the remove option for automatic container cleanup):
```bash
docker run -it --rm --name alpine3 --network test-net alpine
```

8. On host1, close the alpine1 session (which also stops the container):
```console
/ # exit
```

9. Clean up your containers and networks:

You must stop and remove the containers on each host independently because Docker daemons operate independently and these are standalone containers. You only have to remove the network on host1 because when you stop alpine2 on host2, test-net disappears.

a. On host2, stop alpine2, check that test-net was removed, then remove alpine2:
```bash
docker container stop alpine2
docker network ls
docker container rm alpine2
```
a. On host1, remove alpine1 and test-net:
```bash
$ docker container rm alpine1
$ docker network rm test-net
```

#### Communicate between a container and a swarm service
In this example, you start two different alpine containers on the same Docker host and do some tests to understand how they communicate with each other. You need to have Docker installed and running.

1. Open a terminal window. List current networks before you do anything else. Here’s what you should see if you’ve never added a network or initialized a swarm on this Docker daemon. You may see different networks, but you should at least see these (the network IDs will be different):

```console
$ docker network ls

NETWORK ID          NAME                DRIVER              SCOPE
17e324f45964        bridge              bridge              local
6ed54d316334        host                host                local
7092879f2cc8        none                null                local
```
The default **bridge** network is listed, along with **host** and **none**. The latter two are not fully-fledged networks, but are used to start a container connected directly to the Docker daemon host’s networking stack, or to start a container with no network devices. This tutorial will connect two containers to the bridge network.

2. Start two **alpine** containers running **ash**, which is Alpine’s default shell rather than **bash**. The **-dit** flags mean to start the container detached (in the background), interactive (with the ability to type into it), and with a TTY (so you can see the input and output). Since you are starting it detached, you won’t be connected to the container right away. Instead, the container’s ID will be printed. Because you have not specified any **--network** flags, the containers connect to the default **bridge** network.

```bash
$ docker run -dit --name alpine1 alpine ash

$ docker run -dit --name alpine2 alpine ash
```

Check that both containers are actually started:

```console
boyang:~$ docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
289df352d7a5        alpine              "ash"               9 seconds ago       Up 8 seconds                            alpine2
f290d44a25c0        alpine              "ash"               21 seconds ago      Up 21 seconds                           alpine1
```

3. Inspect the **bridge** network to see what containers are connected to it.
```console
boyang:~$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "26457e3bc6552ecfe3a0ccee3f49dcdf729895551253cd2e1a20409794b7c664",
        "Created": "2020-12-02T14:30:59.20531188+08:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "289df352d7a5420a0976ff3580ad375833d8d507ff65de801966e58fcc6ecd67": {
                "Name": "alpine2",
                "EndpointID": "99efbc2b3657fc2d92c91760f1d2bb2eabc3760fcf3e8ccefef89537d9faea67",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            },
            "f290d44a25c05ce1940ab72c49d5be2bdfe16f2780624f3968b6e1fdfa4f91ab": {
                "Name": "alpine1",
                "EndpointID": "d210fe84902f4278188257074f5be4d0e6dab86baac146a4067af415734a01a5",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
```

Near the top, information about the **bridge** network is listed, including the IP address of the gateway between the Docker host and the **bridge** network (**172.17.0.1**). Under the **Containers** key, each connected container is listed, along with information about its IP address (**172.17.0.2** for **alpine1** and **172.17.0.3** for **alpine2**).

4. The containers are running in the background. Use the **docker attach** command to connect to **alpine1**.
```console
boyang:~$ docker attach alpine1
/ # 
```
The prompt changes to **#** to indicate that you are the **root** user within the container. Use the **ip addr show** command to show the network interfaces for **alpine1** as they look from within the container:
```console
## ip addr show
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
6024: eth0@if6025: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue state UP 
    link/ether 02:42:ac:11:00:02 brd ff:ff:ff:ff:ff:ff
    inet 172.17.0.2/16 brd 172.17.255.255 scope global eth0
       valid_lft forever preferred_lft forever
```
The first interface is the loopback device. Ignore it for now. Notice that the second interface has the IP address **172.17.0.2**, which is the same address shown for **alpine1** in the previous step.

5. From within **alpine1**, make sure you can connect to the internet by pinging **google.com**. The **-c 2** flag limits the command two two **ping** attempts.
```console
## ping -c 2 google.com
PING google.com (172.217.194.113): 56 data bytes
64 bytes from 172.217.194.113: seq=0 ttl=49 time=60.069 ms
64 bytes from 172.217.194.113: seq=1 ttl=49 time=60.103 ms

--- google.com ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 60.069/60.086/60.103 ms
```

6. Now try to ping the second container. First, ping it by its IP address, **172.17.0.3**:
```console
## ping -c 2 172.17.0.3
PING 172.17.0.3 (172.17.0.3): 56 data bytes
64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.058 ms
64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.131 ms

--- 172.17.0.3 ping statistics ---
2 packets transmitted, 2 packets received, 0% packet loss
round-trip min/avg/max = 0.058/0.094/0.131 ms
```

This succeeds. Next, try pinging the **alpine2** container by container name. This will fail.
```console
## ping -c 2 alpine2
ping: bad address 'alpine2'
```

7. Detach from **alpine1** without stopping it by using the detach sequence, **CTRL + p** **CTRL + q **(hold down CTRL and type p followed by q). If you wish, attach to **alpine2** and repeat steps 4, 5, and 6 there, substituting **alpine1** for **alpine2**.

8. Stop and remove both containers.
```bash
$ docker container stop alpine1 alpine2
$ docker container rm alpine1 alpine2
```

**Remember**, the default bridge network is not recommended for production.

### Macvlan
Macvlan networks allow you to assign a MAC address to a container, making it appear as a physical device on your network. The Docker daemon routes traffic to containers by their MAC addresses. Using the macvlan driver is sometimes the best choice when dealing with legacy applications that expect to be directly connected to the physical network, rather than routed through the Docker host’s network stack.

Some applications, especially legacy applications or applications which monitor network traffic, expect to be directly connected to the physical network. In this type of situation, you can use the macvlan network driver to assign a MAC address to each container’s virtual network interface, making it appear to be a physical network interface directly connected to the physical network. In this case, you need to designate a physical interface on your Docker host to use for the macvlan, as well as the subnet and gateway of the macvlan. You can even isolate your macvlan networks using different physical network interfaces. Keep the following things in mind:

+ It is very easy to unintentionally damage your network due to IP address exhaustion or to “VLAN spread”, which is a situation in which you have an inappropriately large number of unique MAC addresses in your network.

+ Your networking equipment needs to be able to handle “promiscuous mode”, where one physical interface can be assigned multiple MAC addresses.

+ If your application can work using a bridge (on a single Docker host) or overlay (to communicate across multiple Docker hosts), these solutions may be better in the long term.

#### Create a macvlan network

When you create a macvlan network, it can either be in bridge mode or 802.1q trunk bridge mode.

+ In bridge mode, macvlan traffic goes through a physical device on the host.

+ In 802.1q trunk bridge mode, traffic goes through an 802.1q sub-interface which Docker creates on the fly. This allows you to control routing and filtering at a more granular level.

##### Bridge mode

To create a macvlan network which bridges with a given physical network interface, use --driver macvlan with the docker network create command. You also need to specify the parent, which is the interface the traffic will physically go through on the Docker host.

```console
$ docker network create -d macvlan \
  --subnet=172.16.86.0/24 \
  --gateway=172.16.86.1 \
  -o parent=eth0 pub_net
```

If you need to exclude IP addresses from being used in the macvlan network, such as when a given IP address is already in use, use --aux-addresses:

```console
$ docker network create -d macvlan \
  --subnet=192.168.32.0/24 \
  --ip-range=192.168.32.128/25 \
  --gateway=192.168.32.254 \
  --aux-address="my-router=192.168.32.129" \
  -o parent=eth0 macnet32
```

##### 802.1q trunk bridge mode

If you specify a parent interface name with a dot included, such as eth0.50, Docker interprets that as a sub-interface of eth0 and creates the sub-interface automatically.

```console
$ docker network create -d macvlan \
    --subnet=192.168.50.0/24 \
    --gateway=192.168.50.1 \
    -o parent=eth0.50 macvlan50
```

##### Use an ipvlan instead of macvlan

In the above example, you are still using a L3 bridge. You can use ipvlan instead, and get an L2 bridge. Specify -o ipvlan_mode=l2.

```console
$ docker network create -d ipvlan \
    --subnet=192.168.210.0/24 \
    --subnet=192.168.212.0/24 \
    --gateway=192.168.210.254 \
    --gateway=192.168.212.254 \
     -o ipvlan_mode=l2 ipvlan210
```

##### Use IPv6

If you have configured the Docker daemon to allow IPv6, you can use dual-stack IPv4/IPv6 macvlan networks.

```console
$ docker network create -d macvlan \
    --subnet=192.168.216.0/24 --subnet=192.168.218.0/24 \
    --gateway=192.168.216.1 --gateway=192.168.218.1 \
    --subnet=2001:db8:abc8::/64 --gateway=2001:db8:abc8::10 \
     -o parent=eth0.218 \
     -o macvlan_mode=bridge macvlan216
```

### None
For this container, disable all networking. Usually used in conjunction with a custom network driver. none is not available for swarm services. See disable container networking.

### Network plugins
You can install and use third-party network plugins with Docker. These plugins are available from Docker Hub or from third-party vendors. See the vendor’s documentation for installing and using a given network plugin.

