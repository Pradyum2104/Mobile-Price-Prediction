function pred =lg_prediction(X,missing_percentage)

[weights,~]=logistic_regression(missing_percentage);
[X_norm, ~, ~] = featureNormalize(X);
pred = predictOneVsAll(weights, X_norm);
end