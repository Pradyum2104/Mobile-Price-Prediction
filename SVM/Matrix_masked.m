function X_masked=Matrix_masked(X,Mask,masked_value)

% Creates Training samples with missing values
X_masked=X;
[r,c] = find(Mask==0);
for i=1:length(r)
    X_masked(r(i),c(i))=masked_value;
end