---
title: "Azure Machine Learning"
date: 2021-01-04T06:11:32+10:00
tags: [ "AML" ]
categories: [ "Azure" ]
---
## Create a new Azure Machine Learning
I recommand you create a new AML workspace use an Azure Resource Manager Template from Azure CLI.
The Azure Resource Manager template can be found in the [201-machine-learning-advanced](https://github.com/Azure/azure-quickstart-templates/blob/master/201-machine-learning-advanced/azuredeploy.json) in GitHub repository.

This template creates the following Azure services, all those various services are required by the Azure Machine Learning workspace:

+ Azure Storage Account
+ Azure Key Vault
+ Azure Application Insights
+ Azure Container Registry
+ Azure Machine Learning workspace

Firstly, we need create a resource group, there is a example at the below. The resource group is the container that holds the services. 

+ Create a new resource group, name: aml and location: eastus
```bash
az group create -l eastus -n aml
```

**NOTE:** 
List all of Azure location command at the below.
```bash
az account list-locations
```

I suggest you deploy all dependent resources behind a virtual network.
```bash
az deployment group create \
    --name "boyyan-ml" \
    --resource-group "aml" \
    --template-uri "https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/201-machine-learning-advanced/azuredeploy.json" \
    --parameters workspaceName="boyyanworkspace" \
      location="eastus" \
      vnetOption="new" \
      vnetName="mlvnet" \
      storageAccountBehindVNet="true" \
      keyVaultBehindVNet="true" \
      containerRegistryBehindVNet="true" \
      containerRegistryOption="new" \
      containerRegistrySku="Premium" \
      privateEndpointType="AutoApproval"
```

**NOTE:**
Total transitive private endpoint usage 0 is equal or greater than quota 0. Please increase quotaby following the doc here(https://docs.microsoft.com/azure/machine-learning/how-to-manage-quotas#private-endpoint-and-private-dns-quota-increases).
