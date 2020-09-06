function [X_norm, mu, sigma] = featureNormalize(X)
%Normalize the features in X 
mu=mean(X);
sigma=std(X);
X_norm = (X-mu)./sigma;
end