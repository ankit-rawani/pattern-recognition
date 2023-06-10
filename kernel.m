function [res] = kernel(x1, x2, s) 
    res = exp((-(x1-x2)' * (x1-x2))/(s*s));
end