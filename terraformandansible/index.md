# The comparison and introduction between Terraform and Ansible


## Overview {#overview}

The Terraform vs. Ansible battle continues to escalate as the DevOps environment focuses more on automation and orchestration. These two tools help in automating configurations and deploying infrastructure. Terraform offers to deploy Infrastructure as a Code, helps in readability and lift and shift deployments. Ansible is a configuration management tool for automating system configuration and management.


## Terraform {#terraform}


### What is Terraform? {#what-is-terraform}

Terraform is an open-source tool for building, changing, and versioning infrastructure securely and effectively. It is an Infrastructure as a Code tool that is very straightforward to use. It helps to develop and scale Cloud services and manage the state of the network. Its primary use is in data centers and software-defined networking environments. It does not install and manage software on existing devices; instead, it creates, modifies, and destroys servers and various other cloud services. Slack, Uber, Starbucks, Twitch, all big brands are using Terraform. We can also integrate Terraform with Microsoft Azure, Heroku, and Google Compute Engine, etc.

Now, we will discuss the working of terraform.


### How does Terraform work? {#how-does-terraform-work}

There are two main working components of terraform.

-   Terraform Core
-   Providers

Terraform is of **declarative nature**. It directly describes the end state of the system without defining the steps to reach there. It works at a high level of abstraction to describe what services and resources should be created and defined.

Terraform core takes two input sources to do its job. The first input source is a **terraform configuration** that is configured by its users. Users define what needs to be provisioned and created. The second input source is a state that holds information about the infrastructure.

So terraform core takes the input and figures out various plans for what steps to follow to get the desired output.

{{< figure src="https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2021/06/TerraformCore%5FDiagram-08-1024x421.png" >}}

The second principal component is providers, such as cloud providers like AWS, GCP, Azure, or other Infrastructure as service platforms. It helps to create infrastructure on different levels. Let’s take an example where users create an AWS infrastructure, deploy Kubernetes on top of it, and then create services inside the cluster of Kubernetes. Terraform has multiple providers for various technologies; users can access resources from these providers through terraform. This is the basic working terminology of terraform that helps to provision and cover the complete application set up from infrastructure to fully developed application.


### Features of Terraform {#features-of-terraform}

As we have discussed the working of Terraform, now we will look at the features of Terraform.

-   Terraform follows a **declarative approach** which makes deployments fast and easy.
-   It is a convenient tool to display the resulting model in a **graphical form**.
-   Terraform also manages **external service providers** such as cloud networks and in-house solutions.
-   It is one of the rare tools to offer **building infrastructure** from scratch, whether public, private or multi-cloud.
-   It helps **manage parallel environments**, making it a good choice for testing, validating bug fixes, and formal acceptance.
-   Modular code helps in achieving **consistency**, **reusability**, and **collaboration**.
-   Terraform can **manage multiple clouds** to increase fault tolerance.


## Ansible {#ansible}


### What is Ansible? {#what-is-ansible}

Ansible is the most significant way to automate and configure apps and IT infrastructure.  Ansible is an **open-source configuration management tool** mainly designed for provisioning and deploying applications using IaaC.

{{< figure src="https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2021/06/Ansible-Official-Logo-Black-299x300.png" >}}

It has its own language to describe system configuration. Ansible is **agentless**, making it manage large deployments across enterprises using Windows Power Shell or SSH to perform its tasks. Ansible is not completely declarative; it is a hybrid of procedural and declarative. It can integrate with Amazon EC2, Docker, and Kubernetes. Companies like Zalando, Revolt, and 9gaga are using Ansible.


### How does Ansible work? {#how-does-ansible-work}

Ansible is agentless and doesn’t run on target nodes. It makes **connections using SSH** or other authentication methods. It installs various **Python modules** on the target using JSON. These modules are simple instructions that run on the target. These modules are executed and removed once their job is done. This strategy ensures that there is no misuse of resources on target. Python is mandatory to be installed on both the controlling and the target nodes.

{{< figure src="https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2021/06/Ansible%5FDiagram-07-1024x564.png" >}}

Ansible **management node** acts as a controlling node that controls the entire execution of the playbook. This node is the place to run the installations. There is an **inventory file** that provides the host list where the modules need to be run. The management node makes SSH connections to execute the modules on the host machine and installs the product. Modules are removed once they are installed in the system. This is the simple working process of Ansible.


### Features of Ansible {#features-of-ansible}

Now we will discuss various features Ansible provides to benefit its users.

-   Ansible is used for **configuration management** and follows a procedural approach.
-   Ansible deals with **infrastructure platforms** such as bare metal, cloud networks, and virtualized devices like hypervisors.
-   Ansible follows **idempotent behavior** that makes it to place node in the same state every time.
-   It uses **Infrastructure as a Code system configuration** across the infrastructure.
-   It offers **rapid and easy deployment** of multi-tier apps with being agentless.
-   If the code is **interrupted**, it allows entering the code again without any conflicts with other invocations.


