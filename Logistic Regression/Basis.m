function [res] = Basis(x, m)
res = [];
for i=1:m
    res = [res sum(x.^(i-1))/length(x)];
end
end