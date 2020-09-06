function [weights] = train_multivariate(Imputed_X, Y, num_labels)
%TRAIN_MULTIVARIATE Trains a Gaussian assuming features are corelated

weights = cell(num_labels, 2);

for i=1:num_labels
    c = i - 1;
    weights{i, 1} = mean(Imputed_X(Y == c, :));
    weights{i, 2} = cov(Imputed_X(Y == c, :));
end
end

