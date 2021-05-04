# Azure Data Science Virtual Machine Getting Started

## Introduction
Azure Data Science Virtual Machine(DSVM) is Azure Virtual Machine image, pre-installed, configured and tested with several popular tools that are data analytics, machine learning and AI training. DSVM will be your best option as your develop environment base on cloud. DSVM helps in flexible virtualization without the need for purchasing and maintenance of hardware. You will see the DSVM highlights at the below section. DSVM almost cover all of popular tools for data science. This post document will fouced on how to create DSVM step by step. Others post will introduce DSVM integrate tool one by one.
![Overview DSVM Environment](https://azurecomcdn.azureedge.net/cvt-0b40b1bff318268e721d52838dc296062380fe208d10d95a79603c3d7b06e390/images/page/services/virtual-machines/data-science-virtual-machines/data-science-diagram.jpg)

## DSVM compare with Azure Machine Learning Compute Instances(AML-CI)
I personal recommend you using DSVM instead of AML-CI.
A couple of reason list at the below.
1. DSVM is fully managed by yourself. You have all the permissions, so you can do whatever you want.
2. DSVM have Windows OS and Ubuntu OS avaliable, AML-CI only have Ubuntu avaliable. But, I tend to use Ubuntu.
3. DSVM have RDP Access feature. AML-CI have NOT this feature.

**Note:**
RDP (Remote Desktop Protocol) is a network communications protocol developed by Microsoft, which allows users to remotely connect to another computer. It is an extension of the T.120 protocols that are standards of the ITU (International Telecommunications Union). RDP provides a graphical interface for connecting two computers. To use RDP, the computer from which the end user originates the request must be running RDP client software. The computer that is being accessed must be running RDP server software.
RDP client software provided by Microsoft is called Remote Desktop Connection (it used to be called “Terminal Services Client” and you may occasionally see it referred to that way.) Many non-Microsoft RDP clients and servers are available as well, including the open source client rdesktop. rdesktop is a command-line client; there are graphical user interface clients built on top of rdesktop.

The copyright of this Note belong to ericom, original article and more details can be found on [ericom website](https://www.ericom.com/whatis/rdp/)

## DSVM some highlights
1. Anaconda Python
2. Jupyter, JupyterLab, and JupyterHub
3. Deep learning with TensorFlow and PyTorch
4. Machine learning with xgboost, Vowpal Wabbit, and LightGBM
5. Julia
6. Azure SDKs and libraries
7. Azure Machine Learning SDKs and sample notebooks
8. R support
9. Spark

This image is pre-configured with NVIDIA drivers, CUDA Toolkit, and cuDNN library for GPU workloads if using NC class VM SKUs.

## How to create a DSVM
1. You need to do is log into the Azure Management portal through https://portal.azure.com . You should have an active Azure subscription to use the port. If you don't have a subscription, you can sign up for a free trial account.
2. After logging in, you have to click **Create a resource** at the first position in Azure Services Section.
![Create a resource](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599791501/DSVM/step1_fnow1a.png)
3. In the Marketplace bar, search **Data Science Virtual Machine for Linux (Ubuntu)**
![search](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599791843/DSVM/step2_jcaj5l.png)
4. Click **create**
![create](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599792009/DSVM/step3_jgt3yj.png)
5. Now, we are enter the really steps for create our DSVM. Here, you would find seven distinct tabs on the Top of the screen. They are "Basics", "Disks", "Networking", "Management", "Advanced", "Tags", as well as "Review + create". I will one by one, talk how to set in details.

### "Basics" Tab configuration
![Basics1](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793176/DSVM/basics1_jkurkn.png)
![Basics2](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793176/DSVM/basics2_ejbakz.png)
### "Disks" Tab configuration
![Disks](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793541/DSVM/disks_c6shkk.png)

### "Networking" Tab configuration
![Networking](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793690/DSVM/networking_ov8781.png)
### "Management" Tab configuration
![management1](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793906/DSVM/management1_m5bysi.png)
![management2](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599793906/DSVM/management2_qeq9n2.png)
### "Advanced" Tab configuration
![advanced1](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599794121/DSVM/advanced1_dqxgph.png)
![advanced2](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599794121/DSVM/advanced2_ajxdsy.png)

### "Tags" Tab configuration
![tags](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599794279/DSVM/tags_aipkzh.png)
### "Review + create" Tab configuration
This step will be your last step. This step will vaild all of your configations. If failed, below image will be show.
![Validation Failed](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599794725/DSVM/validationFailed_gqbe3k.png)
![Validation Passed](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1599794999/DSVM/validationPassed_s91clt.png)


