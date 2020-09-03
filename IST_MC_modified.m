function [X_imput, fval] = IST_MC_modified(X, M,x_initial,lambda)
% Matrix Completion via Iterated Soft Thresholding

% X data matrix
% M missing mask
% x_initial initialization
% lambda hyperparameter

%stopping criteriaX
% err = 1e-6;
tol = 1e-6;
%hyperparameter
sizeX = size(X);
X_imput = x_initial;
% maxiter = 10000;
maxiter = 2000;
lr = 0.001;
f_current = 0.5*norm((X-X_imput).*M,'fro')^2 + lambda*nuclear(X_imput);
fval = zeros(maxiter+1);
fval(1) = f_current;
for ins = 1:maxiter
        fprintf('Impute iter: %05d | %d\n', ins, maxiter);
        f_previous = f_current;
        x = X_imput + lr*((X-X_imput).*M); %smooth part gradient descent
        [U,S,V] = svd(reshape(x,sizeX),'econ'); %svd
        s = SoftTh(diag(S),lambda);
        S = diag(s);
        X_imput = U*S*V';        
        f_current =0.5*norm((X-X_imput).*M,'fro')^2 + lambda*nuclear(X_imput);
        fval(ins+1) = f_current;
        if norm(f_current-f_previous)/norm(f_current + f_previous)<tol
            break;
        end
end    

%     if norm(y-M(x,1))<err
%         break;
%     end
%     lambda = decfac*lambda;

    function  z = SoftTh(s,thld)
        z = sign(s).*max(0,abs(s)-thld); 
    end

    function norm_nuclr = nuclear(xx)
        [Ux , S_diag, Vx] = svd(xx);
        norm_nuclr = sum((diag(S_diag)));
    end
end
