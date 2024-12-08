M = 4;     
N = 100;         
EbNo = 10;        
data = randi([0 M-1], N, 1);

modulatedData = qammod(data, M, 'UnitAveragePower', true);

scatterplot(modulatedData);
title('Bi?u ?? c?a ch�m sao c?a 4-QAM');
xlabel('??ng pha');
ylabel('Vu�ng pha');
grid on;

Signal = awgn(modulatedData, EbNo, 'measured');

figure;
scatterplot(Signal);
title('T�n hi?u nh?n v?i nhi?u AWGN (Eb/No = 10 dB)');
xlabel('??ng pha');
ylabel('Vu�ng pha');
grid on;