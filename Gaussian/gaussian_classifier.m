function  [weights,Accuracy]=gaussian_classifier(missing_percentage, impute_type)
addpath('../');
m_p=missing_percentage;
masked_value=-100;
num_labels=4;

data_set=readtable('../train.csv');
data_set = table2array(data_set);
X=data_set(:,1:end-1);
Y=data_set(:,end);
[n,d]=size(X);

Mask=Masking(n,d,m_p);
X_masked=Matrix_masked(X,Mask,masked_value);
if (strcmp(impute_type, 'mean'))
    Imputed_X=mean_imputation(X_masked, Mask);
else
    [Imputed_X, ~] = IST_MC_modified(X,Mask,zeros(n,d),1e-5);
end
    
[Imputed_X, ~, ~] = featureNormalize(Imputed_X);
[weights] = train_multivariate(Imputed_X, Y, num_labels);

[X, ~, ~] = featureNormalize(X);
pred = test_multivariate(X, weights);
Accuracy=mean(double(pred == Y)) * 100;



