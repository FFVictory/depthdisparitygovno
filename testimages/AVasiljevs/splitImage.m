function [ tiledDestImage ] = splitImage(rgbImage ,numOfTiles)

%   Function splits a coloured image into a numOfTiles
imageSize = size(rgbImage);
blockSizeX = floor(imageSize(1)/numOfTiles(1)); % Rows in block.
blockSizeY = floor(imageSize(2)/numOfTiles(2)); % Columns in block.
[rows, columns ,numberOfColorBands] = size(rgbImage);
wholeBlockRows = floor(rows / blockSizeX);
wholeBlockX = [blockSizeX * ones(1, wholeBlockRows), rem(rows, blockSizeX)];
wholeBlockCols = floor(columns / blockSizeY);
wholeBlockY = [blockSizeY * ones(1, wholeBlockCols), rem(columns, blockSizeY)];
ca = mat2cell(rgbImage, wholeBlockX, wholeBlockY, numberOfColorBands);

numPlotsX = size(ca, 1);
numPlotsY = size(ca, 2);
tiledDestImage ={};
for x = 1 : numPlotsX
    oneDimensionCellArray = {};
    for y = 1 : numPlotsY
        rgbBlock = ca{x,y};
        if(~isempty(ca{x,y}))
        tiledDestImage{x,y}=rgbBlock;
        end
    end
end
end

