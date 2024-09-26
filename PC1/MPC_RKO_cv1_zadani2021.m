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
%Vypište všechny øádky, pro které platí, e souèet všech prvkù daného øádku 
%je sudé èíslo.
%Matici A pøeveïte na vektor odpovídající délky ve tvaru: 
%   [1.øádek 2. øádek 3.øádek 4. øádek]. Vyuijte funkci reshape
%Vytvoøte matici B, která bude mít stejnı poèet øádkù i sloupcù jako
%   matice A. Matice B bude obsahovat náhodné prvky 1 nebo -1
%--------------------------------------------------------------------------

%Zadani vstupni matice
A=[1 2 3; 4 5 6; 7 8 9; 10 11 12];

%==========================================================================
%Ukol 2
%==========================================================================
%2. Signál s(t) = cos(2*pi*fc*t)
%Vykreslete 10 period èasového prùbìhu tohoto signálu. Kmitoèet nosné nech
%  je roven 100 Hz, vzorkovací kmitoèet 1kHz. Pouijte jak funkce plot, 
%  tak stem.
%Vykreslete odhad spektra tohoto signálu. Pouijte jak postup pomocí FFT, 
%  tak vestavìnou funkci pwelch. Osy není tøeba popisovat.
%--------------------------------------------------------------------------




%==========================================================================
%Ukol 3
%==========================================================================
%3. Pomocí funkce load naètìte dodanı soubor qpsk.mat
%Zobrazte tento signál v komplexní rovinì
%Zobrazte prvních 100 vzorkù reálné èásti tohoto signálu
%Zobrazte diagram oka pro reálnou èást tohoto signálu (pøedpokládejte 
%  10 vzorkù na 1 symbol). Nepouívejte vestavìnou funkci eyediagram.
%--------------------------------------------------------------------------
load qpsk
figure;
plot(qpsk) % vykresleni v koplexni rovine




