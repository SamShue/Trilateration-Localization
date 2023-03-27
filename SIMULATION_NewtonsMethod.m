clc; clear all; close all;

% sample points for plotting function
v = 1:0.1:4;

% number of iterations to run Newton's method for
NUM_ITER = 10;

% initial guess
x_n = 2;

for ii = 1:NUM_ITER
    % Apply newton's method
    x_n1 = x_n - f(x_n)/f_prime(x_n)

    % Visualize data
    clf; hold on;
    % Plot function
    plot(v', f(v));
    % Plot tangent line
    plot(v', f_prime(x_n)*(v' - x_n) + f(x_n), 'red');
    scatter(x_n, f(x_n), 'o', 'red');
    pause(1);

    % update "guess" with new x intercept
    x_n = x_n1;
end

% Function we are solving for x-intercept (f(x) = 0)
% f(x) = x^7 - 1000
function [y] = f(x)
    y = x.^7 - 1000;
end

% Linear approximation of f(x) (first derivative / tangent line)
% f'(x) = 7*x^6
function [y] = f_prime(x)
    y = 7.*x.^6;
end

% REFERENCES:
% Newton's Method Tutorial:
% https://calcworkshop.com/derivatives/newtons-method/
% Tangent Line Tutorial:
% https://gato-docs.its.txst.edu/slac/Subject/Math/Calculus/Findting-the-Equation-of-a-Tangent-Line/Finding#:~:text=1)%20Find%20the%20first%20derivative,equation%20for%20the%20tangent%20line.