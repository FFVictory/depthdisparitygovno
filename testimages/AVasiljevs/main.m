function [ stitchedImage ] = main( ~ )

mosaicTargets{1,1} = readImage('mosaic_target1.jpg');
mosaicTargets{1,2} = readImage('mosaic_target2.jpg');

for i=1:length(mosaicTargets)
    mosaicTarget = mosaicTargets{1,i};
    prompt = 'How wide should the end picture be (pxls)? ';
    pixelsX = input(prompt);
    prompt = 'How high should the end picture be (pxls)? ';
    pixelsY = input(prompt);
    newSize = [pixelsX pixelsY];
    if((~isequal(pixelsX,[]))||(~isequal(pixelsY,[])))
        mosaicTarget = resizeImage(mosaicTarget,newSize);
    end
    prompt = 'How much horizontal Tiles? ';
    numOfTilesX = input(prompt);
    prompt = 'How much vertical Tiles? ';
    numOfTilesY = input(prompt);
    numOfTiles = [numOfTilesX numOfTilesY];
    tiledDestImage = splitImage(mosaicTarget,numOfTiles);
    [lengthX,lengthY] = size(tiledDestImage);
    prompt = 'What is the source folder? ';
    sourceFolder = input(prompt,'s');
    sourceFolder = strcat(sourceFolder , '/');
    images = readFilesFromFolder(sourceFolder); 
    [tileX , tileY,ndims] = size(tiledDestImage{1,1});
    
    tilesize = [tileX, tileY];
    for q=1:length(images)
       images{q} = resizeImage(images{q}, tilesize);
       images{q} = imgaussfilt(images{q},2);
    end
    [xAxis,yAxis,ndims] = size(tiledDestImage);
    for q=1:xAxis
        for w=1:yAxis 
        [largestSimilarityMeasure, IndexOfIt] = temp(tiledDestImage{q,w},images)
        tiledDestImage{q,w} = images{IndexOfIt};
        images{IndexOfIt} = [];
        end
    end
    stitchedImage{i} = stitchImage(tiledDestImage);
    image(stitchImage(tiledDestImage));

end
end

