function [largestSimilarityMeasure, IndexOfIt]  = temp( destTile , sources )
%PICK BEST IMAGE
%

[tileX , tileY] = size(destTile);
destTileHistogram = computeHistograms(destTile);
newSize  = [tileX, tileY];
for q=1:length(sources)
    if(~isempty(sources{q}))
       sources{q} = resizeImage(sources{q}, newSize);
       allSourceHistograms{q} = computeHistograms(sources{q});
       similarityMeasure(q) = similarity(destTileHistogram,allSourceHistograms{q});
    end
end
if(~isempty(sources{q}))
    [largestSimilarityMeasure, IndexOfIt] = max(similarityMeasure);
end
end

