# The Ultimate Guide to Podman, Skopeo and Buildah

## Overview

https://docs.oracle.com/en/operating-systems/oracle-linux/podman/podman-containers.html#podman-command-reference

Let's we retire Docker and move to Podman.
A whole new revolution of containerization started with the Docker where the daemon process manages the whole bunch of things and became one of the most popular and widely used container management systems.
However, with the advent of standards from the Open Container Initiative (OCI), other runtimes are being developed. One such runtime is CRI-O, which was created along with a set of tools to provide alternate ways to work directly with containers.

The following text describes some of the tools being developed to use with the CRI-O runtime or as alternative container stand-alone tools. These tools can be used with docker-formatted containers or OCI-conformant containers. While some of these commands were made to use with CRI-O, others can also interact with the docker daemon (as a replacement for features of the docker command) or used to manage containers with no active runtime environment.

+ podman: The podman command can run and manage containers and container images. It supports most of the same features and command options you find in the docker command, with the main differences being that podman doesn’t require the docker service or any other active container runtime for the command to work. Also, podman stores its data in the same directory structure used by CRI-O, which will allow podman to eventually work with containers being actively managed by CRI-O in OpenShift.

+ skopeo: The skopeo command lets you inspect images from container image registries, get images and image layers, and use signatures to create and verify images.

+ Buildah: The buildah command can be used in place of docker build to build container images from Dockerfiles and, ultimately, files in other formats.
As much as possible, Podman and its related utilities, Buildah and Skopeo, are designed to work independently of each other. For example, Buildah has no dependency on Podman, which means it is possible to separate the container build infrastructure from environments in which the containers are intended to run. You can install the buildah package on the same system that you run Podman; or, you can install the package on an alternate system, if required. Similarly, you can install Skopeo separate from the other utilities, according to your specific requirements.

The following sections describe Docker and Podman comparison, Podman, runc, skopeo, and buildah.

## Why we from Docker move to Podman: Docker and Podman comparison
### Docker
Docker is a containerization stage where we can bundle our application with its libraries and conditions inside that container. Docker Container is a to some degree like a virtual machine.
Unlike virtual machines where hardware is virtualized, In Docker, the containers running share the host OS kernel.

