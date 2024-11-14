close all;
clear;

% Parameters for the Rician Channel
B = 3500000;  % Bandwidth in Hz
FS = 7/6 * B; % Sampling frequency
FD = 0.4;     % Doppler shift in Hz
K = 6;         % Rician K-factor (increased to give stronger line-of-sight component)
TAU = [0 0.5e-6 1e-6];  % Path delays in seconds (multiple paths)
PDB = [0 0 -3];  % Path gains in dB (adjusted to give stronger main path)

% Create the Rician Channel object
chan = comm.RicianChannel('SampleRate', FS, ...
                          'PathDelays', TAU, ...
                          'AveragePathGains', PDB, ...
                          'KFactor', K, ...
                          'MaximumDopplerShift', FD);

% Generate OFDM signal
X = ones(1, 256); % Input symbols (simplified for testing)
ifft_signal = ifft(X); % Time-domain signal (IFFT)
cyclic_prefix = ifft_signal(end-63:end); % Last 64 samples as cyclic prefix
input_signal = [cyclic_prefix, ifft_signal]; % Signal with cyclic prefix

% Pass through the Rician Channel
output_signal = chan(input_signal')'; % Channel output (row vector)

% Remove cyclic prefix
output_signal_no_cp = output_signal(65:end);  % Remove first 64 samples (cyclic prefix)

% FFT to demodulate
Y = fft(output_signal_no_cp);  % Perform FFT on the received signal

% Compute the channel transfer function in the frequency domain
X_freq = fft(ifft_signal);  % FFT of the transmitted signal (without cyclic prefix)
channel_transfer_function = Y ./ X_freq;  % Channel transfer function in frequency domain

% Plot channel transfer function
figure;
plot(abs(channel_transfer_function)); % Plot magnitude of the transfer function
title('Magnitude of Channel Transfer Function');
xlabel('Subcarrier Index');
ylabel('Magnitude');
grid on;
