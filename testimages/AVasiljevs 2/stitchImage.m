function [ stitchedImage ] = stitchImage( tiledImage )
%Takes a tiled image and sews it up into one full image
[xAxis,yAxis,ndims] = size(tiledImage);
stitchedImage =[];

    for q=1:xAxis
        stitchedRow = [];
        for w=1:yAxis 
        stitchedRow = [stitchedRow tiledImage{q,w}]    
        end
    stitchedImage = [stitchedImage ; stitchedRow];
    end
end