![](https://miro.medium.com/max/700/1*dFVO22fAXH8qxmPRRIJYxw.png)

#### Docker Flow
![](https://miro.medium.com/max/700/1*OPQDWqLLXCUZSfq8oiCaug.png)
Two main blocks of docker are : Docker Daemon and Docker CLI.
+ Docker Daemon: A constant background process that helps to manage/create Docker images, containers, networks, and storage volumes.
+ Docker Engine REST API: An API used by applications to interact with the Docker daemon; it can be accessed by an HTTP client.
+ Docker CLI: A Docker command line client for interacting with the Docker daemon. a.k.a the Docker command.

If we think differently we could just connect some problems with Docker:

+ As we all know Docker runs on a single process it could result into single point of failure.
+ All the child processes are owned by this process.
+ At any point if Docker daemon fails, all the child process losses their track and enters into orphaned state.
+ Security vulnerabilities.
+ All the steps needs to be performed by root for Docker operations.

Now we know how Docker works, let’s come to the main topic about Podman
And how we can overcome on most of the problems associated with containers.
So, you must be wondering “What is Podman?”

### Podman
Podman is a daemon-less container engine for developing, managing, and running OCI Containers on your Linux System. Containers can either be run as root or in rootless mode.
![](https://miro.medium.com/max/700/1*EN7d_9nCJEfp_mP7erY_7w.png)
+ Podman directly interacts with Image registry, containers and image storage.
+ As we know Docker is built on top of runC runtime container and uses daemon, Instead of using daemon in Podman, it is directly using runC runtime container.

There are a few things to unpack about podman

+ No need to start or manage a daemon process like the Docker daemon.

The commands which works with Docker works the same for Podman.
```bash
alias docker=podman
```

+ There is Compatibility between Podman and Docker images.

## Podman
Podman provides a lightweight utility to run and manage Open Container Initiative (OCI) compatible containers. As such, a Podman deployment can re-use existing container images that are designed for Kubernetes.
Podman integrates with Docker Hub and Oracle Container Registry to share applications in a software-as-a-service (SaaS) cloud.
Using podman to work with containers. The podman command lets you run containers as standalone entities, without requiring that Kubernetes, the Docker runtime, or any other container runtime be involved. It is a tool that can act as a replacement for the docker command, implementing the same command-line syntax, while it adds even more container management features. The podman features include:

+ Based on docker interface: Because podman syntax mirrors the docker command, transitioning to podman should be easy for those familiar with docker.
+ Managing containers and images: Both Docker- and OCI-compatible container images can be used with podman to:
+ Run, stop and restart containers
+ Create and manage container images (push, commit, configure, build, and so on)
+ Working with no runtime: No runtime environment is used by podman to work with containers.

Podman uses the CRI-O back-end store directory, /var/lib/containers, instead of using the Docker storage location (/var/lib/docker), by default.

### Installing podman

Installing Podman Official Guide in [here](https://podman.io/getting-started/installation).

I am using Manjaro Linux. So, I am using **pacman** install podman.

```bash
sudo pacman -S podman
```

If you have problems when running Podman in [rootless](https://github.com/containers/podman/blob/master/README.md#rootless) mode follow the instructions [here](https://wiki.archlinux.org/index.php/Podman).

### Verifying Podman
Use the podman info command to display information about the configuration and version of Podman.

```bash
podman info
```

### Running containers with podman
If you are used to using the docker command to work with containers, you will find most of the features and options match those of podman.

Because the use of podman mirrors the features and syntax of the docker command, you can refer to Working with Docker Formatted Container Images for examples of how to use those options to work with containers. Simply replace docker with podman in most cases. Here are some examples of using podman.

#### Pull a container image to the local system
```console
[yanboyang713@boyang ~]$ podman pull docker.io/archlinux
Trying to pull docker.io/library/archlinux:latest...
Getting image source signatures
Copying blob 503b62125c98 done  
Copying blob cc7ff1c0e722 done  
Copying config c689d2874b done  
Writing manifest to image destination
Storing signatures
c689d2874bf23af60a962f3f4d1ea7532f7c30992839277415e4e49042f9ba7f
```

#### List local container images
```console
[yanboyang713@boyang ~]$ podman images
REPOSITORY                   TAG     IMAGE ID      CREATED      SIZE
docker.io/library/archlinux  latest  c689d2874bf2  10 days ago  416 MB
```

#### Run a container image: This runs a container image and opens a shell inside the container
```console
[yanboyang713@boyang ~]$ podman run -it archlinux /bin/bash
[root@760265e5bb5e /]# pwd
/
```

#### List containers that are running or have exited
```console
[yanboyang713@boyang ~]$ podman ps -a
CONTAINER ID  IMAGE      COMMAND    CREATED             STATUS                     PORTS   NAMES
760265e5bb5e  archlinux  /bin/bash  About a minute ago  Exited (0) 41 seconds ago          gracious_tharp
```

#### Remove a container or image: remove a container by its container ID
```console
[yanboyang713@boyang ~]$ podman rm 760265e5bb5e
760265e5bb5e259af2a344c762fd66ca280430719e6a8134738dabbab883540e
```

#### Remove a container image by its image ID or name (use -f to force)

```bash
## podman rmi registry.access.redhat.com/rhel7/rhel-minimal
## podman rmi de9c26f23799
## podman rmi -f registry.access.redhat.com/rhel7/rhel:latest
```

#### Build a container

##### Create Dockerfile
```console
[yanboyang713@boyang ~]$ echo -e "FROM docker.io/ubuntu\nENTRYPOINT echo \"Podman build this container.\"" | tee ./Dockerfile
FROM docker.io/ubuntu
ENTRYPOINT echo "Podman build this container."
```

##### Build Image
```console
[yanboyang713@boyang ~]$ podman build -t podbuilt .
STEP 1: FROM docker.io/ubuntu
STEP 2: ENTRYPOINT echo "Podman build this container."
STEP 3: COMMIT podbuilt
--> a8f66c6fb63
a8f66c6fb6385f1417c616b098fbda24c7a76e1b70de43c90103d5e28b6b0cd3
```

##### Run
```console
[yanboyang713@boyang ~]$ podman run podbuilt
Podman build this container.
```

## Buildah
Buildah is a utility for creating Open Container Intiative (OCI) compatible container images. Buildah provides a wider range of customization options than the more generic podman build command.

If you create container images by using Buildah, you do not need a running daemon for the utility to function. Buildah also does not cache builds by default. In addition, the utility can push container images to container registries, so it is well-suited for use with deployment scripts and automated build pipelines.

+ create a working container, either from scratch or using an image as a starting point
+ create an image, either from a working container or via the instructions in a Dockerfile
+ images can be built in either the OCI image format or the traditional upstream docker image format
+ mount a working container's root filesystem for manipulation
+ unmount a working container's root filesystem
+ use the updated contents of a container's root filesystem as a filesystem layer to create a new image
+ delete a working container or an image
+ rename a local container

### Installing
I am using Manjaro Linux. So, I am using **pacman** install buildah and fuse-overlayfs.

```bash
yay -S buildah fuse-overlayfs
```

**NOTE:** If you want to run as non-root user, also install fuse-overlayfs for better performance and storage space efficiency.

### Verifying Buildah
Check the current version of Buildah by specifying the --version flag.

```bash
buildah --version
```

## Skopeo
Skopeo is a utility for managing container images on remote container registries. This utility is particularly useful for inspecting the contents of a container image without needing to first download it.

If you host container images in your own container registry, you can use Skopeo to seamlessly move container images from one location to another. In particular, Skopeo is useful for bulk-deleting unneeded container images.

With the skopeo command, you can work with container images from registries without using the docker daemon or the docker command. Registries can include the Docker Registry, your own local registries, or Atomic registries. Activities you can do with skopeo include:

+ inspect: The output of a skopeo inspect command is similar to what you see from a docker inspect command: low-level information about the container image. That output can be in json format (default) or raw format (using the –raw option).

+ copy: With skopeo copy you can copy a container image from a registry to another registry or to a local directory.

+ layers: The skopeo layers command lets you download the layers associated with images so that they are stored as tarballs and associated manifest files in a local directory.

Like the buildah command and other tools that rely on the containers/image library, the skopeo command can work with images from container storage areas other than those associated with Docker. Available transports to other types of container storage include: containers-storage (for images stored by buildah and CRI-O), ostree (for atomic and system containers), oci (for content stored in an OCI-compliant directory), and others. See the skopeo man page for details.

### Installing Skopeo

Installing Skopeo Official Guide in [here](https://github.com/containers/skopeo/blob/master/install.md).

I am using Manjaro Linux. So, I am using **pacman** install podman.

```bash
sudo pacman -S skopeo
```

### Verifying Skopeo
Use the skopeo -h command for version information and a command reference.

```bash
skopeo -h
```

### Inspects
+ Show properties of archlinux

```bash
skopeo inspect docker://docker.io/library/archlinux
```

+ Show container configuration from archlinux
```bash
skopeo inspect --config docker://docker.io/library/archlinux | jq
```

**NOTE:**
If show ***bash\: jq\: command not found***, please install jq run:
```bash
yay -S jq
```

### Copying images
skopeo can copy container images between various storage mechanisms, including:

+ Container registries
The Quay, Docker Hub, OpenShift, GCR, Artifactory ...
+ Container Storage backends
github.com/containers/storage (Backend for Podman, CRI-O, Buildah and friends)
+ Docker daemon storage
+ Local directories
+ Local OCI-layout directories

#### Copy from one Docker registry to another
Use the skopeo copy command to copy an image between registries without needing to download it locally.

```bash
skopeo copy docker://docker.io/library/oraclelinux:8-slim \
   docker://example.com/os/oraclelinux:8-slim
```
**NOTE:** If the destination registry requires a signature, provide the required key-id by using the --sign-by parameter.

#### Copy from one Docker Registry to local Podman container storage
You can also copy an image to your local Podman container storage by using the containers-storage: prefix

```bash
skopeo copy docker://docker.io/library/oraclelinux:8-slim \
   containers-storage:oraclelinux:8-slim
```

#### Copy a Docker Registry to local directory
To download an image and review its internal content offline you can specify a directory with the dir: prefix. For example, to extract to the oraclelinux folder in your home directory

```bash
skopeo copy docker://docker.io/library/oraclelinux:8-slim \
   dir:/home/$USER/oraclelinux
```
In that example, the oraclelinux folder contains a manifest.json file and multiple tarballs representing the image that has been copied.

### Delete an image
Delete an image from container storage with Skopeo. Use the skopeo delete command to delete an image from a remote registry or your local container storage.
```bash
skopeo delete containers-storage:oraclelinux:8-slim
```



