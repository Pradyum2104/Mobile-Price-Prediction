function preds = test_multivariate(X, weights)
%TEST_MULTIVARIATE use the trained weights to predict
num_labels = size(weights, 1);
N = size(X, 1);
pdfs = zeros(N, num_labels);
for i=1:num_labels
    c = i - 1;
    pdfs(:, i) = mvnpdf(X, weights{i, 1}, weights{i, 2});
end
[~, preds] = max(pdfs, [], 2);
preds = preds - 1;
end

