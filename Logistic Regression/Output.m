function [res] = Output(k, w, x, m, n)
num = exp(-w(k, :)*Basis(x, m)');
den = 0;
for i=1:n
    den = den + exp(-w(i, :)*Basis(x, m)');
end

res = num/den;
end