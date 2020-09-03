close all
clc;
clear;
% rng(2)
n = 100;
d = 10;
X = randn(n,5)*randn(5,d); %create low rank data matrix, rank is 5
percent = 0.3; % percent of missing value
M = rand(n,d);
M = M>=0.3; %mask
[X_imput, fval] = IST_MC_modified(X,M,zeros(n,d),1e-5);
subplot(3,1,1)
imagesc(X_imput)
title('imputed matrix')
colorbar
subplot(3,1,2)
imagesc(X)
title('ground truth')
colorbar
subplot(3,1,3)
plot(fval)
title('Convergence')
norm((X_imput-X),'fro')^2/(n*d)