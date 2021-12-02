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


### How does Ansible work? {#how-does-ansible-work}


### Features of Ansible {#features-of-ansible}


## Difference between Terraform and Ansible Provisioning {#difference-between-terraform-and-ansible-provisioning}


## Configuration Management vs. Orchestration {#configuration-management-vs-dot-orchestration}


## Procedural vs Declarative {#procedural-vs-declarative}


## Terraform vs Ansible Provisioning {#terraform-vs-ansible-provisioning}


## Which one to choose: Terraform or Ansible? {#which-one-to-choose-terraform-or-ansible}


## Conclusion {#conclusion}


## References {#references}

