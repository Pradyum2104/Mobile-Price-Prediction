function Imputed_X=mean_imputation(X_masked, Mask)
% Imputes missing value with mean imputation

Imputed_X=X_masked;
d = size(X_masked, 2);
for i=1:d
    ave = mean(X_masked(Mask(:, i) == 1, i));
    Imputed_X(Mask(:, i) == 0, i) = ave;
end