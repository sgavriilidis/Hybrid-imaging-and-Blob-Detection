function [finalScaleSpace] = globalMax_ScaleSpace(localmax_SS, scaleSpace, scales)
    [imgX,imgY] = size(scaleSpace(:,:,4));
    
    maxFromNeighbors = localmax_SS;
    
    for i=1:scales
        
       if i==1
           low_bound = 1;
           upper_bound = 2;
       elseif i<scales
           low_bound = i-1;
           upper_bound = i+1;
       else
           low_bound = i-1;
           upper_bound = i;
       end
       
       maxFromNeighbors(:,:,i) = max(maxFromNeighbors(:,:,low_bound:upper_bound),[],3);
        
            
    end

%%%find locations of max value -- make everything else 0
locations_of_max = maxFromNeighbors == scaleSpace;
finalScaleSpace = maxFromNeighbors .* locations_of_max;

end