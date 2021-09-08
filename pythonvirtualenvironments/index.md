# Introduction to Python Virtual Environments and Dependency Managers


## Introduction
Virtual environments. What are they and what are they used for? This article will be a beginner’s guide to virtual environments and dependency managers in Python. We will also look at five of the most used dependency managers in Python.

A virtual environment is an isolated Python environment where a project’s dependencies are installed in a different directory from those installed in the system’s default Python path and other virtual environments.

Dependency managers are tools that enable easy management of a project’s dependencies.

## Overview
This article will look at the following most used virtual environments and dependency managers in Python, how to use them and their pros and cons.

1. Venv
2. Virtualenv
3. Pipenv
4. Conda
5. Poetry

## Venv
Venv is a Python’s module that is used to create light weight virtual environments. It is the default virtual environment module for Python 3. It is one of the easiest modules around for creating virtual environments.

### Features
+ Python 3’s default virtual environment tool.
+ It is a light weight module.
+ Stores all dependencies in a Scripts folder or bin sub-folder (on linux).

### Installation
Since Venv comes pre-installed in Python 3 or newer, there’s no need to install it.

So, we will go ahead and create a virtual environment.

### Creating a virtual environment
```bash
mkdir pythonTestEnvironment
python -m venv ./pythonTestEnvironment/
```

```console
[yanboyang713@Boyang-PC ~]$ cd pythonTestEnvironment/
[yanboyang713@Boyang-PC pythonTestEnvironment]$ ls -la
total 24
drwxr-xr-x  5 yanboyang713 yanboyang713 4096 Sep  8 15:15 .
drwx------ 52 yanboyang713 yanboyang713 4096 Sep  8 15:12 ..
drwxr-xr-x  2 yanboyang713 yanboyang713 4096 Sep  8 15:15 bin
drwxr-xr-x  2 yanboyang713 yanboyang713 4096 Sep  8 15:15 include
drwxr-xr-x  3 yanboyang713 yanboyang713 4096 Sep  8 15:15 lib
lrwxrwxrwx  1 yanboyang713 yanboyang713    3 Sep  8 15:15 lib64 -> lib
-rw-r--r--  1 yanboyang713 yanboyang713   69 Sep  8 15:15 pyvenv.cfg
```

### Activating the virtual environment
Before using the virtual environment, we need to activate it. This makes the current virtual environment you’re working on to temporarily function as the default Python interpreter.

**NOTE:**
Before activating your virtual environment, always make sure that you are working from your project’s directory.

Once a virtual environment has been created, it can be “activated” using a script in the virtual environment’s binary directory. The invocation of the script is platform-specific (<venv> must be replaced by the path of the directory containing the virtual environment):

| Platform | Shell           | Command to activate virtual environment |
| POSIX    | bash/zsh        | $ source <venv>/bin/activate            |
|          | fish            | $ source <venv>/bin/activate.fish       |
|          | csh/tcsh        | $ source <venv>/bin/activate.csh        |
|          | PowerShell Core | $ <venv>/bin/Activate.ps1               |
| Windows  | cmd.exe         | C:\> <venv>\Scripts\activate.bat        |
|          | PowerShell      | PS C:\> <venv>\Scripts\Activate.ps1     |

When a virtual environment is active, the VIRTUAL_ENV environment variable is set to the path of the virtual environment. This can be used to check if one is running inside a virtual environment.

For example:
```console
[yanboyang713@Boyang-PC pythonTestEnvironment]$ cd bin
[yanboyang713@Boyang-PC bin]$ ls -la
total 44
drwxr-xr-x 2 yanboyang713 yanboyang713 4096 Sep  8 15:15 .
drwxr-xr-x 5 yanboyang713 yanboyang713 4096 Sep  8 15:15 ..
-rw-r--r-- 1 yanboyang713 yanboyang713 1932 Sep  8 15:15 activate
-rw-r--r-- 1 yanboyang713 yanboyang713  881 Sep  8 15:15 activate.csh
-rw-r--r-- 1 yanboyang713 yanboyang713 2021 Sep  8 15:15 activate.fish
-rw-r--r-- 1 yanboyang713 yanboyang713 8834 Sep  8 15:15 Activate.ps1
-rwxr-xr-x 1 yanboyang713 yanboyang713  256 Sep  8 15:15 pip
-rwxr-xr-x 1 yanboyang713 yanboyang713  256 Sep  8 15:15 pip3
-rwxr-xr-x 1 yanboyang713 yanboyang713  256 Sep  8 15:15 pip3.9
lrwxrwxrwx 1 yanboyang713 yanboyang713   15 Sep  8 15:15 python -> /usr/bin/python
lrwxrwxrwx 1 yanboyang713 yanboyang713    6 Sep  8 15:15 python3 -> python
lrwxrwxrwx 1 yanboyang713 yanboyang713    6 Sep  8 15:15 python3.9 -> python
[yanboyang713@Boyang-PC bin]$ source activate
(pythonTestEnvironment) [yanboyang713@Boyang-PC bin]$ 
```

