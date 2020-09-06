function  [weights,Accuracy]=logistic_regression(missing_percentage, impute_type)
addpath('../');
m_p=missing_percentage;
masked_value=-100;
num_labels=4;

data_set=xlsread('../train.csv');
X=data_set(:,1:end-1);
Y=data_set(:,end);
[n,d]=size(X);

Mask=Masking(n,d,m_p);
X_masked=Matrix_masked(X,Mask,masked_value);
if (strcmp(impute_type, 'mean'))
    Imputed_X=mean_imputation(X_masked,masked_value);
else
    [Imputed_X, ~] = IST_MC_modified(X,Mask,zeros(n,d),1e-5);
end

[X_norm, ~, ~] = featureNormalize(Imputed_X);
lambda = 0.2;
[weights] = oneVsAll(X_norm, Y, num_labels, lambda);

[X_norm, ~, ~] = featureNormalize(X);
pred = predictOneVsAll(weights, X_norm);
Accuracy=mean(double(pred == Y)) * 100;
%fprintf('\nTraining Set Accuracy: %f\n', Accuracy);
