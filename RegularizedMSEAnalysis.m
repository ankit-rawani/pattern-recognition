clear;
close all;
clc;

load("DATA_for_experiment.mat");

g = 1;
precision = 20;
lambda = 1;

xtrain = x(1:g:200);
ytrain = y(1:g:200);

% xtest = x(2:2:200);
% ytest = y(2:2:200);

xtest = x(201);
ytest = y(201);

[w, ypredict, beta] = RegularizedMSE(xtrain, ytrain, xtest, precision, lambda);


% output comparison %

% figure
% hold on
% plot(xtest, ytest)
% plot(xtest, ypredict)
% legend("Actual", "Prediction")
% hold off


% normal distribution plot %

yrange = -3:0.01:3;

yvalues = [];
for m=yrange
    yvalues = [yvalues NormalDistribution(m, ypredict, 1/beta)];
end

figure
hold on
plot(yrange, yvalues)
plot(ytest*ones(501), 0:0.01:5)
hold off