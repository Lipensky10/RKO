%==========================================================================
%==========================================================================
%Cviceni 2: Komplexni obalka
%==========================================================================
%==========================================================================
close all; clear all;
%==========================================================================
% help: fft, shiftfft, hilbert, real, imag
%==========================================================================
%==========================================================================
%Ukol 1
%==========================================================================
% Nejprve definujte parametry simulace - vzorkovací kmitoèet a periodu, vektor
% èasu (v rozsahu -2 s. až 2 s.), kmitoèet nosné.
% 1.Vypoètìte vzorky pùvodního signálu s(t) a vykreslete (figure,plot) 
% závislost s(t) na èase.
% 2. Pomocí Fourierovy transformace vypoètìte modulové spektrum signálu. 
% Použijte funkce fft,abs. Nezapomeòte správnì ocejchovat kmitoètovou osu. 
% Využijte i funkci fftshift.
%-------------------------------------------
%ukol 1, 1. cast: zobrazit signal
%-------------------------------------------
fc=100;
fs=1000; %Hz ...we selected 1000
Ts=1/fs; %seconds

t - -2:Ts:2;

s = sin(2*pi*fc*t);
s = (1+ 0.5*cos(2*pi*5*t)*cos(2*pi*100*t));

plot(t,s);

%-------------------------------------------
%ukol 1, 2. cast:odhad jeho moduloveho spektra 
%-------------------------------------------
%S = abs(fft(s));
%S = fftshift(S);


%==========================================================================
%Ukol 2
%==========================================================================
%1. Pomocí funkce hilbert vypoètìte analytický signál. Pozor - tato funkce nevrací
%Hilbertovu transformaci ale pøímo analytický signál (ovìøte pomocí help hilbert).
%Proveïte výpoèet komplexní obálky násobením e{?j2fct}.
%2. Zobrazte reálnou a imaginární èást komplexní obálky a také její absolutní
%hodnotu (obálku). Vypoètìte spektrum komplexní obálky a zobrazte ho.
%-------------------------------------------
%ukol 2, 1. cast: naleznete komplexni obalku
%-------------------------------------------

%-------------------------------------------
%ukol 2, 2. cast: zobrazeni
%-------------------------------------------
%==========================================================================
%Ukol 3
%==========================================================================
% Z reálné a imaginární složky komplexní obálky vytvoøte pùvodní signál 
% podle obrázku 2.2. Zjistìte odchylku mezi takto získaným signálem a 
% pùvodním signálem. Jaké maximální hodnoty nabývá?
%-------------------------------------------
%ukol 3: overeni moznosti zpetneho ziskani pasm. signalu...
%-------------------------------------------
