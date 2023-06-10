function [mean, var] = GaussianRegression(xtrain, ytrain, xtest, betainv, s)

k = [];
lenTrain = length(xtrain);
lenTest = length(xtest);

for i = 1:1:lenTrain
    temp = [];
    for j = 1:1:lenTrain
        temp = [temp kernel(xtrain(i), xtrain(j), s)];
    end
    k = [k; temp];
end
    
mean=[]; 
for p =1:1:lenTest
     temp=[];
     for q=1:1:lenTrain
         temp = [temp kernel(xtest(p), xtrain(q), s)];
     end
     mean = [mean (temp * pinv((k+eye(lenTrain) * betainv)) * ytrain')];
end

var=[];
for u =1:1:lenTest
     temp1=[];
     temp2 = [];
     for v=1:1:lenTrain
         temp1 = [temp1 kernel(xtest(u), xtrain(v), s)];
         temp2 = [temp2 kernel(xtest(u), xtrain(v), s)];
     end
     var =[var (kernel(xtest(u), xtest(u), s) + betainv - temp1 * pinv((k + eye(lenTrain) * betainv)) * temp2')];
end
