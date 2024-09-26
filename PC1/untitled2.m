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
%Vypište všechny øádky, pro které platí, že souèet všech prvkù daného øádku 
%je sudé èíslo.
%Matici A pøeveïte na vektor odpovídající délky ve tvaru: 
%   [1.øádek 2. øádek 3.øádek 4. øádek]. Využijte funkci reshape
%Vytvoøte matici B, která bude mít stejný poèet øádkù i sloupcù jako
%   matice A. Matice B bude obsahovat náhodné prvky 1 nebo -1
%--------------------------------------------------------------------------

%Zadani vstupni matice
A=[1 2 3; 4 5 6; 7 8 9; 10 11 12];
S = height(A);
for i = 1:S
    if ~ (mod(sum(A(i,:)),2))
        disp(A(i,:));
    end
end
A_vek = reshape(A.',1, [])

X = randsrc(size(A,1), size(A,2))

        

%==========================================================================
%Ukol 2
%==========================================================================
%2. Signál s(t) = cos(2*pi*fc*t)
%Vykreslete 10 period èasového prùbìhu tohoto signálu. Kmitoèet nosné nech
%  je roven 100 Hz, vzorkovací kmitoèet 1kHz. Použijte jak funkce plot, 
%  tak stem.
%Vykreslete odhad spektra tohoto signálu. Použijte jak postup pomocí FFT, 
%  tak vestavìnou funkci pwelch. Osy není tøeba popisovat.
%--------------------------------------------------------------------------
fc = 100;
fs = 1000;
t = 0:1/fs:1/fc*10
s = cos(2*pi*fc*t);
f = 0:1:1000;

%Lepsi jak fft :)
figure; pwelch(s,[],[],[],fs,"twosided");
%figure; spektrum(fft(s))

figure(1)
plot(t,s)
hold on
stem(t,s)



%==========================================================================
%Ukol 3
%==========================================================================
%3. Pomocí funkce load naètìte dodaný soubor qpsk.mat
%Zobrazte tento signál v komplexní rovinì
%Zobrazte prvních 100 vzorkù reálné èásti tohoto signálu
%Zobrazte diagram oka pro reálnou èást tohoto signálu (pøedpokládejte 
%  10 vzorkù na 1 symbol). Nepoužívejte vestavìnou funkci eyediagram.
%--------------------------------------------------------------------------
%load qpsk
%figure;
%plot(qpsk) % vykresleni v koplexni rovine

load qpsk
figure;
plot(qpsk) % vykresleni v komplexni rovině

Q = real(qpsk);
figure;
plot(Q(1:100))

voko = reshape(Q(6:end-4),10,[]);

figure;
plot(real(voko))



