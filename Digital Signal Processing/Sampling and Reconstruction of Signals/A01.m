% Parameters
t = -0.01:0.00001:0.01; % Chosen time window
xa = 3*cos(2000*pi*t) + 5*sin(6000*pi*t) + 10*cos(12000*pi*t);

% Plotting the analog signal
figure;
plot(t, xa);
title('Analog Signal xa(t)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

Fs_Nyquist = 2 * 12000;
disp(['Nyquist Rate: ' num2str(Fs_Nyquist) ' Hz']);

Fs = 24000; % Nyquist sampling rate
n = -0.01*Fs:1:0.01*Fs; % discrete time vector

xd = 3*cos(2000*pi/Fs*n) + 5*sin(6000*pi/Fs*n) + 10*cos(12000*pi/Fs*n);

% Plotting the discrete signal
figure;
stem(n, xd);
title('Discrete Signal xd[n] (Nyquist Sampling)');
xlabel('Discrete Time (n)');
ylabel('Amplitude');
grid on;

Fs_new = 5000; % New sampling rate
n_new = -0.01*Fs_new:1:0.01*Fs_new; % discrete time vector for new sampling rate

xd_new = 3*cos(2000*pi/Fs_new*n_new) + 5*sin(6000*pi/Fs_new*n_new) + 10*cos(12000*pi/Fs_new*n_new);

% Plotting the discrete signal for the new sampling rate
figure;
stem(n_new, xd_new);
title('Discrete Signal xd_new[n] (Sampling at Fs = 5000)');
xlabel('Discrete Time (n)');
ylabel('Amplitude');
grid on;

ya_t = interp1(n_new, xd_new, t, 'spline'); % Ideal interpolation

% Plotting the reconstructed analog signal
figure;
plot(t, ya_t);
title('Reconstructed Analog Signal ya(t) from Samples');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plotting the original analog signal and the reconstructed signal
figure;
plot(t, xa, 'b', t, ya_t, 'r--');
title('Original Analog Signal vs Reconstructed Signal');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original Signal', 'Reconstructed Signal');
grid on;

