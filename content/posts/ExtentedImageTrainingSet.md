---
title: "Extented Image Training Set Tips"
subtitle: "Make Machine Learning model Robustness"
date: 2020-09-07T06:11:32+10:00
tags: [ "Machine Learning", "Extented Image Training Set", "OpenCV"]
categories: [ "Machine Learning" ]
---
## Introduction
Regardless of the algorithm and framework used to train the neural network, the amount of image data is always an important prerequisite for determining the quality of the training model. Data expansion is a common method for training models, which is very important for the robustness and accuracy of the model. This post document will use OpenCV to show some of tips for how we can extented image training set.

## Random cropping of images

```python
import cv2
import random

img = cv2.imread("lena.jpg")
width, height, depth = img.shape

img_width_box = width * 0.2
img_width_box = height * 0.2

for _ in range(9):
	start_pointX = int(random.uniform(0, img_width_box))
	start_pointY = int(random.uniform(0, img_height_box))
	
	copyImg = img[start_pointX:200, start_pointY:200]

	cv2.imshow ("test", copyImg)
	cv2.waitKey(0)

```
