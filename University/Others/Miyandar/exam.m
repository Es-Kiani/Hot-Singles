function [mid,dev,min,max]=exam(varargin)

    x = cell2mat(varargin);
    L = numel(varargin);
    
    mid = sum(x)/L;
    
    dev = (sum((x-mid).^2)/L)^(1/2);
    
    max=x(1);
    for i=2:L
        if x(i)>max
            max=x(i);
        end
    end
    
    min=x(1);
    for i=2:L
        if x(i)<min
            min=x(i);
        end
    end
        
end
    