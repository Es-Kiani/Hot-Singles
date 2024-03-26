function [r] = x1(inn)
r = zeros(1, length(inn));
for i=1:(length(inn))
    if 0 < inn(i)
        if inn(i) < 1
            r(i) = 2;
        end
    else
        r(i) = 0;
    end
end