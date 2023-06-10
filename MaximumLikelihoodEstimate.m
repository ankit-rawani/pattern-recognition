function [w, y, beta] = MaximumLikelihoodEstimate(x, t, xtest, precision)
    n = length(x);
    m = precision;
    
    phi = [];
    for i=1:1:n
        temp = [];
        for j=1:1:m
            temp = [temp Basis(j-1, x(i))];
        end
        phi = [phi; temp];
    end
    
    w = t * pinv(phi)';
    
    y = [];
    for e=xtest
        tmp = 0;
        for f=1:1:m
            tmp = tmp + w(f) * Basis(f-1, e);
        end
        y = [y tmp];
    end
    
    betainv = 0;
    for g=1:1:n
        tmp = 0;
        for h=1:1:m
            tmp = tmp + w(f) * Basis(f-1, x(n));
        end
        betainv = betainv + (t(n) - tmp) ^ 2;
    end
    
    beta = betainv / n;
end

function res = Basis(i, x)
    res = x ^ i;
end