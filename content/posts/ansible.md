---
title: "Ansible Beginner's Guide"
date: 2021-12-02T17:58:00+08:00
categories: ["DevOps"]
draft: false
---

## Overview {#overview}

This article covers all the aspects of Ansible, a tool used in DevOps for the Management, Deployment, and Orchestration of IT Infrastructure.


## What Is Ansible? {#what-is-ansible}

Ansible is a simple configuration management and IT automation engine for multi-tier deployments. It automates both cloud and on-premise provisioning & configuration. It automates cloud provisioning. Rather than managing one system at a time, Ansible uses a model that inter-relates the entire IT infrastructure and enables you to manage everything using something called an Infrastructure as Code (IAC) approach. Ansible is secure and agentless. It relies on OpenSSH and the code written in YAML format. Ansible nodes are run on Unix systems but they can be used to configure changes across Unix as well as Windows systems.


## Who should learn Ansible? {#who-should-learn-ansible}

Ansible is a part of the DevOps stack. Ansible means automation. Ansible seamlessly connects workflow orchestration with configuration management and provisioning deployment. Ansible has various use cases in Provisioning, Configuration Management, Application Deployment, Continuous Deployment, Automation, and Orchestration. So, if you are looking forward to a career in DevOps, IT automation, and managing cloud infrastructure then Ansible is a must-have.


## Why Use Ansible? {#why-use-ansible}

-   **No Agent**: As long as the box can be ssh’d into and it has python, it can be configured with Ansible.
-   **Idempotent**: Ansible’s whole architecture is structured around the concept of idempotency. The core idea here is that you only do things if they are needed and that things are repeatable without side effects.
-   **Declarative Not Procedural**: Other configuration tools tend to be procedural do this and then do that and so on. Ansible works by you writing a description of the state of the machine that you want and then it takes steps to fulfill that description.
-   **Tiny Learning Curve**: Ansible is quite easy to learn. It doesn’t require any extra knowledge.


## Ansible Use Cases {#ansible-use-cases}

-   **Provisioning**: Provisioning is creating new infrastructure. Ansible allows for application management, deployment, orchestration, and configuration management.
-   **Continuous Delivery**: Ansible provides a simpler way to automatically deploy applications. All required services for a deployment can be configured from a single system. Continuous Integration (CI) tool can be used to run Ansible playbook which can be used to test and automatically deploy the application to production if tests are passed.
-   **Application Deployment**: Ansible provides a simpler way to deploy applications across the infrastructure. Deployment of multi-tier applications can be simplified and the infrastructure can be easily changed over time.
-   **Ansible for Cloud Computing**: Ansible makes it easy to provision instances across all cloud providers. Ansible contains multiple modules and allows to manage of large cloud infrastructure across the public-private and hybrid cloud.
-   **Ansible for Security and Compliance**: You can define security policies in Ansible which will automate security policy across all machines in the network. Security roles once configured in an Ansible node will be embedded across all machines in the network automatically.


## Ansible Architecture Diagram {#ansible-architecture-diagram}

![](https://miro.medium.com/max/564/1*eaY6sN1T9VJiVOrMQMNdRQ.png)
![](https://miro.medium.com/max/625/0*K9Kqdh4ZLT-fHJeP.png)
![](https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2021/06/Ansible%5FDiagram2-16-1024x461.png)

-   **Modules**: Modules are script-like programs written to specify the desired state of the system. These are typically written in a code editor. Modules are written by the developer and executed via SSH. Modules are part of a larger program called Playbook. Ansible module is a standalone script that can be used inside an Ansible Playbook.
-   **Plugins**: Plugins are pieces of code that enhance the core functionality of Ansible. Plugins execute on the control node.
-   **Inventory**: Ansible reads information about the machines you manage from the inventory. Inventory is listed in the file which contains IP addresses, databases, and servers.
-   **Playbook**: Playbooks are files written in YAML. Playbooks describe the tasks to be done by declaring configurations in order to bring a managed node into the desired state.


## Ansible Playbook {#ansible-playbook}

-   Plain-text YAML files that describe the desired state of something
-   Human and Machine-readable
-   Can be used to build the entire application environment

<https://miro.medium.com/max/463/0*t2iCHi%5FbuMmtKGmw>


## What Are Inventories In Ansible? {#what-are-inventories-in-ansible}

-   Static lines of servers
-   Dynamic list of servers: AWS, Azure, GCP, etc.
-   Ranges
-   Other custom things

    ![](https://miro.medium.com/max/201/1*mLdHcg8SvBvXRDceZIdKeA.png)
    ![](https://miro.medium.com/max/1006/0*E%5FbhUEFXGoQCOV%5FK.jpg)


## Ansible Modules {#ansible-modules}

-   Over 1000 modules provided by Ansible to automate
-   Modules are like plugins that do the actual work in Ansible, they are what gets executed in each playbook task.
-   Each module is mostly standalone and can be written in a standard scripting language (such as Python, Perl, Ruby, Bash, etc.)

{{< figure src="https://miro.medium.com/max/793/1*UDC-1%5FSR4Z26APTYRWDP3w.png" >}}


## Ansible Tower {#ansible-tower}

Ansible Tower is a GUI and REST interface for Ansible that supercharges it by adding RBAC, centralized logging, auto-scaling/provisioning call-backs, graphical inventory editing, and more.

**Capabilities**:

This command-line tool sends commands to the Tower API. It is capable of retrieving, creating, modifying, and deleting most resources within the Tower.

-   A few potential uses include:
-   Launching playbook runs (for instance, from Jenkins, TeamCity, Bamboo, etc.)
-   Checking on job statuses
-   Rapidly creating objects like organizations, users, teams, and more.

<https://www.ansible.com/products/tower>


## Ansible Roles {#ansible-roles}

1.  Roles are a way to group tasks together into one container. We could have a role for setting up MySQL, another one for configuring ip tables.
2.  Roles make it easy to configure hosts. Any role can be performed on any host or group of hosts such as:
    -   hosts: all
    -   roles:
    -   role\_1
    -   role\_2


## Ansible Variables {#ansible-variables}

There are many different ways to source variables:

-   Playbooks
-   Files
-   Inventories (group vars, host vars)
-   Command-line Discovered Variables
-   Ansible Tower


## How To Run The Ansible Commands? {#how-to-run-the-ansible-commands}

**Ad-Hoc**: Ansible <inventory> -m
![](https://miro.medium.com/max/520/1*W8ndyJq6S37tdAPBEHvUbQ.png)
**Playbooks**: Ansible-playbook
![](https://miro.medium.com/max/519/1*SfmrmCzzcKmf4GO7TApVmg.png)


## AD-HOC Commands Examples {#ad-hoc-commands-examples}

**Transferring file to many servers/machines**

```console
$ Ansible Abc -m copy -a "src = /etc/yum.conf dest = /tmp/yum.conf"
```

**Creating a new directory**

```console
$ Ansible ABC -m file -a "dest = /path/user1/new mode = 777 owner = user1 group = user1 state = directory"
```

**Deleting whole directory and files**

```console
$ Ansible ABC -m file -a "dest = /path/user1/new state = absent"
```
