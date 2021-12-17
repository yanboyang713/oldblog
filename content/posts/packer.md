---
title: "Creating ProxMox templates with packer"
date: 2021-12-14T12:08:00+08:00
tags: ["packer"]
categories: ["Cluster"]
draft: false
---

## Introduction {#introduction}

With proxmox when can create templates for our VMS so we can have a standard starting point to install our applications on top of, these templates can be useful too so that you can pre-install packages for authentication, security, logging and etc without anyone else needing to think about it.

However, creating and managing these templates can become a challenge with how time-consuming and manual it can be. I want to show you how you can make this process more standardized and automated with the use of [packer](https://www.packer.io/) to allow you to declare your proxmox templates as code.


## What is packer {#what-is-packer}

Packer is a utility that allows you to build virtual machine images so that you can define a golden image as code. Packer can be used to create images for almost all of the big cloud providers such as AWS, GCE, Azure and Digital Ocean, or can be used with locally installed hypervisors such as VMWare, Proxmox and a few others.

To build an image with packer we need to define our image through a template file. The file uses the JSON format and comprises of 3 main sections that are used to define and prepare your image.

-   [Builders](https://www.packer.io/docs/terminology#builders): Components of Packer that are able to create a machine image for a single platform. A builder is invoked as part of a build in order to create the actual resulting images.

-   [Provisioners](https://www.packer.io/docs/terminology#provisioners): Install and configure software within a running machine prior to that machine being turned into a static image. Example provisioners include shell scripts, Chef, Puppet, etc.

-   [Post Processors](https://www.packer.io/docs/terminology#post-processors): Take the result of a builder or another post-processor and process that to create a new artifact. Examples of post-processors are compress and upload to compress and upload artifacts respectively, etc.

By using packer we can define our golden VM image as code so that we can easily build identically configured images on demand so that all your machines are running the same image and can also be easily updated to a new image when needed.


## Packer template {#packer-template}

Now that we have our cloud-init enabled image on Proxmox, we can use Packer to create a template based off of this template.
Ensure to set the scsi\_controller="virtio-scsi-pci" and qemu\_agent=true.

I'd recommend adding the Proxmox variables to a var file.

```bash
packer build --var-file=./proxmox.pkvars.hcl --var "proxox_template_name=test-output-template" --var "proxmox_source_template=ubuntu2004-cloud" base.pkr.hcl
```


## Final {#final}

Now that you've created a template using packer from the base template, you can use Terraform to deploy that VM!


## References {#references}

1.  <https://dev.to/aaronktberry/creating-proxmox-templates-with-packer-1b35>
