function Imputed_X=mean_imputation(X,masked_value)
% Imputes missing value with mean imputation

Imputed_X=X;
total=sum(X)+(size(X,1)-sum(X~=masked_value))*(-1*masked_value);
mean=total./sum(X~=masked_value);
[r,c] = find(X==masked_value);
for i=1:length(r)
    Imputed_X(r(i),c(i))=mean(c(i));
end
