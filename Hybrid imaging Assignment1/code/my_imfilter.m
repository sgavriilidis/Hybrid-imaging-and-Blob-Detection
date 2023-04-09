function output = my_imfilter(image, filter)
% This function is intended to behave like the built in function imfilter()
% See 'help imfilter' or 'help conv2'. While terms like "filtering" and
% "convolution" might be used interchangeably, and they are indeed nearly
% the same thing, there is a difference:
% from 'help filter2'
%    2-D correlation is related to 2-D convolution by a 180 degree rotation
%    of the filter matrix.
imgDim= ndims(image);
[filterR, filterC] = size(filter);
% Your function should work for color images. Simply filter each color
% channel independently.
if (mod(filterR,2) == 0 || mod(filterC,2) == 0)
    msg = 'Invalid Filter Size.Please try odd numbers.';
    error(msg)
end

switch imgDim
    case 2
        %%%%grayscale
        %disp('grayscale')
        %[r,c] = size(image);
        imageTemp = myConvolution(image,filter);
        image = imageTemp(1:end-ceil(m/2), 1:end-ceil(n/2));
    case 3
        %%%%color image
        %disp('color')
        %[r,c,d] = size(image);
        for i=1:imgDim 
            helpImage = myConvolution(image(1:end,1:end,i),filter);
            image(1:end,1:end,i) = helpImage(1:end-floor(filterR/2)*2, 1:end-floor(filterC/2)*2);
        end
        
            
            
            
    otherwise
        disp('something else')
end

output=image;


% Your function should work for filters of any width and height
% combination, as long as the width and height are odd (e.g. 1, 7, 9). This
% restriction makes it unambiguous which pixel in the filter is the center
% pixel.



% Boundary handling can be tricky. The filter can't be centered on pixels
% at the image boundary without parts of the filter being out of bounds. If
% you look at 'help conv2' and 'help imfilter' you see that they have
% several options to deal with boundaries. You should simply recreate the
% default behavior of imfilter -- pad the input image with zeros, and
% return a filtered image which matches the input resolution. A better
% approach is to mirror the image content over the boundaries for padding.

% % Uncomment if you want to simply call imfilter so you can see the desired
% % behavior. When you write your actual solution, you can't use imfilter,
% % filter2, conv2, etc. Simply loop over all the pixels and do the actual
% % computation. It might be slow.
% output = imfilter(image, filter);


%%%%%%%%%%%%%%%%
% Your code here
%%%%%%%%%%%%%%%%







