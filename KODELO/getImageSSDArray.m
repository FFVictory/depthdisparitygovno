function minimumWindowSSD = getImageSSDArray(rightImage,searchArea,leftImageWindow, imageWindowLength, imageWindowWidth)
%Compares the provided LEFTWINDOW with all the possible windows from right
%   Detailed explanation goes here
    imageSSDArray = [];
    startY = searchArea(3);
    endY = searchArea(4);
    startX = searchArea(1);
    endX = searchArea(2);

    for y= startY:endY
          for x=startX:endX
                        
             rightImageWindow = getImageWindow((x*8)+1,(y*8)+1,imageWindowLength,imageWindowWidth,rightImage);
             SSD = getSSD(leftImageWindow, rightImageWindow); 
             if(exist('minimumSSD','var') == 0)
                minimumX = x;
                 minimumY = y;
                 minimumSSD = SSD 
             elseif(SSD<minimumSSD)
                 minimumX = x;
                 minimumY = y;
                 minimumSSD = SSD
             end

         
    
         end
    end    
    minimumWindowSSD = [ minimumX , minimumY , minimumSSD];
    
end

