function [b] = trilat( X, d )
% X: matrix with 2d landmark/feature coordinates
% d: distance estimation vector
warning('off','all');
%p = [];
tbl = table(X, d);

d = d.^2;
weights = d.^(-1);  %inversly proportional

weights = transpose(weights);
beta0 = [5, 5];
modelfun = @(b,X)(abs(b(1)-X(:,1)).^2+abs(b(2)-X(:,2)).^2).^(1/2);
mdl = fitnlm(tbl,modelfun,beta0,'Weights',weights);
b = mdl.Coefficients{1:2,{'Estimate'}};
warning('on','all');