function [ simMeasure ] = similarity( destHistogram,sourceHistogram)
NhRedSource = sourceHistogram{1,1};
NhGreenSource = sourceHistogram{2,1};
NhBlueSource = sourceHistogram{3,1};
NhRedDest = destHistogram{1,1};
NhGreenDest = destHistogram{2,1};
NhBlueDest =  destHistogram{3,1};
FRed= sum((NhRedSource - NhRedDest).^2);
FGreen= sum((NhGreenSource - NhGreenDest).^2);
FBlue = sum((NhBlueSource - NhBlueDest).^2);
simMeasure = 0.2989*FBlue + 0.5870*FRed + 0.1140*FGreen;

end

