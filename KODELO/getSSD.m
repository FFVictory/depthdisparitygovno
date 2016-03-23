function ssd = getSSD(imageWindow1, imageWindow2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    ssd = (imageWindow1-imageWindow2).^2;
    ssd = sum(sum(ssd));
    
end

