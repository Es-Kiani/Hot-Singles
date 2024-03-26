function y = fact(varargin)

    x = cell2mat(varargin);
    L = numel(varargin);
    y = ones(1,L);
    
    for i=1:L
        for k=1:x(i)
            y(i)=k*y(i);
        end
    end
end