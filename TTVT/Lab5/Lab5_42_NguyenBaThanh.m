% Thông s? ban ??u
M = 16; % S? m?c c?a M-QAM (M=16 ngh?a là 16-QAM)
N = 100; % S? l??ng ký hi?u ph?c
SNR_dB = 10; % SNR = 10 dB

% B??c 1: T?o ma tr?n d? li?u nh? phân v?i kích th??c 2xN
numBits = N * log2(M); % T?ng s? bit c?n thi?t cho 16-QAM
x = randi([0 1], N, log2(M)); % Ma tr?n nh? phân kích th??c Nx4 cho 16-QAM

% B??c 2: X? lý các bit ?? t?o ra ph?n th?c và ph?n ?o
% Ph?n th?c (2 bit ??u tiên)
real_sign = 2 * x(:, 1) - 1;  % D?u ph?n th?c: 0 -> -1, 1 -> +1
real_value = 2 * x(:, 2) + 1; % Giá tr? ph?n th?c: 0 -> 1, 1 -> 3
 
% Ph?n ?o (2 bit ti?p theo)
imag_sign = 2 * x(:, 3) - 1;  % D?u ph?n ?o: 0 -> -1, 1 -> +1
imag_value = 2 * x(:, 4) + 1; % Giá tr? ph?n ?o: 0 -> 1, 1 -> 3

% T?o ph?n th?c và ph?n ?o c?a ký hi?u
real_part = real_sign .* real_value;  % Ph?n th?c ??y ??
imag_part = imag_sign .* imag_value;  % Ph?n ?o ??y ??

% Tín hi?u 16-QAM
tx_signal = real_part + 1j * imag_part;

% B??c 3: Tính toán công su?t nhi?u và thêm nhi?u AWGN
SNR = 10^(SNR_dB / 10); % Chuy?n ??i SNR t? dB sang tuy?n tính
noise_variance = 1 / SNR; % Ph??ng sai c?a nhi?u

% T?o nhi?u AWGN
noise = sqrt(noise_variance / 2) * (randn(size(tx_signal)) + 1j * randn(size(tx_signal)));

% Tín hi?u nh?n ???c (sau khi thêm nhi?u)
rx_signal = tx_signal + noise;

% B??c 4: V? bi?u ?? chòm sao tr??c khi truy?n (TX)
figure;
scatter(real(tx_signal), imag(tx_signal), 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'none', 'LineWidth', 2);
title('16-QAM Constellation - Before Transmission (TX)');
xlabel('In-phase');
ylabel('Quadrature');
grid on;
axis([-4 4 -4 4]);

% B??c 5: V? bi?u ?? chòm sao sau khi truy?n qua kênh AWGN (RX)
figure;
scatter(real(rx_signal), imag(rx_signal), 'MarkerEdgeColor', 'b', 'MarkerFaceColor', 'none', 'LineWidth', 2);
title('16-QAM Constellation - After Transmission (RX)');
xlabel('In-phase');
ylabel('Quadrature');
grid on;
axis([-4 4 -4 4]);