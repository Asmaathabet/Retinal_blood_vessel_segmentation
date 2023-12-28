function segmentImages(dataFolder,outputFolder,mode)
   % Main Function
   % This Function processes a collection of image files stored in a specified folder and performs various image processing steps on each image.
   % Output: Image processing steps include resizing, color space conversion, PCA, histogram equalization, filtering, thresholding, etc.
   

   % Explanation: 
   % 1- reads a batch of images
   % 2- processes each image through an image processing pipeline
   % 3- saves the resulting segmented images based on the specified mode
   % !!! Note:!!!!  it includes commented-out code for displaying intermediate processing steps for each image if desired.

    % This Flag to indicate the type of the operation train or test 
    MODE_FLAG = mode;

    % Get a list of all GIF files in the ground truth folder for training images
    groundTruthFolder = 'sources/training/1st_manual';
    gif_files = dir(fullfile(groundTruthFolder, '*.gif'));
    
    % Read all image files in the training or testing folder
    dataFiles = dir(fullfile(dataFolder, '*.tif'));
  
    % Image Processing Loop
    for i = 1:numel(dataFiles)
            currentFile = fullfile(dataFolder, dataFiles(i).name);

            % Image Processing Steps

            inputImage = imread(currentFile);
           
            %Vessel Extraction
 
            % Generation of image mask
            mask = im2bw(inputImage,20/255);
            se = strel('diamond',20);                   % structure element of dimond type of size 20 (errosion)
            erodedmask = im2uint8(imerode(mask,se));    % erroded img
        
            % Apply Gaussian filter to the image where s=1.45
            img3= imgaussfilt(inputImage(:,:,2) ,1.45);     % s: sigma standard deviation 
      
            % Finding lamda - principal curvature
            lamda2=prinCur(img3);
            maxprincv = im2uint8(lamda2/max(lamda2(:)));
            maxprincvmsk = maxprincv.*(erodedmask/255);
           
            % Contrast enhancement
            newprI = adapthisteq(maxprincvmsk,'numTiles',[8 8],'nBins',128);
            thresh = isodata(newprI);
            vessels = im2bw(newprI,thresh);
         
            % Filtering out small segments
            vessels = bwareaopen(vessels, 200);
            segImage = vessels;
              
            % Save the processed images to the processed or results folder
            resultName = sprintf('%d_.gif', i);
            imwrite(segImage, fullfile(outputFolder, resultName));

         
            % [Note] :[Please UnComment] To display figures showing the processing steps for each image. 

            if(MODE_FLAG == "train")
                groundTruthFile = fullfile(groundTruthFolder, gif_files(i).name);
                truthImage = imread(groundTruthFile);

                % to perform validation of vessel segmentation
                validation(truthImage,segImage);

                figure, montage({inputImage,truthImage,segImage},'size', [1,3])
                %figure, montage({inputImage,truthImage, erodedmask,img3,maxprincvmsk,vessels,segImage},'size', [1,7])
                %title("Train Images")
             else 
                 %figure, montage({inputImage, erodedmask,img3,maxprincvmsk,vessels,segImage},'size', [1,6]) 
                 %title("Test Images")
            end 
            
    end 
   
