close all;
clear;

% Parameters for the Rician Channel
B = 3500000;
FS = 7/6*B; % Sampling frequency
FD = 0.4; % Doppler shift in Hz
K = 1; % Rician K-factor
TAU = [0 0.5e-6 1e-6]; % Path delays in seconds
PDB = [1 0 0]; 

% Create the Rician Channel object
chan = comm.RicianChannel('SampleRate', FS,'PathDelays', TAU,'AveragePathGains', PDB,'KFactor', K,'MaximumDopplerShift', FD);

% Generate OFDM signal
X = ones(1, 256); % Input symbols
ifft_signal = ifft(X); % Time-domain signal
cyclic_prefix = ifft_signal(end-63:end); % Last 64 samples as cyclic prefix
input_signal = [cyclic_prefix, ifft_signal]; % Signal with cyclic prefix

% Pass through the Rician Channel
output_signal = chan(input_signal')';

% Remove cyclic prefix
output_signal_no_cp = output_signal(65:end);


% FFT to demodulate
Y = fft(output_signal_no_cp);

% Compute channel transfer function
channel_transfer_function = Y ./ X;

% Plot channel transfer function
figure;



plot(abs(channel_transfer_function));
title('Channel Transfer Function');
xlabel('Subcarrier Index');
ylabel('Magnitude');
grid on;




