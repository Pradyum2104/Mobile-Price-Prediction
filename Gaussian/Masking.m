function Mask=Masking(n,d,m_p)
% n is the number of training samples e.g. 2000
% d is the number of features e.g. 8
% m_p is the missing percentage e.g. 70%
Mask=ones(n*d,1);
missing_values=(m_p/100)*n*d;
n_m_v=floor(missing_values);   % No of missing values
temp=1:1:n*d;
delete=datasample(temp,n_m_v,'Replace',false);
Mask(delete)=0;
Mask= reshape(Mask,[n,d]);

