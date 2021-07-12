# Getting started Robot Operating System (ROS)

## Installtion
### In Docker
https://hub.docker.com/r/osrf/ros2/

```bash
docker pull osrf/ros2:nightly
docker run -it osrf/ros2:nightly bash
docker-compose run redis /bin/bash
```

### Building from source
1. Install build dependencies (Arch Linux)
```bash
yay -S ros2-arch-deps
```
2. Create a workspace and clone all repos:
```bash
mkdir -p ~/ros2_foxy/src
cd ~/ros2_foxy
wget https://raw.githubusercontent.com/ros2/ros2/foxy/ros2.repos
vcs import src < ros2.repos
```
3. Setting PyQt5
The **qt_gui_cpp** package expects to find modules in **/usr/share/sip** by default. Arch ships the PyQt5 and sip modules in the Python site-packages directory. Make the the following symlinks to build successfully:
```bash
mkdir -p /usr/share/sip
sudo ln -s /usr/lib/python3.9/site-packages/PyQt5 /usr/share/sip/.
sudo ln -s /usr/lib/python3.9/site-packages/PyQt5/bindings/* /usr/share/sip/PyQt5/.
```
4. Now you can build and install ROS 2 to a specific directory by:
```bash
cd ~/ros2_foxy/
sudo mkdir /opt/ros2
sudo chown $USER /opt/ros2
sudo colcon build --merge-install --install-base /opt/ros2/foxy
```
**NOTE:** If you facing **ERROR:colcon:colcon build: Duplicate package names not supported**
```bash
colcon build --cmake-clean-cache # reset python3 env
```
5. Environment setup
ROS 2 relies on the notion of combining workspaces using the shell environment. “Workspace” is a ROS term for the location on your system where you’re developing with ROS 2. The core ROS 2 workspace is called the underlay. Subsequent local workspaces are called overlays. When developing with ROS 2, you will typically have several workspaces active concurrently.

Combining workspaces makes developing against different versions of ROS 2, or against different sets of packages, easier. It also allows the installation of several ROS 2 distributions (or “distros”, e.g. Dashing and Eloquent) on the same computer and switching between them.

This is accomplished by sourcing setup files every time you open a new shell, or by adding the source command to your shell startup script once. Without sourcing the setup files, you won’t be able to access ROS 2 commands, or find or use ROS 2 packages. In other words, you won’t be able to use ROS 2.

```bash
source /opt/ros2/foxy/setup.bash
```

A tip to source workspace is putting this function in your shell startup file, like .bashrc, .zshrc.
```file
ros2_on(){
     export ROS_DOMAIN_ID=42
     export ROS_VERSION=2
     export ROS_PYTHON_VERSION=3
     export ROS_DISTRO=foxy
     source /opt/ros2/foxy/setup.bash
}
```

## Configuring your ROS 2 environment

