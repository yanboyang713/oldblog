# Getting started with Setup A Kubernetes Cluster

## Introduction
A Kubernetes Cluster is a group of node or machines running together. At the highest level of Kubernetes, there exist two kinds of servers, a Master and a Worker node. These servers can be Virtual Machine (VM) or physical servers (Bare metal). Together, these servers form a Kubernetes cluster and are controlled by the services that make up the Control Plane. Kubernetes development started by focusing on the key features of an orchestrator, such as replication of an application with load balancing and service discovery, followed by basic health checks and repair features to ensure availability.

Helm, a package manager for Kubernetes, was launched in early 2016, aimed at simplifying how one defines, installs, and upgrades complex Kubernetes applications.

Minikube brought the Kubernetes environment to a developer’s local system.

In this blog, I will cover How to install and configure a three-node cluster in Kubernetes which is the first topic in Kubernetes.
 
## K8s Architecture/Components
Kubernetes follows a client-server architecture where the master is installed on a machine and nodes are distributed across multiple machines accessible via the master.

The K8s master and K8s workers are part of the Kubernetes control plane, whereas the container registry may lie outside of the control plane.

### Kubernetes Master
The Kubernetes master is the main node responsible for managing the entire cluster. The orchestration of the K8s workers is handled by this node. This node is replicable to avoid any single point of failure. The control panel accesses the master only to make modifications to the cluster. The master comprises four major components.

+ **API server**: This is the front end of a Kubernetes control plane. It maintains RESTful web services to define and configure a Kubernetes cluster.
+ **etcd**: This is a highly available component maintaining a record of all the objects running in the system. Any changes in the configuration of Kubernetes are stored here, and the changes are allowed to be watched for immediate action.
+ **Scheduler**: This schedules workloads on Kubernetes workers in the form of pods. We will cover pods in the next section. The scheduler reads through the resource requirements of each pod and distributes the pods throughout the cluster based on availability. By default, it also tries to distribute pod replicas to different nodes to maintain high availability.
+ **Controller manager**: This runs controllers in the background that are responsible for different important tasks in the cluster. Controllers keep watch on etcd for configuration changes and take the cluster to the desired state; on the other end, the control loops watch for the changes in the cluster and work to maintain the desired state as per etcd. Let’s visit a few controller examples to understand what controllers do in the cluster.
	+ **Node controller**: This monitors the nodes in the cluster and responds when a node comes up or goes down. This is important so the scheduler can align pods per the availability of a node and maintain state per etcd. 
	+ **Endpoint controller**: This joins services and pods by creating endpoint records in the API, and it alters the DNS configuration to return an address pointing to one of the pods running the service. 
	+ **Replication controller**: Replication is a general practice to maintain the high availability of an application. The replication controller makes sure the desired number of pod replicas/copies is running in the cluster.

### Kubernetes Workers (also cald minions or node)
The actual application runs on worker nodes. Each node has three major components.

+ **Kubelet**: Kubelet is the primary node agent running on each node and monitoring that the containers on the node are running and healthy. Kubelet takes a set of PodSpecs, which is a YAML or JSON object describing a pod, and monitors the containers described in those specs only. Note that there can be other containers, other than the containers listed in PodSpecs, running on the node, but Kubelet does not monitor these containers.
+ **Kube-proxy**: The Kubernetes master scheduler usually runs multiple services on a node. Kube-proxy creates a network proxy and load balancer for these services. It can do simple TCP, UDP, and SCTP stream forwarding or round-robin TCP, UDP, and SCTP forwarding across a set of back ends. It also allows, if configured, nodes to be exposed to the Internet.
+ **Pods**: A pod is the smallest unit of the Kubernetes object model that can be created, deployed, or destroyed. A Kubernetes pod usually has a single container but is allowed to contain a group of tightly coupled containers as well. A pod represents a running process on a cluster. It can be used in two broad ways.
	+ Single-container pod: This was the most common Kubernetes use case, also called one container per pod. The pod wraps the container and provides an abstract layer to Kubernetes to access or modify the container.
	+ Multiple-container pod: There are scenarios when an application requires multiple tightly coupled containers that are sharing resources. In such scenarios, a pod builds a wrapper on these containers and treats them as a single service. An example would be one container serving REST APIs to end users, with a sidecar counting the number of requests implementing the API limitation. The containers inside a pod share the same IP that was given to the pod and share the same set of storage.

Containers, as stated earlier, deployed inside each pod run the service. The container packaging and storage depend on the container runtime and registry.
+ **Container runtime**: To understand this, let’s try to understand what a container is. A container is a unit of code packaged with its dependencies that creates an artifact that can run quickly on different computing environments. The container runtime lets someone run containers by providing a basic set of resources and libraries, which combined with the container’s package boots up an application. An application in a container has the liberty of its own environment including storage, network, etc., with the restriction of how much of each resource can be used. The container runtime also manages container images on a node. There are multiple container runtimes available, so let’s go through a couple of them.
	+ containerd
	+ CRI-O
	+ Docker
**NOTE:** Which container runtime to choose is a matter of personal preference and also depends on how complex your codebase is and the kind of resources it depends on.

+ **Container registry**: Each container generation requires code development, adding libraries from different package managers and creating the basic environment to run the code. A container can be built every time when deploying, but getting the latest code, getting new libraries, and preparing the environment every time is time-consuming. To simplify this, developers store their once-created container and use it whenever required. The container registry is the place that allows developers to save their container images and use them as and when required. Individual providers such as Azure, Docker, and Google have their own container registries that host images in a highly available environment with access-level restrictions.

