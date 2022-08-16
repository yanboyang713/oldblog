# Introduction of RCNN,Fast RCNN,Faster RCNN


## Introduction {#introduction}

-   Image classification

Alexnet, VGG, Googlenet, Resnet, Densen, etc.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659630817/UNC/imageClassification_iyk2sp.png" >}}

-   Object detection/localization

RCNN, FastRCNN, Faster RCNN, YOLO V1-V4, SSD, EffcientDet, etc.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659630917/UNC/objectDetection_lidwzi.png" >}}

-   Semantic Segmentation

FCN, segnet, Bisenet, Unet, etc.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659631008/UNC/semanticSegmentation_xmtvws.png" >}}

-   Instance Segmentation

Combine Object Localization and Semantic segmentation

MaskRCNN

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659631098/UNC/instanceSegmentation_orkz9s.png" >}}

Comparison between image classification, object detection and instance segmentation.

{{< figure src="https://miro.medium.com/max/700/1*Hz6t-tokG1niaUfmcysusw.jpeg" >}}


## Object Detection {#object-detection}

Task: it is necessary to identify the categories of object and its position with a box.

-   Classification
-   Bounding-box

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659634412/UNC/objectDetectionCat_ron104.png" >}}

Classification:
Performance Metrics: Accuracy Score (0.0 - 1.0)
Output: Class Label

Regression:
Performance Metrics: IOU (0.0 - 1.0)
Output: Box in image (x, y, w, h)

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659635207/UNC/objectClassClassificationBoundingBoxRegression_ae1svb.png" >}}


### IOU (intersection-over-union) {#iou--intersection-over-union}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659635372/UNC/IOU_yvhzvy.png" >}}

-   0.0 Bad
-   1.0 Good


### Take Bounding-Box for Classification and Regression {#take-bounding-box-for-classification-and-regression}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659635721/UNC/chooseBounding-Box_oaxjah.png" >}}

Take Bounding Box at **FOUR** corners, then compare with **Accuracy Score**.

How to choose this Bounding-Box?

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659636328/UNC/movingBoundingBox_yl7a9j.png" >}}

One approach is that we use sliding window of different size to locate objects in the image. This approach is called Exhaustive search. This approach is computationally very expensive as we need to search for object in thousands of windows even for small image size. Some optimization has been done such as taking window sizes in different ratios (instead of increasing it by some pixels). But even after this due to number of windows it is not very efficient.


## RCNN {#rcnn}

R-CNN was introduced by Ross Girshick, Jeff Donahue, Trevor Darrell and Jitendra Malik in 2014.

R-CNN stands for Regions with CNN. In R-CNN instead of running classification on huge number of regions we pass the image through selective search and select first 2000 region proposal from the result and run classification on that. In this way instead of classifying huge number of regions we need to just classify first 2000 regions. This makes this algorithm fast compared to previous techniques of object detection. There are 4 steps in R-CNN. They are as follows

1.  Pass the image through **selective search** Algorithm and generate region proposal (about 2000).
2.  Put each **Regions Proposal** warp as 227 x 227 size and put to CNN
3.  Take CNN's features to SVM doing the Classification.
4.  Using **Regressor** to fine-tune the Bounding-Box position.


### Region Proposal {#region-proposal}

Find where the object in the image might appear.

Find areas that may have objects (such as selectiong 2000 candidate boxes), these boxes could overlap and contain each other, so as to avoid violent enumeration of all boxes.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1659647824/UNC/reginProposal_fiumyl.png" >}}


### Selective Search {#selective-search}

Selective search algorithm which uses both Exhaustive search and segmentation (a method to separate objects of different shapes in the image by assigning them different colors).

Algorithm Of Selective Search :

1.  Generate initial sub-segmentation of input image using the method describe by Felzenszwalb et al in his paper "Efficient Graph-Based Image Segmentation".

    {{< figure src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20210722234727/segmentation.png" >}}

2.  Recursively combine the smaller similar regions into larger ones. We use Greedy algorithm to combine similar regions to make larger regions. The algorithm is written below.

    Greedy Algorithm:

    1.  From set of regions, choose two that are most similar.
    2.  Combine them into a single, larger region.
    3.  Repeat the above steps for multiple iterations.

    {{< figure src="https://media.geeksforgeeks.org/wp-content/uploads/20200128130724/Step2.PNG" >}}

3.


## Reference List {#reference-list}

1.  <https://towardsdatascience.com/step-by-step-r-cnn-implementation-from-scratch-in-python-e97101ccde55>

