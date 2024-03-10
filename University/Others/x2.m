function [r] = x2(inn)
r = zeros(1, length(inn));
for i=1:(length(inn))
    if 1 < inn(i)
        if inn(i) < 3
            r(i) = 1;
        end
    else
        r(i) = 0;
    end
end