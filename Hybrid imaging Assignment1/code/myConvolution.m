 function convImg = myConvolution(image,filter)
% 
 
[kernelRows, kernelCol] = size(filter);
  
image = padarray(image, [floor(kernelRows/2) floor(kernelCol/2)]);



[imRows, imCol] = size(image);
convImg = zeros(imRows,imCol);

    for x = (1+kernelRows) : (imRows)
        for y = (1+kernelCol) :(imCol)
            value =0;
            for i=1:kernelRows
                for j=1:kernelCol
                 value = value + filter(i,j)*image(x-i,y-j);
                end
            end
            convImg(x-kernelRows,y-kernelCol) = value;
        end
    end
       

end

