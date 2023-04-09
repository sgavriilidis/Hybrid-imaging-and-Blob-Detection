
clc; clear all;

%%%%%%%%%%%            %%%%%%%%%%%
%%%%%%%%%%%  1st pair  %%%%%%%%%%%
%%%%%%%%%%%            %%%%%%%%%%%
kernelim1 = fspecial('Gaussian', [15 15], 10);  %% filter for Einstein with deviaton=10 and filter size [15 15]
kernelim2 = fspecial('Gaussian', [23 23], 14);  %% filter for Marilyn with deviaton=14 and filter size [23 23]


  
einstein = im2single(imread('pair1_einstein.bmp'));
marilyn = im2single(imread('pair1_marilyn.bmp'));


%imgFilter = imfilter(colorim1,kernel);
LowPassEinstein = my_imfilter(einstein,kernelim1);

%imgFilter = imfilter(colorim2,kernel);
colorim2Temp = my_imfilter(marilyn,kernelim2);
highPassMarilyn = marilyn - colorim2Temp;


figure;

subplot(2,2,1);
imshow(einstein);
title('Einstein');

subplot(2,2,2);
imshow(marilyn);
title('Marilyn');

subplot(2,2,3);
imshow(LowPassEinstein)
title('Low-pass filtered Einstein');
subplot(2,2,4);
imshow(highPassMarilyn+0.5)
title('High-pass filtered Marilyn');



hybridIm=LowPassEinstein+highPassMarilyn;
figure;
vis = visualize_hybrid_image(hybridIm);
imshow(vis);
title('Hybrid image');



%%%%%%%%%%%            %%%%%%%%%%%
%%%%%%%%%%%  2nd pair  %%%%%%%%%%%
%%%%%%%%%%%            %%%%%%%%%%%

% 
kernelim1 = fspecial('Gaussian', [41 41], 7);
kernelim2 = fspecial('Gaussian', [35 35], 10);



  
colorim1 = im2single(imread('pair2_HeathLedger.png'));
colorim2 = im2single(imread('pair2_joker.png'));


%imgFilter = imfilter(colorim1,kernel);
colorim1Final = my_imfilter(colorim1,kernelim1);

%imgFilter = imfilter(colorim2,kernel);
colorim2Temp = my_imfilter(colorim2,kernelim2);
colorim2Final =colorim2 - colorim2Temp;


figure;

subplot(2,2,1);
imshow(colorim1);
title('Heath');

subplot(2,2,2);
imshow(colorim2);
title('Joker');

subplot(2,2,3);
imshow(colorim1Final)
title('Low-pass filtered Heath');
subplot(2,2,4);
imshow(colorim2Final+0.5)
title('High-pass filtered Joker');



hybridIm=colorim1Final+colorim2Final;
figure;
vis = visualize_hybrid_image(hybridIm);
imshow(vis);
title('Hybrid image');



