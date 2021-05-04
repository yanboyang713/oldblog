---
title: "Using Azure Container Instances with Azure Machine Learning Service"
date: 2020-01-04T06:11:32+10:00
tags: ["Azure"]
categories: ["Azure"]
---
## Stop and Start ACI for AML endpoint
You can use Azure command-line interface (Azure CLI) to stop and start the Azure Container Instances.

The steps at the below.

Step 1: Go to your portal and click Cloud Shell
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605344921/AzureContainerInstancesStopStart/cloudShell_ownxnt.png)

Step 2: Check the Container Name using the below command. "sklearn-mnist-svc-4dea" is my Endpoint name
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605344921/AzureContainerInstancesStopStart/cloudShell_ownxnt.png)

az container list | grep "sklearn-mnist-svc-4dea"
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605345338/AzureContainerInstancesStopStart/getContainerName_xvduxe.png)

Step 3: Confirm your Container Name for your Endpoint using the below command.

az container show --name sklearn-mnist-svc-4dea-Gk77a6id90eK5nXsPRkyEA --resource-group permanent
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605345518/AzureContainerInstancesStopStart/confirmContainerName_ayecsz.png)

Step 4: Stop the container, the command at the below.

az container stop --name sklearn-mnist-svc-4dea-Gk77a6id90eK5nXsPRkyEA --resource-group permanent
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605345855/AzureContainerInstancesStopStart/stop_rmqw5l.png)

Step 5: Start the container, the command at the below.

az container start --name sklearn-mnist-svc-4dea-Gk77a6id90eK5nXsPRkyEA --resource-group permanent
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1605345977/AzureContainerInstancesStopStart/start_d6stty.png)

