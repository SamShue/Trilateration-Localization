clc;
clear all;
close all;

% https://calcworkshop.com/derivatives/newtons-method/

% plot function to be solved
v = -1:0.1:1;
plot(v', f(v));

% initial guess
x_n = 2;

for ii = 1:100
    x_n1 = x_n - f(x_n)/f_prime(x_n)
    x_n = x_n1;
end
    




function [y] = f(x)
    y = x.^7 - 1000;
end

function [y] = f_prime(x)
    y = 7.*x.^6;
end