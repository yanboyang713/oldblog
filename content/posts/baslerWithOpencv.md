---
title: "Getting started with Basler Camera With Opencv on Python"
date: 2020-09-03T06:11:32+10:00
tags: [ "Basler", "Opencv", "python" ]
categories: [ "Basler" ]
---
## Introduction
This post document is about using Basler Camera with Opencv on Python. At the beginning of this guide I will introduct how to set-up development environment with Pylon and opencv within Conda virual environment. Seconly, I will talk about how to check and set some of basic Basler feature base on pypylon. At the end, I will give a example about using Opencv read Basler Camera data stream.

## Hardware and Software Testing Environment
### Hardware Environment
+ Camera: Basler (a2A1920 - 51gcPRO)
+ Network Adapter: Intel I350 Gigabit Network adapter (POE)
+ CPU: Intel(R) Core(TM) i7-9700F CPU @ 3.00GHz
+ RAM: 16GiB system memory
### Software Environment
+ Ubuntu 18.04 (Linux version 5.4.0-48-generic)
+ Need set-up Network exchange environment, the document link: {% post_link ubuntuRouter %}

## Development Environment Set-up

### Creating conda environment
You can follow the below steps to create the conda environment. If you want to know more details about Conda, please have a look link: {% post_link conda %}

```bash
Please run

	$ source /opt/anaconda/bin/activate root
	$ source /opt/anaconda/bin/deactivate root

to activate and deactivate the anaconda enviroment.

conda create -n baslerOpencv python=3.7.7
conda activate baslerOpencv
conda install notebook ipykernel
ipython kernel install --user --name baslerOpencv --display-name "Python (Basler with Opencv)"
```
### Installing Pylon
#### For Ubuntu
1. Go to [Pylon Official Website](https://www.baslerweb.com/en/products/software/basler-pylon-camera-software-suite/).
2. Go to Downloads Section
3. Click link: pylon 6.1.1 Camera Software Suite Linux x86 (64 Bit) - Debian Installer Package
https://www.baslerweb.com/fp-1615275588/media/a_b_testing_1/pylon_6.2.0.21487_x86_64_setup.tar.gz
4. Filling in your personal INFOs and click "Start the Download!"
5. Goto you download directory(Using cd command)
6. You can use the apt command for install deb file
```bash
sudo apt install xxxx.deb
```
#### For Arch Linux (Manjaro)
```bash
yay -S pylon
```
**NOTE:**
1. You can found pylon in DIR: /opt/pylon6
2. **ipconfigurator**, **PylonFirmwareUpdater** and **pylonviewer**, which can found on DIR: /opt/pylon6/bin

When you done, you can see there are three applications be installed, which are Pylon IP Configurator, pylon viewer and Basler Product Documention.

### Installing pypylon binary wheel file to conda environment
[pypylon](https://github.com/basler/pypylon)
### For the Impatient
+ Download a binary wheel from the [releases](https://github.com/Basler/pypylon/releases) page.
https://github.com/basler/pypylon/releases/download/1.6.0/pypylon-1.6.0-cp37-cp37m-linux_x86_64.whl
+ Install the wheel using pip3 install <your downloaded wheel>.whl
+ Look at [samples/grab.py](https://github.com/basler/pypylon/blob/master/samples/grab.py) in this repository

```bash
pip install pypylon
```

**TIPS:**
```bash
Traceback (most recent call last):
  File "opencv.py", line 6, in <module>
    from pypylon import pylon
  File "/home/yanboyang713/miniconda3/envs/baslerOpencv/lib/python3.7/site-packages/pypylon/pylon.py", line 40, in <module>
    from . import _pylon
ImportError: libpython3.7m.so.1.0: cannot open shared object file: No such file or directory
```

```bash
# check your directory
export LD_LIBRARY_PATH=/home/yanboyang713/miniconda3/envs/front/lib
Or,
export LD_LIBRARY_PATH=/home/yanboyang713/.conda/envs/baslerOpencv/lib

echo $LD_LIBRARY_PATH
```

### Set-up pypylon-opencv-viewer(Option)
pip install pypylon-opencv-viewer

### Installing Opencv to conda environment
pip install opencv-python==3.4.2.17
pip install opencv-contrib-python==3.4.2.17 

## Testing pylon with your camera

```python
from pypylon import pylon
from pypylon import genicam

import sys

# Number of images to be grabbed.
countOfImagesToGrab = 100

# The exit code of the sample application.
exitCode = 0

try:
    # Create an instant camera object with the camera device found first.
    camera = pylon.InstantCamera(pylon.TlFactory.GetInstance().CreateFirstDevice())
    camera.Open()

    # Print the model name of the camera.
    print("Using device ", camera.GetDeviceInfo().GetModelName())

    # demonstrate some feature access
    new_width = camera.Width.GetValue() - camera.Width.GetInc()
    if new_width >= camera.Width.GetMin():
        camera.Width.SetValue(new_width)

    # The parameter MaxNumBuffer can be used to control the count of buffers
    # allocated for grabbing. The default value of this parameter is 10.
    camera.MaxNumBuffer = 5

    # Start the grabbing of c_countOfImagesToGrab images.
    # The camera device is parameterized with a default configuration which
    # sets up free-running continuous acquisition.
    camera.StartGrabbingMax(countOfImagesToGrab)

    # Camera.StopGrabbing() is called automatically by the RetrieveResult() method
    # when c_countOfImagesToGrab images have been retrieved.
    while camera.IsGrabbing():
        # Wait for an image and then retrieve it. A timeout of 5000 ms is used.
        grabResult = camera.RetrieveResult(5000, pylon.TimeoutHandling_ThrowException)

        # Image grabbed successfully?
        if grabResult.GrabSucceeded():
            # Access the image data.
            print("SizeX: ", grabResult.Width)
            print("SizeY: ", grabResult.Height)
            img = grabResult.Array
            print("Gray value of first pixel: ", img[0, 0])
        else:
            print("Error: ", grabResult.ErrorCode, grabResult.ErrorDescription)
        grabResult.Release()
    camera.Close()

except genicam.GenericException as e:
    # Error handling.
    print("An exception occurred.")
    print(e.GetDescription())
    exitCode = 1

sys.exit(exitCode)
```

## Image Control
### Image ROI (Area of Insterest)
#### Getting the width of the maximum value and the height of the maximum value
```python
print ("MaxWidth: ", camera.Width.GetMax())
print ("MaxHeight: ", camera.Height.GetMax())
```

#### Setting the width of the image ROI and the height of the image ROI
```python
## Set the width to 1920
camera.Width.SetValue(1920);

## Set the height to 1080
camera.Height.SetValue(1080)
```

#### Center the image ROI
+ To enable Center X, set the CenterX parameter to true.
The camera adjusts the OffsetX parameter value to center the image ROI horizontally. When you change the width of the image ROI, the OffsetX parameter value automatically adapts. The OffsetX parameter becomes read-only.
+ To enable Center Y, set the CenterY parameter to true.
The camera adjusts the OffsetY parameter value to center the image ROI vertically. When you change the height of the image ROI, the OffsetY parameter value automatically adapts. The OffsetY parameter becomes read-only.

```python
camera.BslCenterX.Execute();
camera.BslCenterY.Execute();
```

#### Setting the offset of image ROI
If you already center the image ROI, offset parameter becomes read-only. You cannot set offset value again.
```python
camera.OffsetX.SetValue(0);
camera.OffsetY.SetValue(0);
```
'''

#### Print the ROI INFOs
```python
print ("camera Width increment: ", camera.Width.GetInc())
print ("camera Height increment: ", camera.Height.GetInc())
print ("camera Minimum Width: ", camera.Width.GetMin())
print ("camera Minimum Height: ", camera.Height.GetMin())

print ("camera Width: ", camera.Width.GetValue())
print ("Camera offsetX: ", camera.OffsetX.GetValue())

print ("camera Height: ", camera.Height.GetValue())
print ("Camera offsetY: ", camera.OffsetY.GetValue() )

assert camera.Width.GetValue() + camera.OffsetX.GetValue() <= camera.Width.GetMax()
assert camera.Height.GetValue() + camera.OffsetY.GetValue() <= camera.Height.GetMax()
```

### Image/Pixel Format Control
The offical [Pixel Formats](https://docs.baslerweb.com/pixel-format)
+ list your camera available Pixel Formats
```python
print(camera.PixelFormat.Symbolics)
```
+ show your current Pixel Formats in used
```python
print ("camera.PixelFormat.GetValue: ", camera.PixelFormat.GetValue())
```
#### Mono Formats
If a monochrome camera uses one of the mono pixel formats, it outputs 8, 10, or 12 bits of data per pixel.

If a color camera uses the Mono 8 pixel format, the values for each pixel are first converted to the YUV color model. The Y component of this model represents a brightness value and is equivalent to the value that would be derived from a pixel in a monochrome image. So in essence, when a color camera is set to Mono 8, it outputs an 8-bit monochrome image. This type of output is sometimes referred to as "Y Mono 8".

```python
camera.PixelFormat.SetValue("Mono8")
camera.PixelFormat.SetValue("Mono12")
camera.PixelFormat.SetValue("Mono12p")
```

#### Bayer Formats
Color cameras are equipped with a Bayer color filter and can output color images based on the Bayer pixel formats given below.

If a color camera uses one of these Bayer pixel formats, it outputs 8, 10, or 12 bits of data per pixel. The pixel data is not processed or interpolated in any way. For each pixel covered with a red filter, you get 8, 10, or 12 bits of red data. For each pixel covered with a green filter, you get 8, 10, or 12 bits of green data. For each pixel covered with a blue filter, you get 8, 10, or 12 bits of blue data. This type of pixel data is sometimes referred to as "raw" output.

```python
camera.PixelFormat.SetValue("BayerRG8")
camera.PixelFormat.SetValue("BayerRG12")
camera.PixelFormat.SetValue("BayerRG12p")
```

#### RGB and BGR Formats
When a color camera uses the RGB 8 or BGR 8 pixel format, the camera outputs 8 bit of red data, 8 bit of green data, and 8 bit of blue data for each pixel in the acquired frame.

The pixel formats differ by the output sequences for the color data (red, green, blue or blue, green, red).

```python
camera.PixelFormat.SetValue("RGB8")
camera.PixelFormat.SetValue("BGR8")
```

#### YUV Formats
Color cameras can also output color images based on pixel data in YUV (or YCbCr) format.

If a color camera uses this format, each pixel value in the captured image goes through a conversion process as it exits the sensor and passes through the camera. This process yields Y, U, and V color information for each pixel value.

**Info**

The values for U and V normally range from -128 to +127. Because the camera transfers U values and V values with unsigned integers, 128 is added to each U value and V value before they are transferred from the camera. This way, values from 0 to 255 can be transferred.

```python
camera.PixelFormat.SetValue("YCbCr422_8")
```

### Black Level

The Black Level camera feature allows you to change the overall brightness of an image. All gray values of the pixels are changed by a specified amount.

For example, you can increase the gray value of each pixel in the image by 3.

Adjusting the Black Level

To adjust the black level, enter a value for the BlackLevel parameter.

The minimum black level setting is 0. The maximum setting depends on the camera model.

The change in the gray value resulting from the BlackLevel parameter value also depends on the camera model.

**INFO**
Basler recommends setting the black level to 0 before using any of the color enhancement features, e.g., Balance White, Color Transformation, or Gamma. After the color enhancements have been applied, you can change the black level as desired. However, increasing the black level will decrease the color accuracy.

```python
camera.BlackLevel.SetValue(0)
print ("camera.BlackLevel.GetValue()", camera.BlackLevel.GetValue())
```

### Gamma

![Gamma correction](https://en.wikipedia.org/wiki/Gamma_correction)

The Gamma camera feature allows you to optimize the brightness of acquired images for display on a monitor.

Using the Feature

#### How It Works

The camera applies a gamma correction value (γ) to the brightness value of each pixel according to the following formula (red pixel value (R) of a color camera shown as an example):
$R_{corrected} = (\frac{ R_{uncorrected} }{ R_{max} }) ^ γ * R_{max} $

The maximum pixel value (Rmax) equals, e.g., 255 for 8-bit pixel formats or 1 023 for 10-bit pixel formats.

#### Enabling Gamma Correction

To enable gamma correction:

1. Set the GammaEnable parameter to true (if available).
2. For best results, set the BlackLevel parameter to 0.
3. Set the Gamma parameter to the desired value. The parameter's value range is 0 to ≈4.
    + Gamma = 1: The overall brightness remains unchanged.
    + Gamma < 1: The overall brightness increases.
    + Gamma > 1: The overall brightness decreases.

In all cases, black pixels (brightness = 0) and white pixels (brightness = maximum) will not be adjusted.

**INFO**
If you enable gamma correction and the pixel format is set to a 12-bit pixel format, some image information will be lost. Pixel data output will still be 12-bit, but the pixel values will be interpolated during the gamma correction process.

#### Additional Parameters

Depending on your camera model, the following additional parameters are available:

+ GammaEnable: Enables or disables gamma correction.
+ GammaSelector: Allows you to select one of the following gamma correction modes:
    + User: The gamma correction value can be set as desired. (Default.)
    + sRGB: The camera automatically sets a gamma correction value of approximately 0.4. This value is optimized for image display on sRGB monitors.

+ BslColorSpaceMode or BslColorSpace: Allows you to select one of the following gamma correction modes:
    + RGB: No additional gamma correction value is applied.
    + sRGB: The image brightness is optimized for display on an sRGB monitor. A gamma correction value of approximately 0.4 is applied. For more information, see the footnotes in the Specifics section.

```python
## Set the Gamma value to 1.2
camera.Gamma.SetValue(1.2)
print ("camera.Gamma.GetValue()", camera.Gamma.GetValue())
## Set the color space to sRGB
camera.BslColorSpace.SetValue("sRgb");
print ("camera.BslColorSpace.GetValue(): ", camera.BslColorSpace.GetValue())
```

### Auto Function ROI

The Auto Function ROI camera feature allows you to specify the part of the sensor array with which you want to control the camera's auto functions.

ROI is short for region of interest (formerly AOI = area of interest).

You can create several auto function ROIs, each occupying different parts of the sensor array.

The settings for the Auto Function ROI feature are independent of the settings for the Image ROI feature.

#### Changing Position and Size of an Auto Function ROI

By default, all auto function ROIs are set to the same size as the camera's image ROI. You can change their positions and sizes to suit your needs.

To change the position and size of an auto function ROI:

1. Set the AutoFunctionROISelector parameter to one of the available auto function ROIs, e.g., ROI1.
2. Enter values for the following parameters to specify the position of the auto function ROI selected:
    + AutoFunctionROIOffsetX
    + AutoFunctionROIOffsetY
3. Enter values for the following parameters to specify the size of the auto function ROI selected:
    + AutoFunctionROIWidth
    + AutoFunctionROIHeight

The position of an auto function ROI is specified based on the lines and rows of the sensor array.

Example: Assume that you have selected auto function ROI 1 and specified the following settings:

    AutoFunctionROIOffsetX = 14
    AutoFunctionROIOffsetY = 7
    AutoFunctionROIWidth = 5
    AutoFunctionROIHeight = 6

This creates the following auto function ROI 1:
![](https://docs.baslerweb.com/images/drawing-af-aoi.svg)
Only the pixel data from the area of overlap between the auto function ROI and the image ROI will be used by the auto function assigned to it.
**Info**

+ On color cameras, Basler recommends setting the parameters for position and size to even values (multiples of 2). This matches the auto function ROI to the color filter pattern of the sensor.
+ If the Binning feature is enabled, the auto function ROI settings refer to the binned lines and columns and not to the physical lines in the sensor.
+ If the Reverse X or Reverse Y feature or both are enabled, the position of the auto function ROI relative to the sensor remains the same. As a consequence, different regions of the image will be controlled depending on whether or not Reverse X, Reverse Y or both are enabled.

#### Auto Function ROI Highlighting
If highlighting is supported by your camera model, you can highlight one or multiple Auto Function ROIs in the pylon Viewer. Areas that don't belong to the Auto Function ROIs appear darker:
![](https://docs.baslerweb.com/images/image-auto-function-roi-highlight.jpg)

To highlight an Auto Function ROI:

1. Set the AutoFunctionROISelector parameter to the desired auto function ROI, e.g., ROI1.
2. Set the AutoFunctionROIHighlight parameter to true.

#### Assigning Auto Functions

By default, each auto function ROI is assigned to a specific auto function. For example, the pixel data from auto function ROI 2 is used to control the Balance White Auto auto function.

On some camera models, the default assignments can be changed. To do so:

Set the AutoFunctionROISelector parameter to one of the available auto function ROIs, e.g., ROI1.

Assign the desired auto function(s) to the auto function ROI selected:

+ If you want to assign Balance White Auto, set the AutoFunctionROIUseWhiteBalance parameter to true.
+ If you want to assign Exposure Auto and gain auto, set the AutoFunctionROIUseBrightness parameter to true. (Exposure Auto and Gain Auto always work together.)
+ If you want to assign Tonal Range Auto, set the AutoFunctionROIUseTonalRange parameter to true.

**Info**

+ If you assign one auto function to multiple auto function ROIs, the pixel data from all selected auto function ROIs will be used for the auto function.
+ If you assign multiple auto functions to one auto function ROI, the pixel data from the auto function ROI will be used for all auto functions selected.

Exposure Auto and Gain Auto Assignments Work Together
When making auto function ROI assignments, the Gain Auto auto function and the exposure auto auto function always work together. they are considered as a single auto function named "intensity" or "brightness", depending on your camera model.

This does not imply, however, that Gain Auto and Exposure Auto must always be enabled at the same time.

#### Guidelines

When you are setting an auto function ROI, you must follow these guidelines:

| Guideline | Example|
| --------- |:------:|
| AutoFunctionROIOffsetX + AutoFunctionROIWidth ≤ Width of camera sensor | Camera with a 1920 x 1080 pixel sensor: AutoFunctionROIOffsetX + AutoFunctionROIWidth ≤ 1920 |
| AutoFunctionROIOffsetY + AutoFunctionROIHeight ≤ Height of camera sensor | Camera with a 1920 x 1080 pixel sensor: AutoFunctionROIOffsetY + AutoFunctionROIHeight ≤ 1080 |

#### Overlap Between Auto Function ROI and Image ROI

The size and position of an auto function ROI can be identical to the size and position of the image ROI, but this is not a requirement. For an auto function to work, it is sufficient if both ROIs overlap each other partially.

The overlap between auto function ROI and image ROI determines whether and to what extent the auto function will control the related image property. Only the pixel data from the areas of overlap will be used by the auto function to control the image property of the entire image.

+ If the auto function ROI is completely contained in the image ROI, the pixel data from the auto function ROI will be used to control the image property.
![](https://docs.baslerweb.com/images/drawing-af-aoi-with-full-effect.svg)

+ If the image ROI is completely contained in the auto function ROI, only the pixel data from the image ROI will be used to control the image property.
![](https://docs.baslerweb.com/images/drawing-af-aoi-all-encompassing.svg)

+ If the auto function ROI overlaps the image ROI only partially, only the pixel data from the area of partial overlap will be used to control the image property.
![](https://docs.baslerweb.com/images/drawing-af-aoi-with-partial-effect.svg)

+ If the auto function ROI does not overlap the image ROI, the related auto function will not work.
![](https://docs.baslerweb.com/images/drawing-af-aoi-with-no-effect.svg)
**Info**

Basler strongly recommends completely including the auto function ROI within the image ROI or choosing identical positions and sizes for auto function ROI and image ROI.

```python
## Select auto function ROI 1
camera.AutoFunctionROISelector.SetValue("ROI1")

## Specify position and size of the auto function ROI selected
camera.AutoFunctionROIOffsetX.SetValue(camera.OffsetX.GetValue())
camera.AutoFunctionROIOffsetY.SetValue(camera.OffsetY.GetValue())
camera.AutoFunctionROIWidth.SetValue(camera.Width.GetValue())
camera.AutoFunctionROIHeight.SetValue(camera.Height.GetValue())

print ("camera.AutoFunctionROIOffsetX.GetValue(): ", camera.AutoFunctionROIOffsetX.GetValue())
print ("camera.AutoFunctionROIOffsetY.GetValue(): ", camera.AutoFunctionROIOffsetY.GetValue())

print ("camera.AutoFunctionROIWidth.GetValue(): ", camera.AutoFunctionROIWidth.GetValue())
print ("camera.AutoFunctionROIHeight.GetValue(): ", camera.AutoFunctionROIHeight.GetValue())


assert camera.AutoFunctionROIOffsetX.GetValue() + camera.AutoFunctionROIWidth.GetValue() <= camera.Width.GetMax()
assert camera.AutoFunctionROIOffsetY.GetValue() + camera.AutoFunctionROIHeight.GetValue() <= camera.Height.GetMax()

## Enable the 'Brightness' auto function (Gain Auto + Exposure Auto)
## for the auto function ROI selected
camera.AutoFunctionROIUseBrightness.SetValue(True)
## Highlight the auto function ROI selected
camera.AutoFunctionROIHighlight.SetValue(False)
```
### Auto Function Profile
The Auto Function Profile camera feature allows you to specify how gain and exposure time are balanced when the camera is making automatic adjustments.

#### Setting the Auto Function Profile

To set the auto function profile:

1. Set the Gain Auto auto function and the Exposure Auto auto function to Continuous.
2. Set the AutoFunctionProfile parameter to one of the following values (if available):
    + MinimizeGain
    + MinimizeExposureTime
    + MinimizeGainQuick
    + MinimizeExposureTimeQuick
    + Smart
    + AntiFlicker50Hz
    + AntiFlicker60Hz

#### Available Auto Function Profiles
##### Minimize Gain (= Gain Minimum)

The gain is kept as low as possible during the automatic adjustment process. If the exposure time is at its upper limit and the target brightness value has not been reached yet, the gain will be increased in order to reach the target.

##### Minimize Exposure Time (= Exposure Minimum)

The exposure time is kept as low as possible during the automatic adjustment process. If the gain is at its upper limit and the target brightness value has not been reached yet, the exposure time will be increased in order to reach the target.

##### Minimize Gain Quick (= Gain Minimum Quick)

This profile works the same as the Minimize Gain profile. The difference is that it reacts more quickly in situations with extreme changes in brightness or where the image brightness changes rapidly. This situation occurs, for example, when microscope objective lenses are changed using the objective turret.

##### Minimize Exposure Time Quick (= Exposure Minimum Quick)

This profile works the same as the Minimize Exposure Time profile. The difference is that it reacts more quickly in situations with extreme changes in brightness or where the image brightness changes rapidly. This situation occurs, for example, when microscope objective lenses are changed using the objective turret.

##### Smart

Gain is kept as low as possible and the frame rate will be kept as high as possible during automatic adjustments.

This is a four-step process:

1. The camera adjusts the exposure time to achieve the target brightness value.
2. If the exposure time must be increased to achieve the target brightness value, the camera does so until the frame rate drops.
3. If the frame rate drops, the camera stops increasing the exposure time and increases the gain until the AutoGainUpperLimit value is reached.
4. When the AutoGainUpperLimit value has been reached, the camera stops increasing the gain and increases the exposure time until the target brightness value is reached. Increasing the exposure time results in a lower frame rate.

##### Anti-Flicker 50 Hz / 60 Hz

Gain and exposure time are optimized to reduce flickering. If the camera is operating in an environment where the lighting flickers at a 50-Hz or a 60-Hz rate, the flickering lights can cause significant changes in brightness from image to image. Enabling the anti-flicker profile may reduce the effect of the flickering in the captured images.

Choose the frequency (50 Hz or 60 Hz) according your local power line frequency (e.g., North America: 60 Hz, Europe: 50 Hz).

```python
## Set the auto function profile to Exposure Minimum
camera.AutoFunctionProfile.SetValue("MinimizeExposureTime");
print ("camera.AutoFunctionProfile.GetValue(): ", camera.AutoFunctionProfile.GetValue())

## Set the auto function profile to Gain Minimum
camera.AutoFunctionProfile.SetValue("MinimizeGain")
print ("camera.AutoFunctionProfile.GetValue(): ", camera.AutoFunctionProfile.GetValue())

## Enable Gain and Exposure Auto auto functions and set the operating mode to Continuous

camera.GainAuto.SetValue("Continuous")
print ("camera.GainAuto.GetValue(): ", camera.GainAuto.GetValue())

camera.ExposureAuto.SetValue("Continuous")
print ("camera.ExposureAuto.GetValue(): ", camera.ExposureAuto.GetValue())
```

### Balance White Auto

The Balance White Auto camera feature automatically corrects color shifts in images acquired.

The pixel data for the auto function can come from one or multiple auto function ROIs.

To correct color shifts manually, use the Balance White feature.

#### Enabling or Disabling Balance White Auto

To enable or disable the Balance White Auto auto function:

1. Assign at least one auto function ROI to the Balance White Auto auto function.
    Make sure the auto function ROI overlaps the image ROI, either partially or completely.
2. Set the BalanceWhiteAuto parameter to one of the following operating modes:
    + Once: The camera adjusts the white balance until the average gray values for red, green, and blue are identical. When this has been achieved, or after a maximum of 30 calculation cycles, the camera sets the auto function to Off and applies the balance ratios resulting from the last calculation to all following images.
    + Continuous: The camera adjusts the white balance continuously while images are being acquired. The adjustment process continues until the operating mode is set to Once or Off.
    + Off: Disables the Balance White Auto auto function. The BalanceRatio parameters remain at the values resulting from the last automatic or manual adjustment.

#### How It Works

Automatic white balancing is a two-step process:

1. The camera compares the average gray values of the red, green, and blue pixels. It determines the color with the highest average gray value (i.e., the brightest color) and sets the BalanceRatio parameter value for this color to 1.
2. The camera automatically adjusts the BalanceRatio parameter values of the other two colors until the average gray values for red, green, and blue are identical.

As a result, the BalanceRatio parameter is set to 1 for one color and to a value between 1 and ≈15.98 for the other two colors.

Example: Assume the green pixels in your image have the highest average gray value. If you enable the Balance White Auto auto function, the camera sets the BalanceRatio parameter value for green to 1. Then, the camera automatically adjusts the BalanceRatio parameter values for red and blue until the average gray values for red, green, and blue are identical. The new balance ratios could be, e.g., green = 1, red = 1.08789, and blue = 2.19678.

**Info**

+ To view the BalanceRatio parameter values for red, green, or blue, switch to the respective color channel using the BalanceRatioSelector.
+ When the camera is capturing images continuously, the auto function takes effect with a short delay. The first few images may not be affected by the auto function.

```python
camera.AutoFunctionROISelector.SetValue("ROI1")

camera.AutoFunctionROIUseWhiteBalance.SetValue(True)
print ("camera.AutoFunctionROIUseWhiteBalance.GetValue(): ", camera.AutoFunctionROIUseWhiteBalance.GetValue())
camera.BalanceWhiteAuto.SetValue("Continuous")
print ("camera.BalanceWhiteAuto.GetValue(): ", camera.BalanceWhiteAuto.GetValue())
```

### Light Source Preset
![](https://docs.baslerweb.com/light-source-preset)

The Light Source Preset camera feature allows you to correct color shifts caused by certain light sources.

Depending on its specific color temperature, the light used for image acquisition can cause color shifts in the image. You can correct these color shifts by selecting the related light source preset.

Selecting a Light Source Preset

To select a light source preset, set the BslLightSourcePreset parameter to one of the following values (if available):

    Off: No light source preset is selected.
    Daylight5000K: The camera corrects color shifts caused by daylight lighting that has a color temperature of about 5 000 K.
    Daylight6500K: The camera corrects color shifts caused by daylight lighting that has a color temperature of about 6 500 K.
    Tungsten2800K: The camera corrects color shifts caused by tungsten lighting that has a color temperature of about 2 500 to 3 000 K.
    MicroscopeLED4500K: The camera corrects color shifts caused by microscope LED lighting that has a color temperature of about 4 500 K.
    MicroscopeLED5500K: The camera corrects color shifts caused by microscope LED lighting that has a color temperature of about 5 500 K.
    MicroscopeLED6000K: The camera corrects color shifts caused by microscope LED lighting that has a color temperature of about 6 000 K.
    Fluorescent4000K: The camera corrects color shifts caused by fluorescent lighting that has a color temperature of about 4 000 K.
    Custom: Selecting this preset enables the Color Transformation feature which allows you to customize the light source settings. You should only select this preset if you are thoroughly familiar with matrix color transformations. The camera also adjusts the Balance White and Color Adjustment settings so that they have neutral values that do not change the appearance of the colors.

The default light source preset varies by camera model.
**Info**

On Basler dart cameras, the light source presets are calibrated for the IR cut filter in the CS-mount variant. If you are using an S-mount or bare board variant, make sure your IR cut filter has suitable spectral characteristics.

For more information about the IR cut filter, see your camera topic. You can find your camera topic in the "Models" section.

#### Impact on Other Features

When you select a light source preset, the camera adjusts the settings of the following color enhancement features:
+ Balance White
+ Color Adjustment
+ Color Transformation
The settings will be optimized for the selected light source.
On some camera models, you can choose which features you want the camera to adjust.

#### Separate Processing
On some camera models, when you select a light source preset, the camera processes the changes to the features listed above separately. This means that the values of the corresponding parameters visible in the pylon API and the pylon Viewer are not changed.

Example: If you select the Daylight6500K light source preset, the camera adjusts the white balance, but the values of the BalanceRatio parameter don't change.

This has the advantage that you don't lose your color enhancement feature settings when you change the light source preset. Your own settings are independent from the light source preset adjustments.

#### No Separate Processing
On some camera models, when you select a light source preset, the camera doesn't process the feature changes separately. Instead, the camera directly adjusts the corresponding parameter values.

Example: If you select the Daylight6500K light source preset, the values of the BalanceRatio parameter change. You can see the changes in the pylon Viewer or by accessing the parameter via the pylon API.

This means if you set up the color enhancement features and then change the light source preset, your settings will be overwritten.

#### Light Source Preset Feature Selector

On some camera models, the BslLightSourcePresetFeatureSelector parameter is available.

If the parameter is available, you can select which features you want the camera to adjust when you select a light source preset.

By default, the camera adjusts all features.

To enable or disable adjustment of a specific feature:

1. Set the BslLightSourcePresetFeatureSelector parameter to the desired feature, e.g., ColorAdjustment.
2. Set the BslLightSourcePresetFeatureEnable parameter to true (feature enabled) or false (feature disabled).
3. Repeat steps 1 and 2 for all features that you want to enable or disable.

```python
## Disable light source presets (no correction)
camera.BslLightSourcePreset.SetValue("Off")
## Set the light source preset for daylight (at about 5000K)
camera.BslLightSourcePreset.SetValue("Daylight5000K")
## Set the light source preset for tungsten lighting (at about 2800K)
camera.BslLightSourcePreset.SetValue("Tungsten")
## Set the light source preset for daylight (at about 6500K)
camera.BslLightSourcePreset.SetValue("Daylight6500K")


## Disable adjustment of a specific feature
camera.BslLightSourcePresetFeatureSelector.SetValue("ColorAdjustment")
camera.BslLightSourcePresetFeatureEnable.SetValue(False)
```

