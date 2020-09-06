function Accuracy=main()
clc;
clear;

% impute_type = 'mean';
impute_type = 'SVD';
Accuracy=zeros(10,1);
missing_percentage=zeros(10,1);
for i=[4, 6]
    missing_percentage(i)=(i-1)*10;
    [~,Accuracy(i)]=SVM(missing_percentage(i), impute_type);
end

figure(1)
title('Accuracy V.S Missing Values(SVM)');
xlabel('Missing Percentage');
hold on
ylabel('Percentage Accuracy');
hold on
plot(missing_percentage,Accuracy,'-o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor',[1 .6 .6],'LineWidth',4);
hold on
saveas(gcf, sprintf('../figs/svm_%s.png', impute_type));