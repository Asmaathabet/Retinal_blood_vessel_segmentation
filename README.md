# Retinal Blood Vessel Segmentation

## Problem

The code aims to perform retinal blood vessel segmentation using various image processing techniques. Additionally, it includes a validation function to assess the accuracy of the segmentation results compared to ground truth data.

## Mathematical model 

-	Image Processing Techniques: The code implements several image processing steps to segment blood vessels by using Filtering and Thresholding Techniques like Gaussian filtering, erosion (using a diamond-shaped structuring element), principal curvature calculation, contrast enhancement (histogram equalization), and thresholding are used to identify blood vessels.
-	Validation Technique: The validation function compares the segmented image with a ground truth image to compute accuracy metrics in the training phase.

## Selected methods

1.	Structuring Element and Erosion: A diamond-shaped structuring element (strel('diamond', 20)) is applied for erosion to refine the mask.
2.	Gaussian Filter: Gaussian filtering (imgaussfilt) with a sigma value of 1.45 is used to smoothen the green channel of the input image.
3.	Principal Curvature Calculation: A function prinCur calculates the principal curvature of the filtered image.
4.	Histogram Equalization and Thresholding: Adaptive histogram equalization (adapthisteq) is performed on the calculated curvature. Thresholding (isodata) is used to segment the vessels.

## Test cases Demonstrations

1-	Training Phase:
-	Reads training images.
-	Processes each image using the described pipeline.
-	Generates segmented images and saves them in the processed folder.
-	Displays intermediate processing steps if the mode is 'train'.

![training_01]('/sources/training_01.png')
![training_02]('/sources/training_02.png')


-	The validation function assesses segmentation accuracy by comparing the segmented image with ground truth data.
It calculates metrics like True Positive Rate (TPR), False Positive Rate (FPR), and Accuracy (AC).

![training_03]('/sources/training_03.png')

2-	Testing Phase:
-	Reads test images.
-	Applies the same processing pipeline.
-	Saves the resulting segmented images in the results folder.
-	Displays intermediate steps if the mode is 'test' (commented out in the code).
-	There is no validation here as I don’t have ground truth values in the test folder database to compare with.

![test_01]('/sources/test_01.png')




