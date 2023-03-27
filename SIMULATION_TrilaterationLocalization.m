clc;
clear all;
close all;

% Create landmark positions (points with known positions)
L = [0,0; 0,5; 5,0; 5,5];
% Create point to be estimated and the true location of the point
p_e = [0,0];
p_gt = [3,4];

% Generate noisy distance measurements to each 
d = zeros(size(L,1),1);
for ii = 1:size(L,1)
    % get distance from current landmark to ground truth point
    d(ii) = sqrt((L(ii,1) - p_gt(1))^2 + (L(ii,2) - p_gt(2))^2);
    % add noise
    d(ii) = d(ii) + 0.5*randn(); 
end

% estimate point from distances and landmarks
% p_e = trilat(L,d);
p_e = multilateration2d(L,d);

% Plot Results
% Landmarks
hold on;
scatter(L(:,1), L(:,2), 'o', 'black');
% True position
scatter(p_gt(1), p_gt(2), 'x', 'blue');
% Estimated position
scatter(p_e(1), p_e(2), 'o', 'red');