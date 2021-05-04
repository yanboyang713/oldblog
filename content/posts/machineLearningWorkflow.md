---
title: "Machine Learning Workflow"
date: 2020-01-04T06:11:32+10:00
tags: [ "Machine Learning", "Azure" ]
categories: [ "Machine Learning" ]
---
## Machine Learning Development Liftcycle Overview
![](https://raw.githubusercontent.com/microsoft/MLOps/master/media/ml-lifecycle.png)

There are two important parts for ML lifecycle (pipeline).
1. **Data-flow** about how to management/store your data and how to transfer your data in your ML lifecycle. Transfer your data highly regarding with Networking, so in this post, I will talk a little bit about Network Topologgy from On-premises network to Azure Network Topology.
2. **Compute Resources/Environments** about how to compute your data on each steps, different steps are running within different environments.

In a typical model development lifecycle, you might:
1. Start by developing and experimenting on a small amount of data. At this stage, use your local environment, such as a local computer or cloud-based virtual machine (VM), as your compute target. [Details please click here](#development/testing-environment)
2. Scale up to larger data, or do distributed training by using one of these training compute targets.
3. After your model is ready, deploy it to a web hosting environment or IoT device with one of these deployment compute targets.

Machine learning workflows define which phases are implemented during a machine learning project. The typical phases include data collection, data pre-processing, building datasets, model training and refinement, evaluation, and deployment to production.

While these steps are generally accepted as a standard, there is also room for change. When creating a machine learning workflow, you first need to define the project, and then find an approach that works. Don’t try to fit the model into a rigid workflow. Rather, build a flexible workflow that allows you to start small and scale up to a production-grade solution. 

## Data store and access base on ML lifecycle
The core of ML lifecycle is data-flow. The below image is show how does data-flow in ML lifecycle.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1604582423/ML-workflow/ML-data-flow_xmspev.png)

### Understanding the Machine Learning data-flow

Machine learning workflows define the steps initiated during a particular machine learning implementation. Machine learning workflows vary by project, but four basic phases are typically included. 

#### Gathering machine learning data as original datasets

Gathering data is one of the most important stages of machine learning workflows. During data collection, you are defining the potential usefulness and accuracy of your project with the quality of the data you collect. 

To collect data, you need to identify your sources and aggregate data from those sources into a single dataset. This could mean streaming data from Internet of Things sensors, downloading open source data sets, or constructing a data lake from assorted files, logs, or media. 

The part of Data Flow is highly regrading about On-premises Network because most of original datasetsneed collect from on-premisses network. If you are no familiar with how to set-up On-premisses network. please have a look Azure IOT Edge and Azure IOT HUB for you can convience collect original. However, I strongly recommend you have a look my blog Network category.

#### Data pre-processing

Once your data is collected, you need to pre-process it. Pre-processing involves cleaning, verifying, and formatting data into a usable dataset. If you are collecting data from a single source, this may be a relatively straightforward process. However, if you are aggregating several sources you need to make sure that data formats match, that data is equally reliable, and remove any potential duplicates. 

#### Building datasets

This phase involves breaking processed data into three datasets—training, validating, and testing:

+ **Training Set:** used to initially train the algorithm and teach it how to process information. This set defines model classifications through parameters. 
+ **Validation Set:** used to estimate the accuracy of the model. This dataset is used to finetune model parameters.
+ **Test Set:** used to assess the accuracy and performance of the models. This set is meant to expose any issues or mistrainings in the model. 

#### Training and refinement

Once you have datasets, you are ready to train your model. This involves feeding your training set to your algorithm so that it can learn appropriate parameters and features used in classification. 

Once training is complete, you can then refine the model using your validation dataset. This may involve modifying or discarding variables and includes a process of tweaking model-specific settings (hyperparameters) until an acceptable accuracy level is reached. 

#### Machine learning evaluation

Finally, after an acceptable set of hyperparameters is found and your model accuracy is optimized you can test your model. Testing uses your test dataset and is meant to verify that your models are using accurate features. Based on the feedback you receive you may return to training the model to improve accuracy, adjust output settings, or deploy the model as needed.


## ML compute resources/environment
### Development/Testing Environment

#### Local (Docker/Docker Compose)

#### DSVM (Azure Cloud)

### Training Resources / Environment
#### Azure Machine Learning Compute Cluster (Training Cluster)

#### Azure Databricks (Spark)

### Deployment Resources / Environment
#### Web Service
##### Azure Kubernetes Services

#### Edge Device
##### NVIDIA Jetson device (can work on Azure IOT edge)

##### Xilinx FPGA (VITIS Platform)

## Network Topology and Security
### Basic Network Concepts

#### NAT Gateway

#### Subnet

#### DNS

#### Firewall (Iptables)

#### Routing Table

### One kind of On-premises network topology (ROS + LEDE + Ubiquiti UniFi)

### Azure Networking
#### Basic Concepts
##### Virtual Network

##### Network Security Groups (NSGs)

##### User Defined Routing (UDRs)

##### DNS
###### Azure private DNS Zone

###### Custom DNS

##### Azure Firewall

##### Azure Virtual Network Peering

##### Private Endpoint

##### ExpressRoute

#### Azure Machine Learning Workspace Networking Topology Case Study

#### Azure Networking Troubleshooting


