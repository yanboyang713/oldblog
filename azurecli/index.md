# Getting Started with Azure CLI

## Run Azure CLI in a Docker container
You can use Docker to run a standalone Linux container with the Azure CLI pre-installed. Docker gets you started quickly with an isolated environment to run the CLI in. The image can also be used as a base for your own deployments.

### Run in a Docker container

#### Install
Install the CLI using **docker run**.

```bash
docker run -it mcr.microsoft.com/azure-cli
```

**NOTE:**
1. MCR means Microsoft Container Registry, this is a public acaliable Container Registry.
2. If you want to pick up the SSH keys from your user environment, use **-v ${HOME}/.ssh:/root/.ssh** to mount your SSH keys in the environment.

For example:
```bash
docker run -it -v ${HOME}/.ssh:/root/.ssh mcr.microsoft.com/azure-cli
```

#### Login
The CLI is installed on the image as the **az** command in **/usr/local/bin**. To sign in, run the **az login** command.
1. Run the **login** command.
```bash
az login
```

If the CLI can open your default browser, it will do so and load an Azure sign-in page.

Otherwise, open a browser page at https://aka.ms/devicelogin and enter the authorization code displayed in your terminal.

If no web browser is available or the web browser fails to open, use device code flow with az login --use-device-code.

2. Sign in with your account credentials in the browser.

To learn more about different authentication methods, see [Sign in with the Azure CLI](https://docs.microsoft.com/en-us/cli/azure/authenticate-azure-cli).

## Update Docker image
Updating with Docker requires both pulling the new image and re-creating any existing containers. For this reason, you should try to avoid using a container that hosts the CLI as a data store.

Update your local image with docker pull.

```bash
docker pull mcr.microsoft.com/azure-cli
```


## Uninstall Docker image
If you decide to uninstall the Azure CLI, we're sorry to see you go. Before you uninstall, use the az feedback command to let us know what could be improved or fixed. Our goal is to make the Azure CLI bug-free and user-friendly. If you found a bug, we'd appreciate it if you file a GitHub issue.

After halting any containers running the CLI image, remove it.
```bash
docker rmi mcr.microsoft.com/azure-cli
```



