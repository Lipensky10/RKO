clear all
close all
clc

% Vytvoření objektu Ricianova kanálu s prvním nastavením
ricianchan = comm.RicianChannel( ...
    'SampleRate',((7*3.5*10^6)/6), ... % Vzorkovací frekvence (7/6 šířky pásma)
    'PathDelays',[0.0 0.5 1.0]*1e-6, ... % Zpoždění jednotlivých cest kanálu (v sekundách)
    'AveragePathGains',[0 -5 -10], ... % Průměrné zisky jednotlivých cest (v dB)
    'KFactor',1, ... % K-faktor (relativní síla přímé cesty vůči scatterovaným cestám)
    'DirectPathDopplerShift',0.4, ... % Dopplerovský posun přímé cesty
    'MaximumDopplerShift',0.4, ... % Maximální Dopplerův posun
    'RandomStream','mt19937ar with seed', ... % Nastavení generátoru náhodných čísel
    'Seed',73, ... % Semeno pro generátor náhodných čísel
    'PathGainsOutputPort',true ...
    ); 
% Vytvoření objektu pro druhý Ricianův kanál s jiným nastavením zpoždění cest
ricianchan2 = comm.RicianChannel( ...
    'SampleRate',((7*3.5*10^6)/6), ...
    'PathDelays',[0.0 0.5 2.0]*1e-6, ... % Zpoždění jednotlivých cest kanálu (v sekundách)
    'AveragePathGains',[0 -5 -10], ...
    'KFactor',1, ...
    'DirectPathDopplerShift',0.4, ...
    'MaximumDopplerShift',0.4, ...
    'RandomStream','mt19937ar with seed', ...
    'Seed',73, ...
    'PathGainsOutputPort',true);

% Vytvoření objektu pro třetí Ricianův kanál s jiným nastavením zisku pro třetí cestu
ricianchan3 = comm.RicianChannel( ...
    'SampleRate',((7*3.5*10^6)/6), ...
    'PathDelays',[0.0 0.5 1.0]*1e-6, ...
    'AveragePathGains',[0 0 -10], ... % Zisky jednotlivých cest se změnou pro třetí cestu
    'KFactor',1, ...
    'DirectPathDopplerShift',0.4, ...
    'MaximumDopplerShift',0.4, ...
    'RandomStream','mt19937ar with seed', ...
    'Seed',73, ...
    'PathGainsOutputPort',true);

% Vytvoření vstupního signálu (256 subnosných) - všechny jsou 1 (jednoduchý testovací signál)
X = ones(1,256); 

% Výpočet inverzního Fourierova transformace (IFFT) pro časovou doménu signálu
Xt = ifft(X); 

% Přidání cyklického prefixu (64 vzorky) k signálu pro OFDM
Xpref = [Xt(1:64) Xt]; 

% Transpozice signálu do sloupce pro kanál
Xvys = transpose(Xpref);

% Provedení simulace přenosu signálu přes první Ricianův kanál
Y = ricianchan(Xvys); 

% Provedení simulace přenosu signálu přes druhý Ricianův kanál
Y2 = ricianchan2(Xvys);

% Provedení simulace přenosu signálu přes třetí Ricianův kanál
Y3 = ricianchan3(Xvys);

% Odstranění cyklického prefixu z přijatého signálu (první 64 vzorky)
Yrec = Y(65:end); 

% Výpočet FFT přijatého signálu (ve frekvenční doméně)
Ybin = fft(Yrec);

% Opakování pro druhý kanál
Yrec2 = Y2(65:end); 
Ybin2 = fft(Yrec2);

% Opakování pro třetí kanál
Yrec3 = Y3(65:end); 
Ybin3 = fft(Yrec3);

% Grafování přenosové funkce kanálu - 20*log10(abs(...)) pro zobrazení v dB
plot(20*log10(abs(Ybin/Xt')),'b-') % Modrá křivka pro první kanál
grid on
hold on

plot(20*log10(abs(Ybin2/Xt')),'r--') % Červená přerušovaná křivka pro druhý kanál
hold on

plot(20*log10(abs(Ybin3/Xt')),'m--') % Fialová přerušovaná křivka pro třetí kanál

