function scaleSpace = scaleSpaceGen(img,scales,s,k,kernel)
  
  [x,y] = size(img);
  scaleSpace = zeros(x,y,scales);
  
  
  
  
  
  %%resize by factor, since we will be downsizing
  %%but want to include original image as the first one 
  %%as well
  
  
  
  for i=1:scales
    
    %%first time keep original image
    if i==1
      downImg = img;
    else
      downImg = imresize(img,1/k^(i-1),'bicubic');
    end
    
    %%passing downsized image through laplacian of gaussian
    %%filter
    
    %%replicate for repeating neighbor values
    %%same for size of output matrix to match size of input
    filtImg = imfilter(downImg, kernel, 'same', 'replicate');
    
    
    %% save img with original dimensions to scale space
    scaleSpace(:,:,i) = imresize(filtImg, [x,y], 'bicubic');
    
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
end
