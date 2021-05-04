---
title: "Getting started with Python using Conda"
date: 2020-09-08T06:11:32+10:00
tags: [ "Machine Learning", "Conda", "Python" ]
categories: [ "virtual environment" ]
---
## Introduction
This post document is about using Conda to management Python and R language packages (libraries/dependencies), as well as virtual environment. Conda is an open source package management system and environment management system. Conda can quickly installs, runs and updates packages and their dependencies. Conda easily creates, saves, loads and switches between environments on your local computer. It was created for Python programs, but it can package and distribute software for any language. Conda as a package manager helps you find and install packages. If you need a package that requires a different version of Python, you do not need to switch to a different environment manager, because conda is also an environment manager. With just a few commands, you can set up a totally separate environment to run that different version of Python, while continuing to run your usual version of Python in your normal environment.

Anaconda is a distribution of conda. It is a data science platform that comes with a lot of packages.Unlike Anaconda, Miniconda doesn’t come with any installed packages by default. For this tutorial, I am using miniconda. If you have Anaconda, the commands will be the same! This also applies across operating systems (Except for the activation of environment).

This document is base on [geohackweek's introduction to conda](https://geohackweek.github.io/Introductory/01-conda-tutorial/). At the end, there are two example for Python and R language.


## Conda
### Installation
Installation details, please have a look the [Official Installation guide](https://conda.io/projects/conda/en/latest/user-guide/install/linux.html)

There are brief steps at the below.
```bash
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
```
### Managing Conda
Let’s first start by checking if conda is installed.

```bash
conda --version
```

Once it has been confirmed that conda has been installed, we will now make sure that it is up to date.

```bash
conda update conda
```
Conda will compare versions and let you know what is available to install. It will also tell you about other packages that will be automatically updated or changed with the update. If there are newer version available, follow the instruction to install the newest version of conda.

**TIPS:**
To see the full documentation for any command, type the command followed by --help. For example, to learn about the conda update command:
```bash
conda update --help
```

### Managing Environments
Using conda, you can create an isolated environment for your project. An environment is a set of packages that can be used in one or multiple projects. The default environment is the root environment, which contains default packages listed here.

There are two ways of creating a conda environment.
1. An environment file in YAML format (such as environment.yml).
2. Manual specifications of packages.

#### Creating environment with an environment file
YAML stands for YAML Ain’t Markup Language. It is a human friendly data serialization standard for all programming languages.
This is an example of an environment file that will install python 3.6, python-pip, and pyjokes library using pip. Conda is friendly with pip, so if some packages are not found in Anaconda Cloud, then you can install them with pip install. Open up your favorite text editor, copy and paste the code below, save your file as environment.yml.

```
name: playenv
channels:
- conda-forge
dependencies:
- python=3.6
- pip
- pip:
    - pyjokes
```
Now, let’s install environment.yml environment file above so that we can create a conda environment called playenv.

```bash
conda env create --file environment.yml
```

**TIPS:**
There is instruction for how to activate and deactivate environment. This command is slighty different between operating systems.
1. Use an environment:
	1. Linux, OS X:
		```bash
		source activate playenv
		```
	2. Windows:
		```bash
		activate playenv
		```
2. Deactivate an environment (goes back to root):
	1. Linux, OS X:
		```bash
		source deactivate
		```
	2. Windows:
		```bash
		deactivate
		```
#### Creating environment by manually specifying packages
We can create test_env conda environment by specifying the name, channel, and list of packages within the terminal window. In the example below, I am creating the test_env environment that uses python 2.7 and a list of libraries: numpy, matplotlib, pandas.

```bash
conda create -c conda-forge -n test_env python=2.7 numpy matplotlib pandas
```
Conda will solve any dependencies between the packages like before and create a new environment with those packages.

#### Verifying current environment
To know the current environment that you’re in you can either look at your terminal:
```bash
(test_env) D-69-91-135-15:env_files lsetiawan$
```
The (test_env) in the beginning of the line indicates that I’m curently using the test_env conda environment.

Another way that you can check for your current active environment is a command:
```console
foo@bar:~$ conda env list
test_env              *  //anaconda/envs/test_env
playenv                  //anaconda/envs/playenv
root                     //anaconda
```

The current environment is indicated by (\*) character. This is also a great way to see the list of environments that have been created. In the list, the path to each environment is also shown.

#### Sharing Environments with others
To share an environment, you can export your conda environment to an environment file. By doing this, the resulting environment file is very detailed with specific version listing.

Exporting your environment to a file called myenv.yml:

```bash
conda env export -f test_env.yml -n test_env
```
This will export a very detailed environment file that you can share with others. This file specifies the package=version=build. Note that this environment file will not work to share across platforms, since the builds and versions might be different for different operating systems.

##### Best practice to share environments
1. When starting a new environment, always generate it from an environment file rather than the command line.
2. As you add packages to the environment, be sure to update the environment file.
3. Unless you have to, try to avoid specifying the version of each package. This will ensure you have the most up to date version that will work across platform.

If you follow these guidelines, you should be able to give your environment file to anyone, and they will be able to install your packages with no problem.

##### Making an exact copy of an environment and deleting environments
###### Copying an environment
We can make an exact copy of an environment to an environment with a different name. This maybe useful for any testing versus live environments or python 2.7 vs python 3.6 for the same packages. In this example, test_env is cloned to create live_env.
```bash
conda create --name live_env --clone test_env
```
###### Deleting an environment
Deleting an environment is very easy using conda. Since we are only testing out our environment, we will delete live_env to remove some clutter. Make sure that you are not currently using live_env.

```bash
conda env remove -n live_env
```

### Managing Packages
#### Seeing what packages are available
We will now check packages that are available to us. The command below will list all the packages in an environment, in this case test_env. The list will include versions of each package, the specific build, and the channel that the package was downloaded from. conda list is also useful to ensure that you have installed the packages that you desire.

```console
foo@bar:~$ conda list -n test_env
## packages in environment at //anaconda/envs/test_env:
##
Using Anaconda Cloud api site https://api.anaconda.org
blas                      1.1                    openblas    conda-forge
ca-certificates           2016.9.26                     0    conda-forge
certifi                   2016.9.26                py27_0    conda-forge
cycler                    0.10.0                   py27_0    conda-forge
freetype                  2.6.3                         1    conda-forge
functools32               3.2.3.2                  py27_1    conda-forge
libgfortran               3.0.0                         0    conda-forge
...
```
#### Searching for a certain package
Some packages might not be available in conda, but are available in pypi. For example, we will search for rasterio within the anaconda cloud. It is not necessary to create an account with anaconda cloud, unless you’d like to contribute in the future when you are pro with conda.
![anaconda cloud](https://geohackweek.github.io/Introductory/fig/Anaconda_cloud_rasterio_listing.png)

##### Anaconda Cloud and Trusted Sources
Anaconda Cloud is a package management service that makes it easy to find, access, store and share public and private notebooks, environments, and conda and PyPI packages, and to keep up with updates made to the packages and environments you’re using (Ref. Anaconda Cloud Doc). Anaconda Cloud is made up of channels/owners. Each channels contains one or more conda packages.

It is important to be careful when downloading any packages from an untrusted source. Conda forge is a reliable source for many popular python packages. It is wise to research about the source of a conda package.

In this example, we will use rasterio from conda-forge. The anaconda cloud page for rasterio will show how to install the package, compatible OS, individual files for that package, etc.
![conda-forge](https://geohackweek.github.io/Introductory/fig/Anaconda_cloud_rasterio_page.png)

If you are using anaconda, you can do this search within the command line:
```console
foo@bar:~$ anaconda search rasterio
Using Anaconda Cloud api site https://api.anaconda.org
Run 'anaconda show <USER/PACKAGE>' to get more details:
Packages:
     Name                      |  Version | Package Types   | Platforms      
     ------------------------- |   ------ | --------------- | ---------------
     IOOS/rasterio             |    1.0a2 | conda           | linux-64, win-32, win-64, osx-64
     Terradue/rasterio         |   0.32.0 | conda           | linux-64       
                                          : Fast and direct raster I/O for use with Numpy and SciPy
     anaconda/rasterio         |   0.36.0 | conda           | linux-64, win-32, win-64, linux-32, osx-64
     conda-forge/rasterio      |    1.0a2 | conda           | linux-64, win-32, win-64, osx-64
                                          : Rasterio reads and writes geospatial raster datasets
     dharhas/rasterio          |   0.23.0 | conda           | win-64         
                                          : Rasterio reads and writes geospatial raster datasets.
     erdc/rasterio             |   0.23.0 | conda           | win-64         
                                          : Rasterio reads and writes geospatial raster datasets.
     jesserobertson/rasterio   |   0.23.0 | conda           | linux-64, linux-32, osx-64
     jhamman/rasterio_to_xarray | 2016.03.16-1558 | ipynb           |                
                                          : IPython notebook
     krisvanneste/rasterio     |   0.26.0 | conda           | win-64         
     ocefpaf/rasterio          |   0.19.1 | conda           | linux-64, osx-64
     omgarcia/rasterio         |   0.25.0 | conda           | linux-64       
     pypi/rasterio             |   0.13.2 | pypi            |                
                                          : Fast and direct raster I/O for Python programmers who use Numpy
     robintw/rasterio          |   0.35.1 | conda           | osx-64         
                                          : Rasterio reads and writes geospatial raster datasets
     sgillies/rasterio         |     0.15 | conda           | osx-64         
     ztessler/rasterio         |   0.31.0 | conda           | osx-64         
                                          : Fast and direct raster I/O for use with Numpy and SciPy
Found 15 packages
```

#### Installing conda package
Under the name column of the result in the terminal or the package column in the Anaconda Cloud listing, shows the necessary information to install the package. Ex. conda-forge/rasterio. The first word list the channel that this package is from and the second part shows the name of the package.

To install the latest version available within the channel, do not specify in the install command. We will install version 0.35 of rasterio from conda-forge into test_env in this example. Conda will also automatically install the dependencies for this package.

```bash
conda install -c conda-forge rasterio=0.35
```

**Pre-configuring Channels**
If you have a few trusted channels that you prefer to use, you can pre-configure these so that everytime you are creating an environment, you won’t need to explicitly declare the channel.
```bash
conda config --add channels conda-forge
```

#### Removing Conda Package
We decided that rasterio is not needed in this tutorial, so we will remove it from test_env. Note that this will only remove the main package rasterio, not its dependencies.

```console
foo@bar:~$ conda remove -n test_env rasterio
Using Anaconda Cloud api site https://api.anaconda.org
Fetching package metadata .........
Solving package specifications: ..........

Package plan for package removal in environment //anaconda/envs/test_env:

The following packages will be REMOVED:

    rasterio: 0.35.1-np111py27_1 conda-forge

Proceed ([y]/n)? y

Unlinking packages ...
[      COMPLETE      ]|#######################################################################################################| 100%

```

## Python
There is a example for using conda install Jupyter Notebooks and set Jupyter environment.
```bash
conda create -n myenv python=3.7.7
conda activate myenv
conda install notebook ipykernel
ipython kernel install --user --name myenv --display-name "Python (myenv)"
pip install azureml-sdk[notebooks,automl]
```

## R

## Conclusion

