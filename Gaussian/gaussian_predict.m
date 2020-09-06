function pred =gaussian_predict(X, missing_percentage)

[weights,~]=gaussian_classifier(missing_percentage);
pred = test_multivariate(X, weights);
end