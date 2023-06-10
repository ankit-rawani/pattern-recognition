function [b, v, to, s] = CT1_backup(xtrain, ytrain, xtest, ytest, t, lambdaArr)
b = [];
v = [];
s = [];

for i=1:length(lambdaArr)
    [bt, vt, st] = BVAnalysis(xtrain, ytrain, xtest, ytest, t, lambdaArr(i));
    b = [b bt];
    v = [v vt];
    s = [s st];
end

to = b + v;

end

function [bias2, var, sse] = BVAnalysis(xtrain, ytrain, xtest, ytest, t, lambda)
phi1 = [];
phi2 = [];

n = length(xtrain);

xtrain1 = xtrain(1:2:n);
xtrain2 = xtrain(2:2:n);

n1 = length(xtrain1);
n2 = length(xtrain2);

t1 = t(1:2:n);
t2 = t(2:2:n);

for i=1:n1
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtrain1(i), j)];
    end
    phi1 = [phi1; tmp];
end

w1 = ((phi1'*phi1 +lambda*eye(3))^-1)*phi1'*t1';

for i=1:n2
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtrain2(i), j)];
    end
    phi2 = [phi2; tmp];
end

w2 = ((phi2'*phi2 +lambda*eye(3))^-1)*phi2'*t2';

yhat1 = [];
yhat2 = [];

for i=1:n
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtrain(i), j)];
    end
    yhat1 = [yhat1 w1'*tmp'];
end

for i=1:n
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtrain(i), j)];
    end
    yhat2 = [yhat2 w2'*tmp'];
end

ybar = 0.5 * (yhat1 + yhat2);

bias2 = 0;
for i=1:n
    bias2 = bias2 + (ybar(i) - ytrain(i)) ^ 2;
end

bias2 = bias2 / n;

var = 0;
for i=1:n
    tmp = (yhat1(i) - ybar(i))^2 + (yhat1(i) - ybar(i))^2;
    var = var + tmp / 2;
end

var = var / n;

yhattest1 = [];
yhattest2 = [];

for i=1:n
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtest(i), j)];
    end
    yhattest1 = [yhattest1 w1'*tmp'];
end

for i=1:n
    tmp = [];
    for j=0:2
        tmp = [tmp Basis(xtest(i), j)];
    end
    yhattest2 = [yhattest2 w2'*tmp'];
end

ybartest = 0.5 * (yhattest1 + yhattest2);

e = ybartest - ytest;

sse = e * e';

disp("lambda")
disp(lambda)

disp("phi1")
disp(phi1)

disp("phi2")
disp(phi2)

disp("w1")
disp(w1)

disp("w2")
disp(w2)

disp("yhat1")
disp(yhat1)

disp("yhat2")
disp(yhat2)

disp("ybar")
disp(ybar)

disp("yhattest1")
disp(yhattest1)

disp("yhattest2")
disp(yhattest2)

disp("ybartest")
disp(ybartest)

disp("test error")
disp(e)

disp("--------------------")

end

function [res] = Basis(x, i)
res = x ^ i;
end