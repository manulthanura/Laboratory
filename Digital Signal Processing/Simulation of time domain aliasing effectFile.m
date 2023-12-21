close all
clear all
clc


t_value = 0:0.001:0.1;  % Define the domain of time (t)      
s_t = 0.7*sin(2*pi*50*t_value)+sin(2*pi*120*t_value); % Generate a signal with frequencies 50 Hz and 120 Hz
% Plot the original time domain signal 
subplot(4,1,1)
plot(t_value,s_t);
hold on;
stem(t_value,s_t);   
title('Source Signal');
xlabel('t');
ylabel('s(t)');
legend('s(t)','s(n)')
% Selection of FFT size 
LengthOftheSequence = length(s_t); 
FFTSize = pow2(nextpow2(LengthOftheSequence));
S_Omega = fft(s_t,FFTSize);
Magnitude_S = abs(S_Omega).^2;
f_values = (0:length(S_Omega)-1)*1000/length(S_Omega);

% Regeneate original signal s(t) using adequate FFT size N=L -- length of
% the s(t)
InverseS_Omega = ifft(S_Omega,FFTSize);
tt_values = (0:length(S_Omega)-1)*0.001;
subplot(4,1,2)
stem(tt_values,InverseS_Omega); 
hold on;
stem(t_value,s_t); 
title('Reconstruction of s(n) using 128-IFFT');
xlabel('t');
ylabel('s(t)');
xlim([0 t_value(end)]);
legend('N=128', 's(t)');

NewFFTSize = 32; % Select FFT size less than the previous N=64<L 
InverseSS_Omega = ifft(S_Omega,NewFFTSize);
ttt_values = (0:length(InverseSS_Omega)-1)*0.001*4;

subplot(4,1,3)
stem(ttt_values,InverseSS_Omega); 
hold on;
stem(t_value,s_t); 
title('Reconstruction of s(n) using 64-IFFT');
xlabel('t');
ylabel('s(t)');
xlim([0 t_value(end)]);
legend('N=64', 's(n)');
ylim([-3 3]);

subplot(4,1,4)
plot(ttt_values,InverseSS_Omega); 
hold on;
plot(t_value,s_t); 
title('Reconstruction of s(t) using 64-IFFT');
xlabel('t');
ylabel('s(t)');
xlim([0 t_value(end)]);
legend('N=64', 's(t)');
ylim([-3 3]);