### Configuring the virtual environment
After activating the virtual environment, you can now start installing modules and packages by using the great pip install command.

For example:
```console
(pythonTestEnvironment) [yanboyang713@Boyang-PC bin]$ cd ..
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ pwd
/home/yanboyang713/pythonTestEnvironment
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ pip install Django
Collecting Django
  Downloading Django-3.2.7-py3-none-any.whl (7.9 MB)
     |████████████████████████████████| 7.9 MB 12.2 MB/s 
Collecting asgiref<4,>=3.3.2
  Downloading asgiref-3.4.1-py3-none-any.whl (25 kB)
Collecting sqlparse>=0.2.2
  Downloading sqlparse-0.4.1-py3-none-any.whl (42 kB)
     |████████████████████████████████| 42 kB 488 kB/s 
Collecting pytz
  Downloading pytz-2021.1-py2.py3-none-any.whl (510 kB)
     |████████████████████████████████| 510 kB 882 kB/s 
Installing collected packages: sqlparse, pytz, asgiref, Django
Successfully installed Django-3.2.7 asgiref-3.4.1 pytz-2021.1 sqlparse-0.4.1
WARNING: You are using pip version 21.1.3; however, version 21.2.4 is available.
You should consider upgrading via the '/home/yanboyang713/pythonTestEnvironment/bin/python -m pip install --upgrade pip' command.
```

You can check the version of Pip you’re using and directory with the following command:

```console
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ pip -V
pip 21.1.3 from /home/yanboyang713/pythonTestEnvironment/lib/python3.9/site-packages/pip (python 3.9)
```

**TIPS:**
It is a good practice to always work with a requirements.txt file for easy collaboration since it stores a list of all installed packages in your environment.

To create a requirements.txt, use:
```bash
python -m pip freeze > requirements.txt
```

For example:
```console
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ ls -la
total 24
drwxr-xr-x  5 yanboyang713 yanboyang713 4096 Sep  8 15:15 .
drwx------ 52 yanboyang713 yanboyang713 4096 Sep  8 15:12 ..
drwxr-xr-x  3 yanboyang713 yanboyang713 4096 Sep  8 15:28 bin
drwxr-xr-x  2 yanboyang713 yanboyang713 4096 Sep  8 15:15 include
drwxr-xr-x  3 yanboyang713 yanboyang713 4096 Sep  8 15:15 lib
lrwxrwxrwx  1 yanboyang713 yanboyang713    3 Sep  8 15:15 lib64 -> lib
-rw-r--r--  1 yanboyang713 yanboyang713   69 Sep  8 15:15 pyvenv.cfg
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ python -m pip freeze > requirements.txt
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ ls -la
total 28
drwxr-xr-x  5 yanboyang713 yanboyang713 4096 Sep  8 15:31 .
drwx------ 52 yanboyang713 yanboyang713 4096 Sep  8 15:12 ..
drwxr-xr-x  3 yanboyang713 yanboyang713 4096 Sep  8 15:28 bin
drwxr-xr-x  2 yanboyang713 yanboyang713 4096 Sep  8 15:15 include
drwxr-xr-x  3 yanboyang713 yanboyang713 4096 Sep  8 15:15 lib
lrwxrwxrwx  1 yanboyang713 yanboyang713    3 Sep  8 15:15 lib64 -> lib
-rw-r--r--  1 yanboyang713 yanboyang713   69 Sep  8 15:15 pyvenv.cfg
-rw-r--r--  1 yanboyang713 yanboyang713   58 Sep  8 15:31 requirements.txt
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ cat requirements.txt 
asgiref==3.4.1
Django==3.2.7
pytz==2021.1
sqlparse==0.4.1
```

### Deactivating a virtual environment
After you finish with the environment, deactivate it by using:

```console
(pythonTestEnvironment) [yanboyang713@Boyang-PC pythonTestEnvironment]$ deactivate
[yanboyang713@Boyang-PC pythonTestEnvironment]$ 
```

### Deleting the virtual environment
Since virtual environments are self-contained, when no longer needed, just delete the project’s virtual environment directory.

## Virtualenv
Virtualenv is a third-party dependency manager tool used for creating and managing Python projects. It is the most used and most popular virtual environment module for the Python 2 language.

**Note** virtual environments do not come as a native feature for Python 2.

### The cons
+ It cannot be upgraded using pip.
+ It cannot create and discover virtual environments for randomly installed Python versions.

### Installation
In order to use Virtualenv, we first need to install it using the following command:

```bash
$ pip install virtualenv
```

