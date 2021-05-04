# Manjaro Linux kernel headers installation

## Overview
A Linux kernel is the core of a Linux distribution and consists of three things:
+ The kernel itself
+ The kernel's headers
+ The kernel's extra modules

The kernel headers are used to define device interfaces. For example, they can be used to compile the module that controls your computer's video card and driver.

The main reason you may find yourself needing to install kernel headers is if you are compiling kernel modules and need Linux to access and communicate with hardware as intended. Sometimes device drivers may require you to update the kernel headers on your system to function properly. Other times, there may be compatibility issues with new versions and you'll need to roll back an update. The process for doing this can vary on each distribution, but in this guide we'll be going over the steps specifically for Manjaro Linux. Continue reading to find out how to install kernel headers, check the version of installed kernel headers, and switch between kernel header versions on Manjaro.

## In this tutorial you will learn:
+ Linux API headers vs kernel headers
+ Install or update kernel headers
+ Switch between kernel header versions

## Getting the right package
To clear up any upcoming confusion, let us preface by saying that Arch Linux, the ancestor of Manjaro, uses two separate but similarly named header packages. One is **linux-api-headers** which is sanitized for use in userspace. This package is utilized when the user tries to compile their own libraries, like glibc for example.

What you need to know is that this API package has nothing to do with the Linux kernel headers themselves. The two are independent of each other and may very well be at different versions. In this guide, we're working with kernel headers, and not the API headers.

## Check kernel header version
You can see the version of your system's current kernel headers by opening a terminal and executing the following command. This instructs pacman to retrieve a list of all the packages installed on your system and grep specifically for headers.

```console
[yanboyang713@boyang ~]$ pacman -Q | grep headers
linux-api-headers 5.8-1
```

We have a fresh install of Manjaro on our test system and pacman shows us that there aren't any kernel headers currently installed. Again, the **linux-api-headers** package is not the kernel headers.

If your system does have kernel headers installed, you'll see the version in that output.

## Install or update kernel headers
Generally, the version of our system's kernel headers should correspond to the version of the kernel itself. This may not be the case if you're having compatibility issues and want to install an older version or if you need to test out the newest kernel header packages by installing a more upgraded version.

Open a terminal and type the following command to check the version of your Manjaro system's kernel:

```console
[yanboyang713@boyang ~]$ uname -r
5.9.11-3-MANJARO
```

As you'll see in the output, the version of the kernel on our test system is 5.9.11-3. The first two numbers are what's important here, so let's remember 5.9.

```console
[yanboyang713@boyang ~]$ sudo pacman -S linux-headers
[sudo] password for yanboyang713: 
:: There are 11 providers available for linux-headers:
:: Repository core
   1) linux414-headers  2) linux419-headers  3) linux44-headers  4) linux49-headers
   5) linux510-headers  6) linux54-headers  7) linux57-headers  8) linux58-headers  9) linux59-headers
:: Repository community
   10) linux54-rt-headers  11) linux59-rt-headers

Enter a number (default=1): 9
resolving dependencies...
looking for conflicting packages...

Packages (1) linux59-headers-5.9.11-3

Total Download Size:    9.68 MiB
Total Installed Size:  48.25 MiB

:: Proceed with installation? [Y/n] Y
:: Retrieving packages...
 linux59-headers-5.9.11-3-x86_64    9.7 MiB  4.14 MiB/s 00:02 [##################################] 100%
(1/1) checking keys in keyring                                [##################################] 100%
(1/1) checking package integrity                              [##################################] 100%
(1/1) loading package files                                   [##################################] 100%
(1/1) checking for file conflicts                             [##################################] 100%
(1/1) checking available disk space                           [##################################] 100%
:: Processing package changes...
(1/1) installing linux59-headers                              [##################################] 100%
:: Running post-transaction hooks...
(1/3) Arming ConditionNeedsUpdate...
(2/3) Updating module dependencies...
(3/3) Install DKMS modules
==> dkms install --no-depmod -m v4l2loopback -v 0.12.5 -k 5.9.11-3-MANJARO
==> depmod 5.9.11-3-MANJARO
```

Now, let's update our kernel headers to be on par with the kernel itself. Or, if you don't have kernel headers installed at all, this command will install them for you. Type the following command in your terminal:

If you already have kernel headers installed, pacman will proceed to update them. Otherwise, pacman will present you with a few options. Unless you have a unique circumstance, we want to choose from among the repository core options. We have seven different choices here. As discussed, there are a few situations where you may want to install older kernel headers, but generally, you'll want them on the same version as the kernel itself.

Since our test machine is running kernel 5.9.x, we'll choose option 6, which installs the linux59-headers package.

Check again to see that the package was installed correctly.

```console
[yanboyang713@boyang ~]$ sudo pacman -Q | grep headers
linux-api-headers 5.8-1
linux59-headers 5.9.11-3
```

You may need to reboot your system to start using the kernel headers.

```bash
$ reboot
```

## Switch between kernel header versions
If you're looking to switch kernel header versions, you have the option to either upgrade or downgrade. We covered upgrading above, but here's the command again:

```bash
$ sudo pacman -S linux-headers
```

To downgrade, you need to remove the current version of your installed headers, and then you can use pacman to install an older version. For example, to remove our 5.6 headers:

```bash
$ sudo pacman -R linux56-headers
```

Next, issue the following command and choose which version you'd like to use:

```bash
$ sudo pacman -S linux-headers
```

You'll have the option to install various header versions from either the repository core or community repository.

## Conclusion
In this guide, we saw how to install, upgrade, and switch between kernel header versions on Manjaro Linux. We also discussed the important Arch-unique caveat about the linux-api-headers package which causes a bit of confusion to the inexperienced.


