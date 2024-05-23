% Monte Carlo Integration
% Vectorized Version
clc, clearvars, close all, format compact

% This method optimizes performance over simplicity
% Dots are not colored red and blue

tic
f = @(x) 10 + 5*x.^3-x.^2;

% Parameters
N = 10000;
a = 2; b = 4;
M = 1.4*max(f(linspace(a,b)));

% Generate Random Points
x = rand(1,N)*(b-a) + a;
y_val = rand(1,N)*M;

% Perform Integral Calculation
fx = f(x);
PercentUnderCurve = sum(y_val < fx) / N;
Monte_Integral = PercentUnderCurve * M * (b-a)
Matlab_Integral = integral(f,a,b)
PercentError = abs(Monte_Integral-Matlab_Integral)/Matlab_Integral*100
toc

% Plot
plot(x,y_val','.')
hold on
plot(x,fx,'.')