function [X_norm, mu, sigma] = featureNormalize(X)
%Normalize the features in X 
X_norm = X;
mu=mean(X);
sigma=std(X);

for i=1:size(X, 2)
    non_zero=nnz(X(:,i))/size(X, 1);
    if mu(i)==non_zero
        mu(i)=0;
        sigma(i)=1;
    end
end

for i=1:size(X, 1)
    X_norm(i,:)=(X_norm(i,:)-mu)./sigma;
end
end