function [res] = classGenerator(x)
tmp = x'*x;
res = floor(tmp^3 + 4*tmp +1);
end