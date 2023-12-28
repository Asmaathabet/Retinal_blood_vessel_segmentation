function trainAndTest(trainingFolder,processedFolder,testingFolder,resultFolder)
    % Train the method using the training data and try to reach the nearest
    
    % segmentations as much as possible
    segmentImages(trainingFolder,processedFolder,"train");


     % apply the same method on the testing images and store the results in
     % the test folder
    segmentImages(testingFolder,resultFolder,"test");

end
