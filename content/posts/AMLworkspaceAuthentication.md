---
title: "Azure Machine Learning Workspace Authentication Troubleshooting Guide"
date: 2020-09-05T06:11:32+10:00
tags: [ "Azure", "Machine Learning" ]
categories: [ "Azure" ]
---
Could you try using config.json file connect to your Azure ML Workspace first? The steps you can following at the below.

1. Go to https://portal.azure.com/
2. Download config.json
3. [config.json](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1601020176/AML%20Authentication/config_c4idqa.png)
3. Story config.json to the same directory as your Python code.
4. run python code at the below
```python
from azureml.core import Workspace
ws = Workspace.from_config()
print("Found workspace {} at location {}".format(ws.name, ws.location))
```
 
If using config.json file connect to your Azure ML Workspace does not work, please check your SDK version and update your SDK.

Check SDK version python code:
```python
import azureml.core

print(azureml.core.VERSION)
```
Update SDK version - Upgrade a previous version, make sure you upgrade all the dependencies as well:
```bash
pip install --upgrade --upgrade-strategy eager azureml-sdk
```
If Interactive Authentication does not work, please using Azure CLI Authentication or Service Principal Authentication. Details at the below.

https://notebooks.azure.com/azureml/projects/azureml-getting-started/html/how-to-use-azureml/manage-azureml-service/authentication-in-azureml/authentication-in-azure-ml.ipynb
