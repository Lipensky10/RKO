clear all; close all; clc

fs = 10e3;
fd = 1e3;

SamplesPerSymbol = fs/fd;
nSymbol = 1000;

%x = linspace(-1,1,4); %% udela 16 QAM, protože udela 4 symboly v kaydem kvadrantu

sym = randsrc(1,nSymbol, [-1 1]) + j.*randsrc(1, nSymbol, [-1 1]); % [-1 1] udela 4 QAM
scatterplot(sym)

figure; plot(sym, 'ro')

%filter design
beta  = 0.2;
h = rcosdesign(beta, 10, SamplesPerSymbol,"sqrt"); % 10 = delka odezvy

figure; impz(h)

%Get I and Q;
symI = real(sym);
symQ = imag(sym);

symI_up = upsample(symI,SamplesPerSymbol);
symQ_up = upsample(symQ,SamplesPerSymbol);

symI_filt = filter(h,1,symI_up);
symQ_filt = filter(h,1,symQ_up);

s = symI_filt + j.*symQ_filt;

figure;
pwelch(s) % spektrum signalu před vstupem do kanalu

figure; plot(s, '.')

eyediagram(s,SamplesPerSymbol)
sig_awgn = awgn(s,20, 'measured'); % yavedeni sumu  a nastaveni jeho odstupu od signalu

figure; plot(s(((length(h)-1)/2+1):SamplesPerSymbol:end),'ro')

%Receiver

sRecvI = real(s);
sRecvQ = real(s);

filteredRecvI = filter(h,1,sRecvI);
filteredRecvQ = filter(h,1,sRecvQ);

sRecv = filteredRecvI + j.* filteredRecvQ;

figure()
plot(sRecv)
hold on
plot(sRecv(2*(length(h)-1)/2+1:SamplesPerSymbol:end), 'r.')