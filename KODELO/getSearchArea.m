function searchArea = getSearchArea( windowInitialCoordX , windowInitialCoordY, maxX,maxY )
%UNTITLED3 Summary of this function goes here
%   Coordinates are in window instances NOT PIXELS
    SearchAreaSizeInWindows = 8;%Hardcoded for now
    
    windowStartX = windowInitialCoordX - SearchAreaSizeInWindows;
    windowStartY = windowInitialCoordY - SearchAreaSizeInWindows;
    if windowStartX < 1
        windowStartX = 1;
    end
    if windowStartY < 1
        windowStartY = 1;
    end
    windowEndX  = windowInitialCoordX + SearchAreaSizeInWindows;
    if windowEndX > maxX
        windowEndX = maxX;
    end
    windowEndY = windowInitialCoordY + SearchAreaSizeInWindows;
    if windowEndY > maxY
        windowEndY = maxY;
    end
    searchArea = [windowStartX , windowEndX , windowStartY, windowEndY];
end

