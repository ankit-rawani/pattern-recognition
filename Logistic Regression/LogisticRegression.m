clear;
close all;

load('BetterDataset.mat');

t = [];
n = 5; % Number of classes
m = 3; % Number of terms in Basis fn
l = 0.02; % Learning rate
epochs = 1;

disp("Initializing...");
for i=1:length(y_train)
    tmp = zeros(1, n);
    tmp(y_train(i)) = 1;
    t = [t; tmp];
end
disp("Done");

w = zeros(n, m);

disp("Training...");
for k=1:epochs
    disp("Epoch "+k);
    for j=1:n
        tmp = zeros(1, m);
        for i=1:length(x_train)
            tmp = tmp + (Output(j, w, x_train(i, :), m, n) - t(i, j)) .* Basis(x_train(i, :), m);
        end
        w(j, :) = w(j, :) + l .* tmp;
    end
    disp(w);
end
disp("Done");

y_predict = [];

for i=1:length(x_test)
    tmp = [];
    for j=1:n
        tmp = [tmp Output(j, w, x_test(i, :), m, n)];
    end
    [~, index] = max(tmp);
    y_predict = [y_predict index];
end
