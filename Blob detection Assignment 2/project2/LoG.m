function [logFilter] = LoG(sigma)
  
  %%%%filter size ( will be odd, 4* sigma +1 -- needs testing)
  
  filtSize = fix(4 * sigma) +1;
  logFilter = fspecial('log',filtSize,sigma);
  
  %%normalize it
  %%logFilter = sigma.^2 * logFilter ;
 
  
  
  
end
