clear; 
close all;
%% parametry vysilani
M = 64; % QAM-64
N = 50; % Pocet nosnych

%% Vysilac
M1 = randsrc(M, N, [-3 -1 1 3]) + 1j*randsrc(M, N, [-3 -1 1 3]);
M2 = [M1(1:M/2, :); zeros(M, N); M1(M/2+1:end, :)];
M3 = ifft(M2);

s = reshape(M3, 1, 2*M*N); % Takto uz je signal pripraven k odeslani
pwelch(s); % Spektrum

figure(1);
plot(abs(s));
title('Abs of Transmitted Signal');
figure(2);
histogram(abs(s));
title('Histogram of Abs');
figure(3);
histogram(real(s)); % chova se jako bily sum (gaussovske rozdeleni)
title('Histogram of Real Part');
figure(4);
histogram(imag(s)); % chova se jako bily sum (gaussovske rozdeleni)
title('Histogram of Imaginary Part');
figure(5);
histogram(angle(s)); % Faze
title('Histogram of Phase');

%% Kanal
SNR = 20;
%r = awgn(s,SNR,"measured"); %pridani sumu
r = saleh(s); %ukazuje vliv nelinearity zesilovace → pootoceni celeho konstelaku, protoze jde o OFDM s QAM (kdyby pouze QAM, tak se to bude tykat pouze krajinich podu)

%% Prijimac
s_received = reshape(r, 2*M, N);
M4 = fft(s_received); % FFT

M5 = [M4(1:M/2, :); M4(M + 1:M + M/2, :)];% odstraneni pridanych nul(objevili by se jako bod v konstelacnim diagramu [0,0]

% Recover the transmitted QAM symbols
recovered_symbols = M5(1:M/2, :) + j * M5(M/2 + 1:end, :);%Obnoveni puvodnich QAM symbolu

% Plot constellation diagram of received symbols and original symbols
figure(6);
scatter(real(M1(:)), imag(M1(:)), 'x');
hold on;
scatter(real(recovered_symbols(:)), imag(recovered_symbols(:)), 'r');
title('Constellation Diagram of Original and Received Symbols');
legend('Original Symbols', 'Received Symbols');
grid on;
hold off;

%% Domaci ukol
% Zmena modulace na QPSK
% pridani sumu v cyklu od 0 do 10 dB
% pocitani symbolove chybovosti pri OFDM a vykresleni krivky
