

close all;
clear all;
clc;

% Nastaveni vstupnich parametru
EbN0db = 0:0.1:10; % jde o podil Eb/N0
EbN0 = 10.^(EbN0db ./ 10); % odlogaritmovani

% Teoreticka zavislost
BER = qfunc(sqrt(2*EbN0));

figure()
semilogy(EbN0db, BER)


% Ukol 2: Vygenerujte n�hodnou posloupnost prvk� 1 a -1 a zobrazte ji
Nbit = 1000000;
bity = randsrc(1, Nbit, [1 -1]);

scatterplot(bity)

% Ukol 3: Funkce pro v�po�et bitov� chybovosti BPSK sign�l� v AWGN kan�lu
BER_sim = zeros(1, length(EbN0db));

for i = 1:length(EbN0db)
    sigma = sqrt(1/(2*EbN0(i)));
    noise = sigma * randn(1, Nbit);
    r = bity + noise;
    det = sign(r);
    BER_sim(i) = sum(bity ~= det) / Nbit;
end

figure()
semilogy(EbN0db, BER, '-b', EbN0db, BER_sim, 'or')


