% A3: Retinal blood vessel segmentation 

% This File contains main Folder paths in the Assignment

% These Folders used to compare methods results with the ground truth
% ground truth results for the training model
groundTruthFolder = 'sources/training/1st_manual';

% Training Phase |Folders used in developing the main method in training images
trainingFolder = 'sources/training/images';     % [input] contains training images
processedFolder = 'sources/processed';          % [output] contains result white & black images

% Testing Phase | Folders used in evaluating the main method in test images
testingFolder = 'sources/test/images';       % [input] contains test images
resultFolder = 'sources/results';            % [output] contains result white & black images


% Train & Test | This Function is the main Function that will handle both method operations in the image 
 trainAndTest(trainingFolder,processedFolder,testingFolder,resultFolder)


