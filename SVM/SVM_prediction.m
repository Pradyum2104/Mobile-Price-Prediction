function pred = SVM_prediction(X,missing_percentage)
[weights,~]=SVM(missing_percentage);
[X_norm, ~, ~] = featureNormalize(X);
pred = predict(weights, X_norm);
end
