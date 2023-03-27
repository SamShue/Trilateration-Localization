function [x_n] = multilateration2d( X, d )
% X: matrix with 2d landmark/feature coordinates
% d: distance estimation vector

% Function we are minimizing:
% f(x, y) = dn - sqrt((xn - x)^2 + (yn - y)^2)
% where n is the number of beacons and measurements

% modify funciton to use squared distance to make derivative easier
% f(x, y) = dn^2 - ((xn - x)^2 + (yn - y)^2)
% find Jacobian of function
% J = [2*(x0 - x), 2*(y0 - y);
%      2*(x1 - x), 2*(y1 - y);
%      ...
%      2*(xn - x), 2*(yn - y)];

x_n = [0,0];

for ii = 1:10
    b = f(X, d, x_n)
    F = computeJacobian(X, x_n);

    x_n1 = x_n - F\b;

    x_n = x_n1;

end

end


function [x_n1] = f(X, d, n)
    x_n1 = d.^2 - ((X(:,1) - n(1)).^2 + (X(:,2) - n(2)).^2)
end

function [F] = computeJacobian(X, n)
    F = [2*(X(:,1) - n(1)), 2*X(:,2) - n(2)];
end

% Inversion of non-square matrix:
% https://math.stackexchange.com/questions/1335693/invertible-matrix-of-non-square-matrix