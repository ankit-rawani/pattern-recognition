clc;
clear all;
close all;

load("DATA_for_experiment.mat");

xtrain1 = x(1:10:200);
ytrain1 = y(1:10:200);

xtrain2 = x(1:5:200);
ytrain2 = y(1:5:200);

xtrain3 = x(1:2:200);
ytrain3 = y(1:2:200);

xtrain4 = x(1:1:200);
ytrain4 = y(1:1:200);

xtest = x(201);
ytest = y(201);

betainv = 0.1;
s = 0.1;

[mean1, var1] = GaussianRegression(xtrain1, ytrain1, xtest, betainv, s);
[mean2, var2] = GaussianRegression(xtrain2, ytrain2, xtest, betainv, s);
[mean3, var3] = GaussianRegression(xtrain3, ytrain3, xtest, betainv, s);
[mean4, var4] = GaussianRegression(xtrain4, ytrain4, xtest, betainv, s);

yrange = -3:0.01:3;

yvalues1 = [];
yvalues2 = [];
yvalues3 = [];
yvalues4 = [];

for l=1:1:length(mean1)
    temp1 = [];
    for m=yrange
        temp1 = [temp1 NormalDistribution(m, mean1(l), var1(l))];
    end
    yvalues1 = [yvalues1; temp1];
end

for l=1:1:length(mean2)
    temp2 = [];
    for m=yrange
        temp2 = [temp2 NormalDistribution(m, mean2(l), var2(l))];
    end
    yvalues2 = [yvalues2; temp2];
end

for l=1:1:length(mean3)
    temp3 = [];
    for m=yrange
        temp3 = [temp3 NormalDistribution(m, mean3(l), var3(l))];
    end
    yvalues3 = [yvalues3; temp3];
end

for l=1:1:length(mean4)
    temp4 = [];
    for m=yrange
        temp4 = [temp4 NormalDistribution(m, mean4(l), var4(l))];
    end
    yvalues4 = [yvalues4; temp4];
end

figure
hold on
plot(yrange, yvalues1)
plot(yrange, yvalues2)
plot(yrange, yvalues3)
plot(yrange, yvalues4)
plot(ytest*ones(251), 0:0.01:2.5)

legend("20 Samples", "40 Samples", "100 Samples", "200 Samples", "Original value")
hold off