## Difference between Terraform and Ansible Provisioning {#difference-between-terraform-and-ansible-provisioning}

Let’s see how Terraform vs. Ansible battle differentiates from each other:

| Terraform                                                                                        | Ansible                                                                                                     |
|--------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Terraform is a provisioning tool.                                                                | Ansible is a configuration management tool.                                                                 |
| It follows a declarative Infrastructure as a Code approach.                                      | It follows a procedural approach.                                                                           |
| It is the best fit for orchestrating cloud services and setup cloud infrastructure from scratch. | It is mainly used for configuring servers with the right software and updates already configured resources. |
| Terraform does not support bare metal provisioning by default.                                   | Ansible supports the provisioning of bare metal servers.                                                    |
| It does not provide better support in terms of packaging and templating.                         | It provides full support for packaging and templating.                                                      |
| It highly depends on lifecycle or state management.                                              | It does not have lifecycle management at all.                                                               |


## Configuration Management vs. Orchestration {#configuration-management-vs-dot-orchestration}

Terraform and Ansible have so many similarities and differences at the same time. The difference comes when we look at two significant concepts of DevOps: **Orchestration** and **configuration management**.

**Configuration management** tools solve the issues locally rather than replacing the system entirely. Ansible helps to configure each action and instrument and ensures smooth functioning without any damage or error. In addition, Ansible comes up with hybrid capabilities to perform both orchestration and replace infrastructure.

**Orchestration tools** ensure that an environment is in its desired state continuously. Terraform is explicitly designed to store the state of the domain. Whenever there is any glitch in the system, terraform automatically restores and computes the entire process in the system after reloading. It is the best fit in situations where a constant and invariable state is needed. **Terraform Apply** helps to resolve all anomalies effectively.

Let’s have a look at the **Procedural** and **Declarative** nature of Terraform and Ansible.


## Procedural vs Declarative {#procedural-vs-declarative}

There are two main categories of DevOps tools: **Procedural** vs. **Declarative**. These two categories tell the action of tools.

Terraform follows the **declarative approach**, ensuring that if your defined environment suffers changes, it rectifies those changes. This tool attempts to reach the desired end state described by the sysadmin. Puppet also follows the declarative approach. With terraform, we can describe the desired state and figure out how to move from one state to the next automatically.

Ansible is of hybrid nature. It follows both declarative and **procedural style** configuration.  It performs ad-hoc commands to implement procedural-style configurations. Please read the documentation of Ansible very carefully to get in-depth knowledge of its behavior. It’s important to know whether you need to add or subtract resources to get the desired result or need to indicate the resources required explicitly.


## Terraform vs Ansible Provisioning {#terraform-vs-ansible-provisioning}

{{< figure src="https://eadn-wc03-4064062.nxedge.io/cdn/wp-content/uploads/2021/07/TerraformVsAnsible-400x224.png" >}}

**Terraform** deals with **infrastructure automation**. Its current declarative model lacks some features which arise complexity. Using Terraform, the elements of required environments are separately described, including their relationships. It assesses the model, creates a plan based on dependencies, and gives optimized commands to Infrastructure as a Service. If there is no change in the environment or strategy, repeated runs will do nothing. If there is any update in the plan or environment, it will **synchronize** the cloud infrastructure.

**Ansible** follows a **procedural approach**. Various users create playbooks that are evaluated through top to bottom approach and executed in sequence. **Playbooks** are responsible for the configuration of network devices that contributes towards a procedural approach.  Of course, Ansible provisions the cloud infrastructure as well. But its procedural approach limits it to large infrastructure deployments.


## Which one to choose: Terraform or Ansible? {#which-one-to-choose-terraform-or-ansible}

**Terraform** vs. **Ansible**: Every tool has its unique characteristics and limitations. Let’s check out which one to go with.

**Terraform** comes with good **scheduling capabilities** and is very **user-friendly**. It integrates with docker well, as docker handles the configuration management slightly better than Terraform. But there is no clear evidence of how the target devices are brought to their final state, and sometimes, the final configuration is unnecessary.

**Ansible** comes with better **security** and **ACL functionality**. It is considered a mature tool because it adjusts comfortably with traditional automation frameworks. It offers simple operations and helps to code quickly. But, on the other hand, it is not good at services like logical dependencies, orchestration services, and interconnected applications.

You can now choose between these two, according to the requirement of the situation and the job. For example, if the containerized solution is used to provision software within the cloud, then Terraform is preferable. On the other hand, if you want to gain reasonable control of your devices and find other ways to deploy underlying services, Ansible is more suitable. These tools will provide more comprehensive solutions in the future.


## Conclusion {#conclusion}


## References {#references}

