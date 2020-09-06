function X_masked=Matrix_masked(X,Mask,masked_value)

% Creates Training samples with missing values
X_masked=X;
X_masked(Mask==0) = masked_value;
end