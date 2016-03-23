function [ tElapsed ] = mainB( ~ )

naturalImages = readFilesFromFolder('out_natural_1k 2/');
manmadeImages = readFilesFromFolder('out_manmade_1k 2/');
naturalImagesHistograms = {};
manmadeImagesHistograms = {};
for q=1:length(naturalImages)
   naturalImagesHistograms{q} = computeHistograms(naturalImages{q});
end
for w=1:length(manmadeImages)
   manmadeImagesHistograms{w} = computeHistograms(manmadeImages{w});
end

prompt = 'Whats the k value for k-nearest? ';
k = input(prompt);



% LOAD THE TEST IMAGES 
naturalImagesTest = readFilesFromFolder('out_natural_1k/');
manmadeImagesTest = readFilesFromFolder('out_manmade_1k/');

% NATURAL IMAGES
tStart=tic;
naturalImagesRecognized = length(naturalImagesTest);
for q=1:length(naturalImagesTest)
    classification = partA(naturalImagesTest{q} , k,naturalImagesHistograms,manmadeImagesHistograms);
    if(~strcmp(classification,'natural'))
       naturalImagesRecognized = naturalImagesRecognized -1 ;
    end
end
correctCalcNature = (naturalImagesRecognized/(length(naturalImagesTest)/100));
fprintf('Missclassication Rate for natural images is %.2f percent , k for algorithm is %d \n' , 100 - correctCalcNature , k );

% MANMADE
manMadeImagesRecognized = length(manmadeImagesTest);
for q=1:length(manmadeImagesTest)
    classification = partA(manmadeImagesTest{q} , k,naturalImagesHistograms,manmadeImagesHistograms);
    if(~strcmp(classification,'manmade'))
       manMadeImagesRecognized = manMadeImagesRecognized -1 ;
    end
end
correctCalcManMade = (manMadeImagesRecognized/(length(manmadeImagesTest)/100));
fprintf('Missclassication Rate for manmade images is %.2f percent , k for algorithm is %d \n' , 100 - correctCalcManMade , k );


tElapsed=toc(tStart);
fprintf('Elapsed time   = %.2fs \n',tElapsed);
fprintf('Overall Accuracy is %.2f percent \n'  , ((correctCalcNature+correctCalcManMade)/2));
% //////////////
end

