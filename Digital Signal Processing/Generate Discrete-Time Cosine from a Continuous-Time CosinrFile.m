% This MatLab script demonstrate the impact of the Sampling Frequency F_s
% when generating the discrete version of a continuous-time cosine signal

close all
clear all
clc

t = -1:0.0001:1; % Define the time window from -2 to +2 withe the step size of 0.0001
F = 2; % Frequncy of the continuous-time signal in Hz
A = 1.25; % Amplitude of the continuous-time signal
Cosine_wave = A*cos(2*pi*F*t); % generate a continuous-time signal
subplot(4,1,1)
plot(t,Cosine_wave)
title('Cintinuous-time Cosine Signal');
xlabel('t'); ylabel('x(t)');
F_s = [3, 5, 10]; % Select three different sampling freqncies 
for index = 1:length(F_s)
    f = F/F_s(index); % Evaluate normalized frequncy
    t_new = -1:1/F_s(index):1; % t values where the samples are picked n*T_s
    discrete_cosign = A*cos(2*pi*F*t_new);
    subplot(4,1,index+1)
    plot(t,Cosine_wave,'-.');
    hold on;
    stem(t_new,discrete_cosign);
    title(['Discrete-time Cosing for F_s=',num2str(F_s(index)),'Hz and f=', num2str(rats(f))]);
end