### Creating a virtual environment
To create a virtual environment, run the following command:

```bash
$ virtualenv venv
```

Use venv as the name of your project’s virtual environment. To activate and deactivate the virtual environment, use the same commands as Venv.

### Installing dependencies
To install additional packages and libraries, use:
```bash
$ pip install <package name>
```

## Pipenv
Pipenv is a package manager that is used to manage Python projects dependencies. It is good for the common typical workflow of using dependencies like pip, requirements.txt, etc.

Under the hood, Pipenv generally combines the use of pip and Virtualenv into a simple command-line tool.

Features
1. It automatically creates and manages a virtual environment for your projects.
2. It generates the Pipfile.lock file which helps in deterministic builds.
3. It adds and removes packages from a Pipfile as you install and uninstall packages.
4. It automatically locates you project by looking for a Pipfile.
5. Provides insights into your dependency graph. Try pipenv graph.
6. Smooth development workflow by loading .env files.

### Installation
Before we use Pipenv, let’s first install it. Run the following command on a terminal.

```bash
$ pip install pipenv
```

After running this, Pipenv will be installed on your machine. Here’s the part where we now say goodbye to pip. It has been a journey indeed!

### Creating a virtual environment
After installation, we just need to install a Python module using Pipenv and boom!, we have a virtual environment.

```bash
$ pipenv install Django==2.0.13
```

The command above automatically creates a Pipfile and a Pipfile.lock file in your project’s virtual environment. These files are where your project dependencies are saved.

If you wish to change the dependencies, you could change the default Pipenv configurations.

### Activating the virtual environment
After creating our virtual environment, we can activate it by running the command below in the project directory.

```bash
$ pipenv shell
```

### Uninstalling packages
You can uninstall a package from your project by running the following command:

```bash
$ pipenv uninstall Django
```

Here, you don’t need to specify the package version. The package is also removed from the Pipfile and Pipfile.lock file.

### Deleting a virtual environment
For whatever reason you feel the need to remove a virtual environment, you can do that with Pipenv using the command below.

```bash
$ pipenv --rm
```

Note that with Pipenv, you can specify the version of Python to use, using the command below:

```bash
$ pipenv --python path/to/python
```

Note: You can get the specific Python version using Pyenv.

## Conda
Conda is a package management and environment management system that not only supports Python but also other languages like Ruby, Scala, R and C/C++. It is used to create, save, load and switch between environments in your local machine.

Conda comes pre-installed in anaconda and miniconda.

### Features
+ You can share environments.
+ Finding and installing packages - Since Conda is also an environment manager, you can set up another environment to run a different version of Python, without interfering with the environment that runs your usual version of Python.

### Installation
Installing Conda is a bit different from other dependency managers. The easiest way to install it is by installing Anaconda or Miniconda - a mini version of anaconda that contains only Conda and its dependencies.

### Creating an environment
To create a virtual environment using Conda, run the following command on a terminal.

```bash
$ conda create --venv
```

There are several other ways of creating a conda environment that goes beyond the scope of this article.

### Activating an environment
To activate an environment, run:

```bash
conda activate venv
```

Or you can run the following in the Anaconda prompt:

```bash
$ activate base
```

### Deactivating an environment
To deactivate a virtual environment, run:

```bash
$ conda deactivate
```

## Poetry
https://python-poetry.org/docs/

[Poetry](https://github.com/python-poetry/poetry) is popularly known as a very feature-rich Python tool for project dependency management. It comes wrapped with a powerful CLI for creating and managing Python projects.

### Features
+ It comes with a pyproject.toml file that contains a tool.poetry section that is composed of several sections like README.md, name, author, etc for project documentation.
+ It is faster than most virtual environment tools.
+ It allows libraries declaration and auto updating of dependencies.

### Installation
Unlike other project dependency tools, Poetry comes with a custom installer that isolates it from the rest of your system by seperating its dependencies.

+ osx / linux / bashonwindows install instructions
```bash
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
```

```console
yanboyang713@Boyang-PC ~> curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python -
Retrieving Poetry metadata

# Welcome to Poetry!

This will download and install the latest version of Poetry,
a dependency and package manager for Python.

It will add the `poetry` command to Poetry's bin directory, located at:

/home/yanboyang713/.local/bin

You can uninstall at any time by executing this script with the --uninstall option,
and these changes will be reverted.

Installing Poetry (1.1.8): Done

Poetry (1.1.8) is installed now. Great!

You can test that everything is set up by executing:

`poetry --version`

```

**Warning**: The previous get-poetry.py installer is now deprecated, if you are currently using it you should migrate to the new, supported, install-poetry.py installer.

## Reference
1. https://www.section.io/engineering-education/introduction-to-virtual-environments-and-dependency-managers/
2. https://docs.python.org/3/library/venv.html

