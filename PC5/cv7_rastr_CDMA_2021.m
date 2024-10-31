%==========================================================================
%==========================================================================
%Cviceni 7: CDMA
%==========================================================================
%==========================================================================
close all;clear all
%==========================================================================
% help: hadamard, reshape, awgn, xcorr
%==========================================================================
%==========================================================================
%ukol 1
%--------------------------------------------------------------------------
%Vygenerujte matici Hadamardových posloupností (funkce hadamard) s cinitelem 
%rozprostreni (Spreading Factor, SF) 8. Jednotlive posloupnosti odpovidajici
%radkum, resp. sloupcum matice) vypiste a zaznamenejte. 
%Overte ortogonalitu dvou vybranych posloupnosti (nulovy skalarni soucin).
%==========================================================================
SF=64;%64;
SNR = -10;
Nbit= 1e3;
H=hadamard(SF)


%==========================================================================
%ukol 2
%--------------------------------------------------------------------------
%Vygenerujte nahodne biinarni bipolarni data (1, -1) pro jednoho uzivatele 
%o delce 100 bitu. Vyuzijte napriklad funkci randsrc.
%==========================================================================

bity1=randsrc(Nbit,1,[-1 1]);
bity2=randsrc(Nbit,1,[-1 1]);
bity3=randsrc(Nbit,1,[-1 1]);
bity4=randsrc(Nbit,1,[-1 1]);

%==========================================================================
%ukol 3
%--------------------------------------------------------------------------
%Rozprostrete data prvniho uzivatele pomoci jedne z Hadamardovych 
%posloupnosti (odpovidajici napr. 3. radku Hadamardovy matice).
%==========================================================================
v1 = [];
v2 = [];
v3 = [];
v4 = [];

for i = 1:Nbit
    v1 = [v1  H(1,:) * bity1(i)];
    v2 = [v2  H(3,:) * bity2(i)];
    v3 = [v3  H(5,:) * bity3(i)];
    v4 = [v4  H(7,:) * bity4(i)];
end


%==========================================================================
%ukol 6
%--------------------------------------------------------------------------
%K signalu jednoho uzivatele prictete stejnym postupem vytvorene signaly dalsich
%tri uzivatelu (Hadamardovy posloupnosti z 1., 2. a 3., radku matice). Modelujte
%stejnym postupem i prijimac.
%==========================================================================

send = v1 + v2 + v3 + v4;

send = awgn(send, SNR, "measured");


%==========================================================================
%ukol 4
%--------------------------------------------------------------------------
%Modelujte CDMA prijimac pro prvniho uzivatele. Prijaty signal vynasobte 
%pouzitou Hadamardovou posloupnosti (zpetne rozprostreni) a vysledek 
%integrujte pres interval SF.
%Rozhodnete jaka data byla prijata - detektor s prahem 0).
%==========================================================================
received = reshape(send, SF, Nbit);
berctn1 = 0;
berctn2 = 0;
berctn3 = 0;
berctn4 = 0;

for i = 1:Nbit
%     nasobeni = H(3, :) .* received(:,i)';
%     soucet = sum(nasobeni);
%     vysledek(i) = sign(soucet);
% end

    received_sig1(i) = sign(sum(H(1,:) .* received(:,i)'));
    received_sig2(i) = sign(sum(H(3,:) .* received(:,i)'));
    received_sig3(i) = sign(sum(H(5,:) .* received(:,i)'));
    received_sig4(i) = sign(sum(H(7,:) .* received(:,i)'));
    
    if received_sig1(i) ~= bity1(i)
        berctn1 = berctn1 + 1;
    end

    if received_sig2(i) ~= bity2(i)
        berctn2 = berctn2 + 1;
    end

    if received_sig3(i) ~= bity3(i)
        berctn3 = berctn3 + 1;
    end

    if received_sig4(i) ~= bity4(i)
        berctn4 = berctn4 + 1;
    end
end

berr1 = berctn1/Nbit * 100
berr2 = berctn2/Nbit * 100
berr3 = berctn3/Nbit * 100
berr4 = berctn4/Nbit * 100
%==========================================================================
%ukol 4(bez sumu), 5(se sumem)
%--------------------------------------------------------------------------
%K signálu na vstupu prijimace pridejte aditivni bily gaussovsky sum a 
%pozorujte jeho vliv na signal po integraci. Zmente hodnotu SF na napr. 64. 
%Jaky vliv ma velikost SF na chybovost prijmu?
%==========================================================================




%==========================================================================
%ukol 7
%--------------------------------------------------------------------------
%Ze souboru "msekvence.mat" nactete promennou msekvence (délka 32 chipu). 
%Srovnejte (graficky) autokorelacni funkce m-sekvence a hadamardovy sekvence 
%stejne delky. (použijte funkce load a xcorr).
%==========================================================================

load msekvence
figure(1);
plot(xcorr(msekvence))
figure(2);
plot(xcorr(H(1,:)))
figure(3);
plot(xcorr(H(2,:)))













