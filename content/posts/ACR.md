---
title: "Getting started with Azure Container Registry (ACR)"
date: 2020-02-01T06:11:32+10:00
tags: [ "ACR" ]
categories: [ "Azure" ]
---
## Introduction
Azure Container Registry is a managed, private Docker registry service based on the open-source Docker Registry 2.0. Create and maintain Azure container registries to store and manage your private Docker container images and related artifacts.

Use Azure container registries with your existing container development and deployment pipelines, or use Azure Container Registry Tasks to build container images in Azure. Build on demand, or fully automate builds with triggers such as source code commits and base image updates.

## Why we need using ACR in Machine Learning Workflow
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1604582423/ML-workflow/ML-data-flow_xmspev.png)

There are three machine learning environments (Development environment, Training Environment and Deployment Environment) depend on Docker. So, we have huge of Docker Image need to store and Management.

Those three environments involve in all parts of {% post_link machineLearningWorkflow Machine Learning Workflow %}

## Frequently Asked Questions (FAQ) 
1. If we enabled private endpoint for ACR, this ACR still can access by public Internet or not? 
Yes, there is an option called network access in the portal that will determine how the ACR can be accessed.
If you want to disable the public access then you need to toggle with the options whether you want all networks or selected networks. Also you can completely disable the public access and use private end points.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1609751466/ACR/Mon_Jan_4_05_09_41_PM_CST_2021_g83rlw.png)
As a test I created an ACR with public access and tried to pull image from my laptop and it worked. I enabled a private endpoint and I can still access from my laptop because I did not disable the public access.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1609751550/ACR/Mon_Jan_4_05_11_52_PM_CST_2021_zlkqfb.png)

2. Could we set-up a couple private endpoint in the same ACR? 
Technically yes we can do that. Please see below and I did that in my lab.
Created an ACR and created multiple end points.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1609751627/ACR/Mon_Jan_4_05_13_19_PM_CST_2021_bpocgg.png)

You can also use this command to list all the private endpoints for an ACR
```bash
az acr private-endpoint-connection list \
>   --registry-name cert99.azurecr.io
```
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1609751737/ACR/Mon_Jan_4_05_15_09_PM_CST_2021_qaxuqd.png)

3. When we enabled private endpoint for ACR, are there any DNS FQDN rules need to set-up?

This is done automatically during the private endpoint creation. But based on what you are doing in machine learning you might need to add DNS records.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1609751833/ACR/Mon_Jan_4_05_16_47_PM_CST_2021_vj7nd3.png)

Please go through the document below that covers a lot about DNS records and private DNS zones for ACR.
https://docs.microsoft.com/en-us/azure/container-registry/container-registry-private-link


