---
title: "Getting started Software-defined radio with SDRPlay"
date: 2021-07-01T06:11:32+10:00
tags: [ "SDR", "SDRPlay" ]
categories: [ "SDR" ]
---

## Installing
```bash
yay -S pulseaudio
yay -S libsdrplay
yay -S soapysdr-git
yay -S soapysdrplay-git
yay -S sdrpp-git
```
SoapySDRUtil --find=sdrplay
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
https://github.com/pothosware/SoapySDR/issues/105

liquid-dsp was successfully installed.     

  On some machines (e.g. Linux) you should rebind your
  libraries by running 'ldconfig' to make the shared
  object available.  You might also need to modify your
  LD_LIBRARY_PATH environment variable to include the
  directory /usr/local

  Please report bugs to joseph@liquidsdr.org

