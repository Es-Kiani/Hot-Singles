function result = ampedance(type, w, value)
    if type == 'R'
        result = value;
    elseif type == 'L'
        result = w * value * 1j;
    elseif type == 'C'
        result = 1/(w * value * 1j);
    end
end