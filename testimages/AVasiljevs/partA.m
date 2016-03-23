function [ classification ] = partA( inputImage ,  k , naturalImagesHistograms,manmadeImagesHistograms)


inputImageHistogram = {};
inputImageHistogram = computeHistograms(inputImage);

for q=1:length(naturalImagesHistograms)
    similarityMeasureManmade(q) = similarity(inputImageHistogram,manmadeImagesHistograms{q});
    similarityMeasureNature(q) = similarity(inputImageHistogram,naturalImagesHistograms{q});
end
similarityMeasureManmade = sort(similarityMeasureManmade);
similarityMeasureNature = sort(similarityMeasureNature);


classification = knearest(similarityMeasureManmade,similarityMeasureNature,k);

end

