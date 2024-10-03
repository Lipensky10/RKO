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
% Nejprve definujte parametry simulace - vzorkovac� kmito�et a periodu, vektor
% �asu (v rozsahu -2 s. a� 2 s.), kmito�et nosn�.
% 1.Vypo�t�te vzorky p�vodn�ho sign�lu s(t) a vykreslete (figure,plot) 
% z�vislost s(t) na �ase.
% 2. Pomoc� Fourierovy transformace vypo�t�te modulov� spektrum sign�lu. 
% Pou�ijte funkce fft,abs. Nezapome�te spr�vn� ocejchovat kmito�tovou osu. 
% Vyu�ijte i funkci fftshift.
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
%1. Pomoc� funkce hilbert vypo�t�te analytick� sign�l. Pozor - tato funkce nevrac�
%Hilbertovu transformaci ale p��mo analytick� sign�l (ov��te pomoc� help hilbert).
%Prove�te v�po�et komplexn� ob�lky n�soben�m e{?j2fct}.
%2. Zobrazte re�lnou a imagin�rn� ��st komplexn� ob�lky a tak� jej� absolutn�
%hodnotu (ob�lku). Vypo�t�te spektrum komplexn� ob�lky a zobrazte ho.
%-------------------------------------------
%ukol 2, 1. cast: naleznete komplexni obalku
%-------------------------------------------

%-------------------------------------------
%ukol 2, 2. cast: zobrazeni
%-------------------------------------------
%==========================================================================
%Ukol 3
%==========================================================================
% Z re�ln� a imagin�rn� slo�ky komplexn� ob�lky vytvo�te p�vodn� sign�l 
% podle obr�zku 2.2. Zjist�te odchylku mezi takto z�skan�m sign�lem a 
% p�vodn�m sign�lem. Jak� maxim�ln� hodnoty nab�v�?
%-------------------------------------------
%ukol 3: overeni moznosti zpetneho ziskani pasm. signalu...
%-------------------------------------------