Kubernetes uses the Container Runtime Interface (CRI) to interact with the container runtime. Since Kubernetes 1.5, container runtimes are expected to implement CRI, which acts as a bridge between Kubernetes Kubelet and the container runtime. CRI provides an abstraction between Kubernetes and the container runtimes and enables Kubernetes to run independent of the container runtimes. Now that you understand the architecture of Kubernetes, let’s try to understand a few important terminologies used in Kubernetes.

## Kubernetes Terminology
There are a few terms that we may be using frequently. Let’s go through a few of them to avoid any confusion in future references.

+ **Deployment**: A deployment is an abstract unit built on pods. To deploy an application or a microservice, one needs to run it inside a pod. To do so, a deployment configuration is created where one states what needs to be deployed along with the number of replicas of the application. On submitting this configuration to Kubernetes, a set of pods is spawned by the deployment controller deploying the application with the configured replicas.
+ **Image**: An image is the software/container that will be deployed on the cluster. We will be using image interchangeably with Docker image.
+ **Kubectl**: This is a CLI to interact with a Kubernetes cluster. We will be using this to deploy clusters, check the status of them, and update our clusters.
+ **Namespace**: As the name suggests, this is used to group multiple virtual clusters on the same Kubernetes instance or organize the resources within the same cluster. It allows each resource to be identified uniquely.
+ **Replicaset**: This is the same as a replication controller with an additional support of a set-based selector rather than an equality-based selector.
+ **Service**: This is a description of how an application deployed on one or multiple pods can be accessed internally or externally. Since pods are not permanent and Kubernetes may relocate pods from time to time based on availability, relying on direct access to pods is not recommended. The service discovers the application running in pods and provides access to them via ports, load balancers, or other mechanisms.
+ **StatefulSet**: This is similar to a deployment managing the ordering and uniqueness of the pods. In other words, if a pod dies, a new pod is spawned by the StatefulSet controller with the same identity and resources as the dead pod.

## Set Up a Kubernetes Cluster
 
There are 3 ways to deploy a Kubernetes cluster:
1. By deploying all the components separately.
2. Using Kubeadm.
3. Using Managed Kubernetes Services, such as Azure Kubernetes Service (AKS)
4. Minikube
 
