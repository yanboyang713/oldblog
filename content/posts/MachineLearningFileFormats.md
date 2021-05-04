---
title: "Guide to File Formats for Machine Learning"
subtitle: "Columnar, Training, Inferencing, and the Feature Store"
date: 2020-09-01T06:11:32+10:00
tags: [ "Machine Learning", "machine Learning File Formats" ]
categoties: [ "machine Learning" ]
---
## Introduction
This post document is a guide to the popular file formats used in open source frameworks for machine learning in Python, including TensorFlow/Keras, PyTorch, Scikit-Learn, and PySpark. We will also describe how a Feature Store can make the Data Scientist’s life easier by generating training/test data in a file format of choice on a file system of choice. This guide is base on [Jim Dowling's blog](https://towardsdatascience.com/guide-to-file-formats-for-machine-learning-columnar-training-inferencing-and-the-feature-store-2e0c3d18d4f9).

A file format defines the structure and encoding of the data stored in it and it is typically identified by its file extension — for example, a filename ending in .txt indicates the file is a text file. However, even though files are used to store much of the world’s data, most of that data is not in a format that can be used directly to train ML models.

This post is mostly concerned with file formats for structured data and we will discuss the easy creation of training data in popular file formats for ML, such as .tfrecords, .csv, .npy, and .petastorm, as well as the file formats used to store models, such as .pb and .pkl . 

![Overview](https://miro.medium.com/max/700/0*EswBCD4bwdpoHn6S.png)

## Data sources
Machine learning frameworks want to consume training data as a sequence of samples, so file formats for training ML models should have easily consumable layouts with no impedance mismatch with the storage platform or the language used to read/write the files. Additionally, distributed training (training ML models on many GPUs at the same time to make training go faster) requires files to be splittable and accessible over a distributed file system or object store, so that different GPUs can read different shards (partitions) of the data in parallel from different servers.
