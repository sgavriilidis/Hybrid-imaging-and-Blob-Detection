clear all;
close all;
clc;

%%%%%Code assignment 2 : Computer Vision class 2021

%%%Blob detector using the LoG

%%Parameters
sigma = 2;
k = sqrt(sqrt(2));
scales = 15;
threshold = 0.01;
image = imread('img\ac.jpg');

% imshow(image)



%%converting image to double grayscale
workImg = rgb2gray(image);
workImg_new = im2double(workImg);
% imshow(workImg)
[imgX, imgY] = size(workImg_new);

kernel = LoG(sigma);

disp('Please wait while generating scale space by downsizing image...');
tic;
scaleSpace = scaleSpaceGen(workImg_new,scales,sigma,k,kernel);
disp('Scale Space generated.')
toc;



scaleSpace_local_max = zeros(imgX,imgY,scales);
temp = zeros(imgX,imgY,scales);
for i=1:scales
    
     temp =  ordfilt2(scaleSpace(:,:,i),9,ones(3,3));
     scaleSpace_local_max(:,:,i) = temp;
end


finalScaleSpace = globalMax_ScaleSpace(scaleSpace_local_max,scaleSpace,scales);


threshold_flag = finalScaleSpace > threshold;
finalScaleSpace = finalScaleSpace .* threshold_flag;



%%radius by scale
radiusByScale = zeros(1,scales);

for i=1:scales
    
    radiusByScale(i) = sqrt(2) * sigma * k^(i-1);
    
end

blob_positions = [];

for i= 1:scales
    
   [row_pos, col_pos] = find(finalScaleSpace(:,:,i)); 
    
    temp_positions = [col_pos';row_pos'];
    temp_positions(3,:) = radiusByScale(i);
    
    blob_positions = [blob_positions; temp_positions'];
    
end


show_all_circles(workImg, blob_positions(:,1),blob_positions(:,2),blob_positions(:,3), 'r' , .5);

