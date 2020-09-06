function  [weights,Accuracy]=SVM(missing_percentage, impute_type)
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

t = templateSVM('Standardize',true,'KernelFunction','gaussian');
weights = fitcecoc(X_norm,Y,'Learners',t,'FitPosterior',true,'ClassNames',[0,1,2,3]);
[X_norm, ~, ~] = featureNormalize(X);
pred = predict(weights, X_norm);
Accuracy=mean(double(pred == Y)) * 100;