![](https://k21academy.com/wp-content/uploads/2020/10/cluster_1.png)
 
In this blog, I will using Kubeadm deploy this Kubernetes cluster.
 
## Prerequisites For Cluster Setup
1. I am using proxmox create three VM (one Master Node and 2 Worker Nodes) on my on-premises network.
To create an Ubuntu Virtual Machine on proxmox, please, have a check my blog.
![](https://k21academy.com/wp-content/uploads/2020/10/hhhhjhkjsfsd.jpeg)
 
2. The Ports specified below are the default Port range for NodePort Services for Master and Worker Nodes.
![](https://k21academy.com/wp-content/uploads/2020/10/WhatsApp-Image-2020-10-05-at-11.34.29.jpeg)
Port numbers marked with * are overridable, so we have to make sure that any custom ports we provide are open.
 
## The specifications required for a Node:
 
One or more machines running a deb/rpm-compatible Linux OS; for example Ubuntu or CentOS.
(Note: I am going to use Ubuntu in this setup.)
8 GiB or more of RAM per machine.
At least 4 CPUs on the machine that you use as a control-plane node.
 
## Installing Docker, Kubectl, And Kubeadm Packages
After doing the above-mentioned process, we have to install some packages on our machines. These packages are:
 
**Docker**  –  is a software responsible for running the containers.
**kubeadm** – a CLI tool that will install and configure the various components of a cluster in a standard way.
**kubelet** – a system service/program that runs on all nodes and handles node-level operations.
**kubectl** – a CLI tool used for issuing commands to the cluster through its API Server.
In order to install these packages, follow the steps mentioned below on Master as well as Worker nodes:
 
### Step 1
We have to do SSH to our virtual machines with the username and password. If you are a Linux or Mac user then use ssh command and if you are a Windows user then you can use Putty.
 
```bash 
 $ ssh root@publicipaddress
```
### Step 2
If you have logged in using another user, then we can switch to root user using the following command:
 
```bash
$ sudo su
```
 
### Step 3
Now we will install the Docker package in our machine.
 
To Install Docker on the local system, you can check out the following blog.
https://www.yanboyang.com/2020/10/12/dockerInstall/#Install-Docker
 
### Step 4
We have to download packages like Kubeadm and kubectl using https, so we have to download the https package first. Use the following command for this:
```bash
 $ apt-get update && apt-get install -y apt-transport-https
```
 
### Step 5
We have to add the required GPG key to our apt-sources to authenticate the Kubernetes related packages we will install:
```bash
 $ curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
```
 
### Step 6
To add Kubernetes to the package manager’s list of resources, use the following command:
(Note: Type the following command carefully)
 
```console
root@k8s-master-ct:~# cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
> deb https://apt.kubernetes.io/ kubernetes-xenial main
> EOF
deb https://apt.kubernetes.io/ kubernetes-xenial main
```
 
### Step 7
Before installing the packages, update the apt-get command:
```bash
$ apt-get update
 ```
 
### Step 8
Now we will install Kubelet, Kubeadm, and kubectl packages into our machines. Run the following command:
```bash
$ apt-get install -y kubelet kubeadm kubectl
 ```
 
### Step 9
To hold the installed packages at their installed versions, use the following command:
```bash
$ apt-mark hold kubelet kubeadm kubectl
```
 
## Create A Kubernetes Cluster
As we have successfully installed Kubeadm, next we will create a Kubernetes cluster using the following mentioned steps:
 
### Step 1
We have to initialize kubeadm on the master node. This command will check against the node that we have all the required dependencies. If it is passed, then it will install control plane components.
(Note: Run this command in Master Node only.)
```bash
 $ kubeadm init
```
 
**NOTE:**
1.  [WARNING SystemVerification]: this Docker version is not on the list of validated versions: 20.10.1. Latest validated version: 19.03
```bash
apt-get remove docker-ce docker-ce-cli containerd.io
```
then sudo apt-cache policy docker-ce docker-ce-cli containerd.io this will show the list of docker packages available
 
apt-get install docker-ce=5:19.03.14~3-0~ubuntu-focal docker-ce-cli=5:19.03.14~3-0~ubuntu-focal containerd.io
 
2. [ERROR Swap]: running with swap on is not supported. Please disable swap
swapoff -a
 
sudo swapoff -a is not persistent across reboot.
 
You may disable swap after reboot by just commenting out (add # in front of the line) the swap entry in /etc/fstab file. It will prevent swap partition from automatically mounting after a reboot.
 
Steps:
 
Open the file /etc/fstab
 
Look for a line below
 
swap was on /dev/sda5 during installation
 
UUID=e7bf7d6e-e90d-4a96-91db-7d5f282f9363 none swap sw 0 0
 
Comment out above line with # and save it. It should look like below
 
swap was on /dev/sda5 during installation
 
##UUID=e7bf7d6e-e90d-4a96-91db-7d5f282f9363 none swap sw 0 0
 
Reboot the system or for current session execute "sudo swapoff -a" to avoid reboot.
 
If this is a lxc container in proxmox, you can set Swap to 0.
![](./swap.png)
 
3. [ERROR SystemVerification]: failed to parse kernel config: unable to load kernel module: "configs", output: "modprobe: FATAL: Module configs not found in directory /lib/modules/5.4.78-2-pve\n", err: exit status 1
 
apt-get install linux-image-$(uname -r)

## Minikube
Minikube – a utility to run a Kubernetes cluster locally on your PC. It can use Virtualbox, VMware, Hyper-V etc hypervisors which will be used to create a virtual machine with a Kubernetes cluster. Minikube is a great tool for developers or DevOps engineers to test deployments/services etc without the need to create and conigure a real cluster.

A quick HowTo install it and run a Kubernetes pod using the Minikube.

### Installing
+ In manjaro can be installed from AUR:
```bash
yay -S minikube
```

+ If you haven’t Virtualbox yet – install it
minikube can be deployed as a VM, a container, or bare-metal.

To do so, we use the Docker Machine library to provide a consistent way to interact with different environments. VirtualBox is minikube’s original driver. It may not provide the fastest start-up time, but it is the most stable driver available for users of Microsoft Windows Home.



```console
[yanboyang713@boyang ~]$ yay -S virtualbox
[sudo] password for yanboyang713: 
resolving dependencies...
:: There are 10 providers available for VIRTUALBOX-HOST-MODULES:
:: Repository extra
   1) linux414-virtualbox-host-modules  2) linux419-virtualbox-host-modules
   3) linux44-virtualbox-host-modules  4) linux49-virtualbox-host-modules
   5) linux510-virtualbox-host-modules  6) linux54-virtualbox-host-modules
   7) linux59-virtualbox-host-modules
:: Repository community
   8) linux54-rt-virtualbox-host-modules  9) linux59-rt-virtualbox-host-modules
   10) virtualbox-host-dkms
```

**NOTE:** You virtualbox should match your linux kernel. If you don't know your kernel version. Please, open a terminal and type the following command to check the version of your Manjaro system’s kernel:

```console
[yanboyang713@boyang ~]$ uname -r
5.9.11-3-MANJARO
```

+ minikube will work with Kubernetes via kubectl – install it as well:

```bash
yay -S kubectl
```

### Start Minikube
+ Start Minikube itself

```console
[yanboyang714@boyang ~]$ minikube start --driver=virtualbox
😄  minikube v1.16.0 on Arch 20.2.1
✨  Using the virtualbox driver based on user configuration
💿  Downloading VM boot image ...
    > minikube-v1.16.0.iso.sha256: 65 B / 65 B [-------------] 100.00% ? p/s 0s
    > minikube-v1.16.0.iso: 212.62 MiB / 212.62 MiB [] 100.00% 25.68 MiB p/s 8s
👍  Starting control plane node minikube in cluster minikube
🔥  Creating virtualbox VM (CPUs=2, Memory=3900MB, Disk=20000MB) ...
🐳  Preparing Kubernetes v1.20.0 on Docker 20.10.0 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔎  Verifying Kubernetes components...
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

+ To make virtualbox the default driver:
```bash
minikube config set driver virtualbox
```
+ Special features
minikube start supports some VirtualBox specific flags:

	+ **--host-only-cidr**: The CIDR to be used for the minikube VM (default “192.168.99.1/24”)
	+ **--no-vtx-check**: Disable checking for the availability of hardware virtualization

+ Check Virtualbox VMs running
```bash
VBoxManage list runningvms
```

### Pod
+ Create a new pod

```console
[yanboyang713@boyang ~]$ kubectl run hello-minikube --image=gcr.io/google_containers/echoserver:1.4 --port=8080
deployment.apps/hello-minikube created
```

+ List pods
```console
[yanboyang713@boyang ~]$ kubectl get pod
NAME             READY   STATUS    RESTARTS   AGE
hello-minikube   1/1     Running   0          2m32s
```

+ Delete Pods
```console
[yanboyang713@boyang ~]$ kubectl delete pods hello-minikube
pod "hello-minikube" deleted
```

### Deployment
+ Creaye a new deployment
```bash
kubectl create deployment hello-test --image=k8s.gcr.io/echoserver:1.10
```
+ List Deployment
```bash
kubectl get deployment
```
+ Delete Deployment
```bash
kubectl delete deployments hello-test
```

### Service
+ Run the service
```bash
kubectl expose deployment hello-minikube --type=NodePort
```

+ List service
```console
[yanboyang713@boyang ~]$ minikube service list
|-------------|------------|--------------|-----|
|  NAMESPACE  |    NAME    | TARGET PORT  | URL |
|-------------|------------|--------------|-----|
| default     | kubernetes | No node port |
| kube-system | kube-dns   | No node port |
|-------------|------------|--------------|-----|
```

+ Check the service itself
```bash
curl $(minikube service hello-minikube --url)
```

### Dashboard
```console
[yanboyang713@boyang ~]$ minikube dashboard &
[1] 9782
[yanboyang713@boyang ~]$ 🤔  Verifying dashboard health ...
🚀  Launching proxy ...
🤔  Verifying proxy health ...
🎉  Opening http://127.0.0.1:43353/api/v1/namespaces/kubernetes-dashboard:/proxy/ in your default browser...
/usr/bin/xdg-mime: line 323: [: /home/yanboyang713/.local/share/appltor expected
/usr/bin/xdg-mime: line 325: [: /home/yanboyang713/.local/share/applpected
```

**NOTE:** If hangs on "Verifying proxy health" or show "Exiting due to SVC_URL_TIMEOUT: http://127.0.0.1:39481/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ is not accessible: Temporary Error: unexpected response code: 503"
Please, check your Minikube driver set-up: https://minikube.sigs.k8s.io/docs/drivers/

### Stop Minikube
```console
[yanboyang713@boyang ~]$ kubectl get pods -o wide
No resources found in default namespace.
[yanboyang713@boyang ~]$ minikube stop
✋  Stopping node "minikube"  ...
🛑  Powering off "minikube" via SSH ...
🛑  1 nodes stopped.
```

## Run an Application on Kubernetes
We have our Kubernetes cluster ready, so let’s try to deploy an application on it and understand how it happens.

### Application Details
Let’s start by creating a simple web application in Python using Flask.

+ The app structure should look like this:

```console
[yanboyang713@boyang WebApp]$ tree .
.
├── app.py
├── Dockerfile
└── requirement.txt

0 directories, 3 files
```

+ Let’s create a project called WebApp with app.py inside to handle web requests:
```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def main():
    return "Welcome!"

if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

+ Let’s create a Dockerfile to containerize the application:
```Docker
FROM ubuntu:18.04
RUN apt-get update -y && apt-get install -y python-pip python-dev
COPY ./requirement.txt /app/requirement.txt
WORKDIR /app
RUN pip install -r requirement.txt
COPY . /app
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]
```

+ requirement.txt:
```file
flask
```

### Image Pushing and Building
+ Pushing images to Minikube cluster

The Docker environment and images stored are different for Minikube. Instead of storing images to our local environment, sending them to the registry, and bringing them back on Minikube, we will be storing the container image directly on the Minikube instance.

There are five ways to push your image into a minikube cluster. Details: https://minikube.sigs.k8s.io/docs/handbook/pushing/#3-pushing-directly-to-in-cluster-crio-podman-env

The default container-runtime on minikube is ‘docker’, so at the below, we will focue on Docker.

The command minikube docker-env returns a set of Bash environment variable exports to configure your local environment to re-use the Docker daemon inside the Minikube instance.

```console
[yanboyang713@boyang WebApp]$ minikube docker-env
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/home/yanboyang713/.minikube/certs"
export MINIKUBE_ACTIVE_DOCKERD="minikube"

## To point your shell to minikube's docker-daemon, run:
## eval $(minikube -p minikube docker-env)
```
When using a container or VM driver (all drivers except none), you can reuse the Docker daemon inside minikube cluster. These variables will help your docker CLI (where you write docker commands) to connect with docker daemon in the VM created by minikube !

Now, to connect your Docker CLI to the docker daemon inside the VM you need to run the command at the below.

This will temporarily(for that terminal) connect CLI to docker daemon inside the VM :)

This means you don’t have to build on your host machine and push the image into a docker registry. You can just build inside the same docker daemon as minikube which speeds up local experiments.

Run:
```bash
eval $(minikube -p minikube docker-env)
```

Passing this output through eval causes bash to evaluate these exports and put them into effect.

You can review the specific commands which will be executed in your shell by omitting the evaluation step and running minikube docker-env directly. However, this will not perform the configuration – the output needs to be evaluated for that.

so if you do the following commands, it will show you the containers inside the minikube, inside minikube’s VM or Container.

Now, try to do docker ps , you can see all the containers created inside the VM (will be shown only if you have done some work in k8's cluster)

This is all possible due to those environment variables by docker-env


```bash
docker ps
```

+ Build the WebApp application container with the name web-app and assign version 1.0.
```bash
docker build -t web-app:1.0 .
```

This is a workflow optimization intended to improve your experience with building and running Docker images which you can run inside the minikube environment. It is not mandatory that you re-use minikube's Docker daemon to use minikube effectively, but doing so will significantly improve the speed of your code-build-test cycle.

In a normal workflow, you would have a separate Docker registry on your host machine to that in minikube, which necessitates the following process to build and run a Docker image inside minikube:

1. Build the Docker image on the host machine.
2. Re-tag the built image in your local machine's image registry with a remote registry or that of the minikube instance.
3. Push the image to the remote registry or minikube.
(If using a remote registry) Configure minikube with the appropriate permissions to pull images from the registry.
4. Set up your deployment in minikube to use the image.

By re-using the Docker registry inside Minikube, this becomes:

1. Build the Docker image using Minikube's Docker instance. This pushes the image to Minikube's Docker registry.
2. Set up your deployment in minikube to use the image.

Try to run minikube docker-env
You will see some environment variables are mentioned there :)

### Deploy the Application
Let’s create our first deployment configuration. This tells Kubernetes to create a container for our application. We create the webapp-deployment.yaml file for our webapp.

```file
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: web-app:1.0
        imagePullPolicy: Never
        ports:
        - containerPort: 5000

```

Let’s try to understand the YAML file.
+ apiVersion: This is the API version used to create this object.
+ kind: This explains that we are creating a Kubernetes deployment.
+ metadata: This specifies the name of deployment (a must-have key) and optional labels one may want to put on the deployment.
+ replicas: This specifies the number of pods to be created for this deployment.
+ selector: This is how the deployment manages to locate the pods.
+ template.metadata: The pods created from this deployment will be named from these labels.
+ containers: This specifies the containers that need to be deployed in this pod. In our case, we are deploying one container with the image we created in the previous section. Since we made sure in the previous section that the image is available to the Kubernetes cluster, we haven’t uploaded the image to any registry, and therefore imagePullPolicy is set to Never.
+ ports: This is the port of the container exposed to the cluster.

Deploy the application on the cluster using this:
```console
[yanboyang713@boyang WebApp]$ kubectl apply -f webapp-deployment.yaml
deployment.apps/webapp-deployment created
```
This command applies the configuration defined in YAML on the Kubernetes cluster. In other words, it creates a deployment named webapp-deployment. 

**NOTE:** Use older version of Kubernetes (1.15) when validator accept extensions as apiVersion for Deployment and StatefulSet. We are using 1.15, so apiVersion should be apps/v1.
To convert an older Deployment to apps/v1, you can run:

```bash
kubectl convert -f ./my-deployment.yaml --output-version apps/v1
```

Shows all the deployments on the cluster with their status and the number of running and active replicas.

```console
[yanboyang713@boyang WebApp]$ kubectl get deployment
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
webapp-deployment   1/1     1            1           27m
```

The figure shows there is a pod running the WebApp application. The deployment spawns a ReplicaSet, which tries to maintain the state of having one pod running at all times. You can use the command at the below, show the running ReplicaSets and pods on the cluster.

```console
[yanboyang713@boyang WebApp]$ kubectl get replicaset -o wide
NAME                           DESIRED   CURRENT   READY   AGE   CONTAINERS   IMAGES        SELECTOR
webapp-deployment-6c4c85876d   1         1         1       33m   webapp       web-app:1.0   app=webapp,pod-template-hash=6c4c85876d
```

```console
[yanboyang713@boyang WebApp]$ kubectl get pods -o wide
NAME                                 READY   STATUS    RESTARTS   AGE   IP           NODE       NOMINATED NODE   READINESS GATES
webapp-deployment-6c4c85876d-wj8t2   1/1     Running   0          34m   172.17.0.5   minikube   <none>           <none>
```

The pod details include an IP address. The pod is accessible to the internal network using this IP address, but as stated earlier, accessing pods directly via IP addresses is discouraged since pods are expendables and a new pod might have a different IP address. It is clear from the IP address that though the pod is accessible through this IP address inside the Kubernetes network, one may not be able to access it from the host machine. Kubectl provides a way to use a proxy for the pod and access the application from the host machine.

```console
[yanboyang713@boyang WebApp]$  kubectl port-forward webapp-deployment-6c4c85876d-wj8t2 5000:5000
Forwarding from 127.0.0.1:5000 -> 5000
Forwarding from [::1]:5000 -> 5000
```

**NOTE:** webapp-deployment-6c4c85876d-wj8t2 is our pod name, and 5000 is the port exposed on the pod to access the application. 

Now the application is accessible from the host machine. The application running on the host machine browser.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1610906939/k8s/Mon_Jan_18_02_07_13_AM_CST_2021_kgqmtp.png)

The application logs can be accessed from the pod using this:
```console
[yanboyang713@boyang WebApp]$ kubectl logs -f webapp-deployment-6c4c85876d-wj8t2
 * Serving Flask app "app" (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
 * Running on http://0.0.0.0:5000/ (Press CTRL+C to quit)
127.0.0.1 - - [17/Jan/2021 18:01:56] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [17/Jan/2021 18:01:56] "GET /favicon.ico HTTP/1.1" 404 -
127.0.0.1 - - [17/Jan/2021 18:02:43] "GET / HTTP/1.1" 200 -
127.0.0.1 - - [17/Jan/2021 18:02:43] "GET /favicon.ico HTTP/1.1" 404 -
```

## Kubernetes Service
Kubernetes pods are expendable. ReplicaSet creates and destroys pods in the process of scaling up and down; therefore, accessing the pods via an IP address is not a reliable solution. Then how do microservices inside Kubernetes communicate with other microservices? The answer is Kubernetes services. Let’s try to understand the concept of services. Kubernetes services provide a virtual IP-based bridge to access the pods. One may access a single pod or may refer to a group of pods at the same time. There can be two types of interactions.
+ Pods accessing services
+ Services exposed publicly
Before explaining this, let’s expose our web application via a service.

There is a example shows a simple service with the selector pointing to our webapp.

webapp-service.yaml File for Our Web App

```yaml
apiVersion: v1
kind: Service
metadata:
  name: webservice
spec:
  selector:
    app: webapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 5000
```
The service is named webservice and points to the deployments with a selector as app:webapp. The service is exposed on port 80 and proxies the request to port 5000 of the result pods. Apply the service using this:

```console
[yanboyang713@boyang WebApp]$ kubectl apply -f webapp-service.yaml
service/webservice created
```

Verify that the service is created successfully using this:
```console
[yanboyang713@boyang WebApp]$ kubectl describe service webservice
Name:              webservice
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          app=webapp
Type:              ClusterIP
IP:                10.100.103.159
Port:              <unset>  80/TCP
TargetPort:        5000/TCP
Endpoints:         172.17.0.5:5000
Session Affinity:  None
Events:            <none>
```

The service is assigned a cluster IP address of 10.100.103.159. Any microservice inside the cluster will be able to access the service using this IP address via port 80.

Now, let’s try to understand the two types of service interactions possible in a Kubernetes cluster.

### Pods Accessing Services
Any microservices architecture requires a service to access multiple microservices within the private network. The access to other services is possible either through their IP address or through a DNS request. Kubernetes supports both of them.

+ **Environment variables**:
When a pod is launched in a node, Kubectl declares all the running services to be accessed as environment variables for the pod. But this forces a sequence to be followed; if new service is defined after the first service is booted, the first one doesn’t get access to the new service. Try to log in to the Docker container of the webapp pod and check the environment variables. The new service is not visible. If the developer deletes the existing deployment and re-creates the deployment, the service is visible in the environment variables.

How to get this environment variables, You can see the subsection at the below.
```console
[yanboyang713@boyang WebApp]$ kubectl exec --stdin --tty webapp-deployment-6c4c85876d-wj8t2 -- /bin/bash
root@webapp-deployment-6c4c85876d-wj8t2:/app# env
LS_COLORS=rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:
HOSTNAME=webapp-deployment-6c4c85876d-wj8t2
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_ADDR=10.96.0.1
KUBERNETES_PORT=tcp://10.96.0.1:443
PWD=/app
HOME=/root
KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_PORT_443_TCP_PORT=443
KUBERNETES_PORT_443_TCP=tcp://10.96.0.1:443
TERM=xterm
SHLVL=1
KUBERNETES_SERVICE_PORT=443
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
KUBERNETES_SERVICE_HOST=10.96.0.1
_=/usr/bin/env
root@webapp-deployment-6c4c85876d-wj8t2:/app# 
```

+ **DNS**:
Though this is not a default setup, it is an optional but recommended add-on for Kubernetes. As the name says, each service registers a DNS record for itself as soon as it is created. The DNS record follows the pattern <service-name>.<namespace>. Any pod in the same namespace can access the service directly via <service-name>, whereas pods outside the namespace must include .<namespace> to access the service.

#### Getting a shell to a container
1. list pods
```bash
kubectl get pods -o wide
```
2. Verify that the container is running
```bash
kubectl get pod webapp-deployment-6c4c85876d-wj8t2
```
3. Get a shell to the running container
```bash
kubectl exec --stdin --tty webapp-deployment-6c4c85876d-wj8t2 -- /bin/bash
```
**Note**: The double dash (--) separates the arguments you want to pass to the command from the kubectl arguments.

### Services Exposed Publicly
There are multiple ways to expose a service to external world. Kubernetes provides multiple ways of achieving this.

#### ClusterIP
This allows a service to be exposed via a cluster’s internal IP. As shown earlier, a cluster’s internal IP address is exposed and can be accessed by the pods inside the cluster.

#### NodePort
This allows a service to be exposed at the node IP address on a specific port. This allows the service to be accessed via the <NodeIP>:<PORT> address. Internally Kubernetes creates a ClusterIP service that acts as a connection between the node IP and the actual service. The port number can be between 30000 and 32767. Each node proxies the selected port to the service pod.

#### LoadBalancer
This creates a public IP on top of NodePort. So, the service is accessible via a public IP, which is routed to NodePort and then is further routed to ClusterIP. Its implementation varies between cloud providers. A small addition to the configuration creates a LoadBalancer type. There is a example shows the addition of a LoadBalancer type in the service.

```console
[yanboyang713@boyang WebApp]$ cat webapp-service-loadbalancer.yaml 
apiVersion: v1
kind: Service
metadata:
  name: webservice
spec:
  type: LoadBalancer
  selector:
    app: webapp
  ports:
  - protocol: TCP
    port: 80
    targetPort: 5000
```

```console
[yanboyang713@boyang WebApp]$ kubectl get service webservice
NAME         TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)   AGE
webservice   ClusterIP   10.100.103.159   <none>        80/TCP    38h
```
Once a service is created using this configuration, a developer can check the external IP address of the service using this:

```console
[yanboyang713@boyang WebApp]$ kubectl apply -f webapp-service-loadbalancer.yaml 
service/webservice configured
[yanboyang713@boyang WebApp]$ kubectl get service webservice
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
webservice   LoadBalancer   10.100.103.159   <pending>     80:32302/TCP   38h
```
We do not get the external IP address since we are running our application on Minikube. On the cloud, the external IP is populated with a value.

```console
[yanboyang713@boyang WebApp]$ kubectl describe service webservice
Name:                     webservice
Namespace:                default
Labels:                   <none>
Annotations:              <none>
Selector:                 app=webapp
Type:                     LoadBalancer
IP:                       10.100.103.159
Port:                     <unset>  80/TCP
TargetPort:               5000/TCP
NodePort:                 <unset>  32302/TCP
Endpoints:                172.17.0.5:5000
Session Affinity:         None
External Traffic Policy:  Cluster
Events:
  Type    Reason  Age   From                Message
  ----    ------  ----  ----                -------
  Normal  Type    91s   service-controller  ClusterIP -> LoadBalancer
```

#### ExternalName
This simply maps the service to an address using a CNAME record. These are typically used when using an external service from within a cluster and abstracting out the actual link of the external service. There are a example shows a simple service with the type ExternalName.

```console
[yanboyang713@boyang WebApp]$ cat database-external-name.yaml 
apiVersion: v1
kind: Service
metadata:
  name: db1
spec:
  type: ExternalName
  externalName: mysql01.database.test.com
```

When internal pods look for the service db1, they receive a CNAME record of mysql01.database.text.com. There is no forwarding involved; only a single redirection happens at the DNS level. ExternalName also allows a developer to add a custom IP address to a service through which the service can be accessed by clients. The IP assignment is the sole responsibility of the cluster manager; it doesn’t come from Kubernetes. There is an example of an external IP assignment to a service.

```console
[yanboyang713@boyang WebApp]$ cat externalIpAssignedService.yaml 
apiVersion: v1
kind: Service
metadata:
  name: externalIpAssignedService
spec:
  selector:
    app: externalIpService
  ports:
  - name: http
    protocol: TCP
    port: 80
    targetPort: 9000
  externalIPs:
  - 70.34.1.23
```
Kubernetes, as defined earlier, is a self-healing platform. Let’s try to play around a bit with the cluster and see the role of Kubernetes services in it.

### Kubernetes Is Self-Healing
In any application, it’s difficult to assure 100 percent uptime or availability of a single node. Kubernetes provides a means to create replicas of a service and also ensures the number of replicas are intact. Let’s modify our deployment and increase the number of replicas.

```console
[yanboyang713@boyang WebApp]$ kubectl get deployments
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
webapp-deployment   1/1     1            1           40h
[yanboyang713@boyang WebApp]$ kubectl scale --replicas=2 deployment webapp-deployment
deployment.apps/webapp-deployment scaled
[yanboyang713@boyang WebApp]$ kubectl get deployments
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
webapp-deployment   2/2     2            2           40h
[yanboyang713@boyang WebApp]$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
webapp-deployment-6c4c85876d-h4qgg   1/1     Running   0          27s
webapp-deployment-6c4c85876d-wj8t2   1/1     Running   0          40h
```

If one tries to kill any of the pods, the replication controller tries to reinstate the state and spawn a new pod. Let’s try killing one of the pods to see the state of the application.

```console
[yanboyang713@boyang WebApp]$ kubectl delete pod webapp-deployment-6c4c85876d-h4qgg
pod "webapp-deployment-6c4c85876d-h4qgg" deleted
[yanboyang713@boyang WebApp]$ kubectl get pods
NAME                                 READY   STATUS    RESTARTS   AGE
webapp-deployment-6c4c85876d-jnf7r   1/1     Running   0          42s
webapp-deployment-6c4c85876d-wj8t2   1/1     Running   0          40h
```
Through this, Kubernetes tries to keep the service available at all times.

## Add a Microservice
Now you have seen how to deploy and run a microservice on Kubernetes, and you have seen the theory of how microservices interact with each other. Let’s create a new microservice that consumes a response from the webapp and renders it to the UI. Let’s call this app istio-frontend. We have already created a Docker file.

### Application Setup
istio-frontend is a Java application that makes a request to the webapp service and populates its web page with the received data. In case the data is not received or the web-app service is not available, it populates ERROR RECEIVED as a response. We have created a Docker file with the tag frontend-app:1.0. Let’s follow the same approach as the previous application and create a deployment and service for the application. There are a example show the deployment and service file.

```console
[yanboyang713@boyang WebApp]$ cat frontend-deployment.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend-deployment
  labels:
    app: frontend
spec:
  replicas: 1
  selector:
    matchLabels:
      app: frontend
    template:
      metadata:
        labels:
          app: frontend
      spec:
        containers:
        - name: frontend
        image: frontend:1.0
        imagePullPolicy: Never
        ports:
        - containerPort: 8080

[yanboyang713@boyang WebApp]$ cat frontend-service.yaml 
apiVersion: v1
kind: Service
metadata:
  name: frontendservice
spec:
  selector:
    app: frontend
  ports:
  - protocol: TCP
    port: 80
    targetPort: 8080

```

Let’s try to proxy to the new service to get the app running.

Reducing the replica count to 0 for the webapp service.

```bash
kubectl scale --replicas=0 deployment weapp-deployment
```

### Release and Deployment
In a large organization, any application going to production requires regular development and maintenance. With new methodologies like agile firmly in place, release frequency has increased to multiple releases a day and so have release rollbacks. The traditional process of shutting down an application, redeploying, and restarting results in downtime. In the world of 99.99 percent availability, the scope of downtime means one minute or less in a seven-day period, so a single release a week violates the agile
methodology.
To minimize downtime, multiple deployment techniques are used, such as blue-green, canary, and rolling deployments. Kubernetes by default follows a rolling deployment. In other words, it creates two identical environments, and once the new environment is up, traffic is routed to the new environment, and later the old environment is terminated. Let’s upgrade our webapp to 2.0 and see the deployment on Kubernetes in action. There is a example shows the changes in the file. We will simply add time to the welcome message.

```console
[yanboyang713@boyang WebApp]$ cat appV2.py 
from flask import Flask
import datetime

app = Flask(__name__)

@app.route("/")
def main():
    currentDT = datetime.datetime.now()
    return "Welcome user! current time is " + str(currentDT)

if __name__ == "__main__":
    app.run(host='0.0.0.0')

```
Create a new container by following the same process as stated earlier. Below shows the modified deployment file with the upgraded container details.

```console
[yanboyang713@boyang WebApp]$ cat webapp-deployment-v2.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: web-app:2.0
        imagePullPolicy: Never
        ports:
        - containerPort: 5000

```
Let’s deploy the application on a cluster using this:

```bash
kubectl apply -f webapp-deployment-v2.yaml
```

A new pod is spawned, and the earlier one is terminated once the new pod is ready.

What has happened in the background is a new environment with a single machine and version 2.0 is spawned while the webapp service was still pointing to the old environment. Once the new spawned pods returned the running status, the webapp service pointed the traffic to the new environment, and the earlier pods were terminated.

Here’s the catch: what happens when a new pod is spawned but the application inside is still deploying and not yet up? The pod at this point returns a running status, but the application is still down, and at the same time the service starts directing traffic to the new environment. This adds downtime to the service until the application is up and running. To solve this issue, Kubernetes uses a readiness probe.

## Readiness Probes
Updating deployments with new ones can result in downtime as old pods are replaced by new ones. If for some reason the new deployment is misconfigured or has some error, the downtime continues until the error is detected. When a readiness probe is used, the service doesn’t forward traffic to new pods until the probe is successful. It also ensures that the old pods are not terminated until the new deployment pods are ready. This ensures that the deployment with the error doesn’t receive any traffic at all. To incorporate a readiness probe, we need to add a health link to our webapp. There is a example shows the change in the app.py code. A /health link is added, which will be available once the app is up and running. A delay of 60 seconds has been added in the code, which will help demonstrate this behavior of Kubernates.

```console
[yanboyang713@boyang WebApp]$ cat appV3.py 
from flask import Flask
import datetime
import time

time.sleep(60)
app = Flask(__name__)

@app.route("/")
def main():
    currentDT = datetime.datetime.now()
    return "Welcome user! current time in v3 is " + str(currentDT)

@app.route("/health")
def health():
    return "OK"

if __name__ == "__main__":
    app.run(host='0.0.0.0')

```

Create a new container with the tag web-app:3.0 and add it to the deployment file.

```console
[yanboyang713@boyang WebApp]$ cat webapp-deployment-v3.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: web-app:3.0
        imagePullPolicy: Never
        ports:
        - containerPort: 5000
        readinessProbe:
          httpGet:
            path: /health
            port: 5000
          initialDelaySeconds: 40

```

The readiness probe initializes with an initial delay of 40 seconds. If one already knows that an application deployment takes some time, this can be stated in initialDelaySeconds to avoid unnecessary checks on the application. After the initial delay, Kubelet does regular checks on the /health link, and when the link is up, the pod is moved to a ready state to accept traffic. There shows the status of deployment at different times.

Let’s see what happened in the background.
1. Checked the available deployments. A frontend-deployment and a webapp-deployment are working, each having one available pod in a ready state.
2. Applied the new version 3 configuration.
3. The ready pods number remains the same.
4. On getting the pod’s details, we can see two webapp-deployment pods. The old one is ready, and the latest one is running but still not ready to accept traffic.
5. At 40 seconds, no request to the readiness probe is triggered by Kubernetes; therefore, the pod remains in a ready-pending state. By default the health check is done every 10 seconds.
6. After 60 seconds of deployment, the new pod upgrades to a ready state, and the old pod is moved to a terminating state.

This ensures that until the new deployment becomes ready, the earlier deployment is not scrapped, and the traffic is routed to the older one. This is helpful when an application is being upgraded or when a new application is deployed. But this isn’t useful after the deployment is complete and the old deployment pods are terminated. If after that the deployment pods fail for known/unknown reasons, the readiness probe fails, and the traffic is not sent to the pod. This, on one hand, ensures that the application is not down, but the number of pods available to serve the traffic goes down. A corner case would be if the same issue happens to all the pods in the deployment; your complete application may go down. There is no ideal way to deal with such issues, but Kubernetes provides a common solution of restarting the application if the application becomes irresponsive. The liveness probe, similar to the readiness probe, keeps a check on the application, and in case the application stops responding, it restarts the pod. Let’s make a small change in our application to kill the application in 60 seconds and see the behavior of the livenese probe. There is a example shows the change.

```console
[yanboyang713@boyang WebApp]$ cat appStopAfter60sec.py 
from flask import Flask
import datetime
import time
import threading
import os

time.sleep(60)
app = Flask(__name__)

@app.route("/")
def main():
    currentDT = datetime.datetime.now()
    return "Welcome user! current time is " + str(currentDT)

@app.route("/health")
def health():
    return "OK"

def exit_after():
    time.sleep(60)
    os._exit(1)

exit_thread = threading.Thread(target=exit_after)
exit_thread.start()

if __name__ == "__main__":
    app.run(host='0.0.0.0')
```

Create a new container with the tag web-app:4.0 and add it to deployment file.
```console
[yanboyang713@boyang WebApp]$ cat webapp-deployment-v4.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  name: webapp-deployment
  labels:
    app: webapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: webapp
  template:
    metadata:
      labels:
        app: webapp
    spec:
      containers:
      - name: webapp
        image: web-app:4.0
        imagePullPolicy: Never
        ports:
        - containerPort: 5000
        readinessProbe:
          httpGet:
            path: /health
            port: 5000
          initialDelaySeconds: 40
        livenessProbe:
          httpGet:
            path: /health
            port: 5000
          initialDelaySeconds: 120

```

The liveness probe initializes with a delay of 120 seconds. Since we already know the application bootup time takes 60 seconds, it’s no use to restart the app before it even boots up. The same process as redinessProbe is followed to check the health of the application.

Assuming our application fails at some point after the deployment, this is how Kubernetes tries to recover it:
1. When the application goes down, the readiness probe fails.
2. Kubernetes stops the traffic on that pod and restrains itself to the rest of the replicas. In our case, since we have only one replica, the application is bound to have downtime.
3. The liveness probe goes down since it’s on the same health link.
4. Kubernetes tries to restart the pod and restore the application state.
5. After restarting, the application comes up, and the readiness probe is successful.
6. Traffic is restored to this pod.


