function [ images ] = readFilesFromFolder( imgPath )
%  Reads jpg files from a folder
imgType = '*.jpg'; % change based on image type
imagefiles  = dir([imgPath imgType]); 
nfiles = length(imagefiles);
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread([imgPath, currentfilename]);
   images{ii} = currentimage;
end
end

