function p = predictOneVsAll(all_theta, X)
%PREDICT Predict the label for a trained one-vs-all classifier.

m = size(X,1);
X = [ones(m, 1) X];     

[~,p]=(max(all_theta*X'));
p=p-1;  % There is class 0
p=p';
end
