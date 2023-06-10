clear;
close all;
clc;

load("DATA_for_experiment.mat");

g = 2;
precision = 20;
xtrain = x(1:g:200);
ytrain = y(1:g:200);

xtest = x(2:2:200);
ytest = y(2:2:200);

% xtest = x(201);
% ytest = y(201);

[w, ypredict, beta] = MaximumLikelihoodEstimate(xtrain, ytrain, xtest, precision);


% output comparison %

figure
hold on
plot(xtest, ytest)
plot(xtest, ypredict)
legend("Actual", "Prediction")
hold off


% normal distribution plot %

% yrange = -8:0.01:8;
% 
% yvalues = [];
% for m=yrange
%     yvalues = [yvalues NormalDistribution(m, ypredict, 1/beta)];
% end
% 
% figure
% plot(yrange, yvalues)