M = 4;     
N = 100;         
EbNo = 10;        
data = randi([0 M-1], N, 1);

modulatedData = qammod(data, M, 'UnitAveragePower', true);

scatterplot(modulatedData);
title('Bi?u ?? c?a chòm sao c?a 4-QAM');
xlabel('??ng pha');
ylabel('Vuông pha');
grid on;

Signal = awgn(modulatedData, EbNo, 'measured');

figure;
scatterplot(Signal);
title('Tín hi?u nh?n v?i nhi?u AWGN (Eb/No = 10 dB)');
xlabel('??ng pha');
ylabel('Vuông pha');
grid on;