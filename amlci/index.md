# Azure Machine Learning Compute Instance Getting Started

## Introduction
This post document is a brief introduction about Azure Machine Learning Service Compute Instance(CI).
CI can be as your development environment or training compute tartget.
**TIPS:**
However, if your specialty on Linux, I recommand you using DSVM ({% post_link DSVM %}) as your development environment. For training process, I recommand you using Azure Machine Learning training cluster(Compute cluster).

## Managing a compute instance
### From portal
In your workspace in Azure Machine Learning studio, select Compute, then select Compute Instance on the top.
![compute instance](https://docs.microsoft.com/en-us/azure/machine-learning/media/concept-compute-instance/manage-compute-instance.png)
You can perform the following actions:
+ Create a compute instance.
+ Refresh the compute instances tab.
+ Start, stop, and restart a compute instance. You do pay for the instance whenever it is running. Stop the compute instance when you are not using it to reduce cost. Stopping a compute instance deallocates it. Then start it again when you need it.
+ Delete a compute instance.
+ Filter the list of compute instanced to show only those you have created.

For each compute instance in your workspace that you can use, you can:

+ Access Jupyter, JupyterLab, RStudio on the compute instance
+ SSH into compute instance. SSH access is disabled by default but can be enabled at compute instance creation time. SSH access is through public/private key mechanism. The tab will give you details for SSH connection such as IP address, username, and port number.
+ Get details about a specific compute instance such as IP address, and region.

**TIPS:**
RBAC allows you to control which users in the workspace can create, delete, start, stop, restart a compute instance. All users in the workspace contributor and owner role can create, delete, start, stop, and restart compute instances across the workspace. However, only the creator of a specific compute instance, or the user assigned if it was created on their behalf, is allowed to access Jupyter, JupyterLab, and RStudio on that compute instance. A compute instance is dedicated to a single user who has root access, and can terminal in through Jupyter/JupyterLab/RStudio. Compute instance will have single-user log in and all actions will use that user’s identity for RBAC and attribution of experiment runs. SSH access is controlled through public/private key mechanism.

These actions can be controlled by RBAC:
+ Microsoft.MachineLearningServices/workspaces/computes/read
+ Microsoft.MachineLearningServices/workspaces/computes/write
+ Microsoft.MachineLearningServices/workspaces/computes/delete
+ Microsoft.MachineLearningServices/workspaces/computes/start/action
+ Microsoft.MachineLearningServices/workspaces/computes/stop/action
+ Microsoft.MachineLearningServices/workspaces/computes/restart/action

Details please check official website [Managing CI](https://docs.microsoft.com/en-us/azure/machine-learning/concept-compute-instance#managing-a-compute-instance)

### Using Azure Machine Learning SDK
All of management CI methods can be found in ComputeInstance class. Details please check official link at the below.
<a href="https://docs.microsoft.com/en-us/python/api/azureml-core/azureml.core.compute.computeinstance(class)?view=azure-ml-py" target="_top">Managing CI SDK</a>

#### Delete CI object methods

<a href="https://docs.microsoft.com/en-us/python/api/azureml-core/azureml.core.compute.computeinstance(class)?view=azure-ml-py#delete-wait-for-completion-false--show-output-false-" target="_top">Official link</a>

Remove the ComputeInstance object from its associated workspace.
```python
delete(wait_for_completion=False, show_output=False)
```
##### Parameters
wait_for_completion - default value: False
show_output - default value: False

[Exceptions](https://docs.microsoft.com/en-us/python/api/azureml-core/azureml.exceptions.computetargetexception?view=azure-ml-py)

##### Remarks

If this object was created through Azure ML, the corresponding cloud based objects will also be deleted. If this object was created externally and only attached to the workspace, it will raise exception and nothing will be changed.

### REST API
REST API also can be used to manage CIs, How to delete CIs, please, have a check the link at the below.
[Delete CIs](https://docs.microsoft.com/en-us/rest/api/azureml/workspacesandcomputes/machinelearningcompute/delete)


