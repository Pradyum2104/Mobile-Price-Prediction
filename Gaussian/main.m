function Accuracy=main()
clc;
clear;

% impute_type = 'mean';
impute_type = 'SVD';
Accuracy=zeros(10,1);
missing_percentage=zeros(10,1);
for i=1:10
    missing_percentage(i)=(i-1)*10;
    [~,Accuracy(i)]=gaussian_classifier(missing_percentage(i), impute_type);
end

figure(1)
title('Accuracy V.S Missing Values(Gaussian)');
xlabel('Missing Percentage');
hold on
ylabel('Percentage Accuracy');
hold on
plot(missing_percentage,Accuracy,'-o','MarkerSize',5,'MarkerEdgeColor','red','MarkerFaceColor',[1 .6 .6],'LineWidth',4);
hold on
saveas(gcf, sprintf('../figs/gaussian_%s.png', impute_type));