% MonteCarlo - Integral Calculation
clc, clearvars, close all, format compact

% Equation to integrate over. Integral of this from a to b.
%f = @(x) exp(x).*x.^2.*sqrt(exp(x));
f = @(x) exp(-x);

% Parameters
N = 10000; % number of points to generate randomly
a = 0; % integral lower x limit - manual
b = 1; % integral upper x limit - manual
M = 1.4*max(f(linspace(a,b))); % upper y bound = c*max y_value from equation

% Generate Dots
for i = 1:N
    % generate random pt
    x_val = rand(1)*(b-a) + a;
    y_val = rand(1)*M;
    % compare random against the curve
    fx = f(x_val);
    % logic statement
    if y_val < fx % under the curve - blue
        under(i,1) = x_val;
        under(i,2) = y_val;
    else % above the curve - red
        above(i,1) = x_val;
        above(i,2) = y_val;
    end
end
% Filter out zeros
under2(:,1) = nonzeros(under(:,1));
under2(:,2) = nonzeros(under(:,2));
above2(:,1) = nonzeros(above(:,1));
above2(:,2) = nonzeros(above(:,2));

% Plotting
plot(above2(:,1),above2(:,2),'ro','MarkerFaceColor','r')
hold on
plot(under2(:,1),under2(:,2),'bo','MarkerFaceColor','b')
title('Monte Carlo Integration'), xlabel('x'), ylabel('y')
legend('above','under')
% Integral Calcs
MonteCarlo_Integral = length(under2) / N * (M*(b-a))
MATLAB_Integral = integral(f,a,b)
PercentError = abs(MATLAB_Integral - MonteCarlo_Integral)/MATLAB_Integral * 100