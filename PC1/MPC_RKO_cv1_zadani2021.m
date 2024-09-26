%==========================================================================
%==========================================================================
%Cviceni 1: Zaklady prace v prostredi MATLAB
%==========================================================================
%==========================================================================
close all;clear all
%==========================================================================
%Ukol 1
%==========================================================================
%Natice A=[1 2 3; 4 5 6; 7 8 9; 10 11 12];
%Vypi�te v�echny ��dky, pro kter� plat�, �e sou�et v�ech prvk� dan�ho ��dku 
%je sud� ��slo.
%Matici A p�eve�te na vektor odpov�daj�c� d�lky ve tvaru: 
%   [1.��dek 2. ��dek 3.��dek 4. ��dek]. Vyu�ijte funkci reshape
%Vytvo�te matici B, kter� bude m�t stejn� po�et ��dk� i sloupc� jako
%   matice A. Matice B bude obsahovat n�hodn� prvky 1 nebo -1
%--------------------------------------------------------------------------

%Zadani vstupni matice
A=[1 2 3; 4 5 6; 7 8 9; 10 11 12];

%==========================================================================
%Ukol 2
%==========================================================================
%2. Sign�l s(t) = cos(2*pi*fc*t)
%Vykreslete 10 period �asov�ho pr�b�hu tohoto sign�lu. Kmito�et nosn� nech�
%  je roven 100 Hz, vzorkovac� kmito�et 1kHz. Pou�ijte jak funkce plot, 
%  tak stem.
%Vykreslete odhad spektra tohoto sign�lu. Pou�ijte jak postup pomoc� FFT, 
%  tak vestav�nou funkci pwelch. Osy nen� t�eba popisovat.
%--------------------------------------------------------------------------




%==========================================================================
%Ukol 3
%==========================================================================
%3. Pomoc� funkce load na�t�te dodan� soubor qpsk.mat
%Zobrazte tento sign�l v komplexn� rovin�
%Zobrazte prvn�ch 100 vzork� re�ln� ��sti tohoto sign�lu
%Zobrazte diagram oka pro re�lnou ��st tohoto sign�lu (p�edpokl�dejte 
%  10 vzork� na 1 symbol). Nepou��vejte vestav�nou funkci eyediagram.
%--------------------------------------------------------------------------
load qpsk
figure;
plot(qpsk) % vykresleni v koplexni rovine




