M = 4;  % 4-QAM
N = 100;
SNR_dB = 0:2:10;
num_iter = 100;

% T?o c�c ?i?m ch�m sao cho 4-QAM
constellation = [1+1j, -1+1j, -1-1j, 1-1j];

% H�m ?i?u ch? v� gi?i ?i?u ch?
qam_modulate = @(bits) constellation(bits + 1);
qam_demodulate = @(symbols) arrayfun(@(s) find(abs(s - constellation) == min(abs(s - constellation))) - 1, symbols);

% Chu?n b? ?? th? cho ch�m sao
figure;
subplot(3, 1, 1);
scatter(real(constellation), imag(constellation), 'red');
title('MQAM Constellation at Transmitter');
xlabel('In-Phase');
ylabel('Quadrature');

% T?o t?t c? d? li?u ng?u nhi�n m?t l?n cho t?t c? c�c gi� tr? SNR
tx_bits = randi([0, M-1], num_iter, N);
tx_symbols = qam_modulate(tx_bits);

% T�nh to�n vector h�a qua t?t c? c�c gi� tr? SNR
ber_awgn = [];
ber_rayleigh = [];
ber_rayleigh_no_csi = [];

% Chuy?n ??i SNR t? dB sang d?ng tuy?n t�nh
snr_linear = 10.^(SNR_dB / 10);

% Hi?u ?ng k�nh ???c vector h�a cho m?i SNR
for snr = snr_linear
    % Nhi?u AWGN
    noise = (randn(num_iter, N) + 1j * randn(num_iter, N)) / sqrt(2 * snr);
    rx_awgn = tx_symbols + noise;

    % Fading Rayleigh
    h = (randn(num_iter, N) + 1j * randn(num_iter, N)) / sqrt(2);
    rx_rayleigh = h .* tx_symbols + noise;
    rx_rayleigh_csi = rx_rayleigh ./ h;

    % Gi?i ?i?u ch?
    rx_bits_awgn = reshape(qam_demodulate(rx_awgn(:)), num_iter, N);
    rx_bits_rayleigh = reshape(qam_demodulate(rx_rayleigh_csi(:)), num_iter, N);
    rx_bits_rayleigh_no_csi = reshape(qam_demodulate(rx_rayleigh(:)), num_iter, N);

    % T�nh BER
    ber_awgn = [ber_awgn; mean(rx_bits_awgn ~= tx_bits, 'all')];
    ber_rayleigh = [ber_rayleigh; mean(rx_bits_rayleigh ~= tx_bits, 'all')];
    ber_rayleigh_no_csi = [ber_rayleigh_no_csi; mean(rx_bits_rayleigh_no_csi ~= tx_bits, 'all')];
end

% ?? th? ch�m sao cho gi� tr? SNR ??u ti�n
subplot(3, 1, 2);
scatter(real(rx_awgn(1, :)), imag(rx_awgn(1, :)), 'blue', 'filled', 'MarkerFaceAlpha', 0.5);
title('MQAM Constellation at Receiver over AWGN Channels');
xlabel('In-Phase');
ylabel('Quadrature');

subplot(3, 1, 3);
scatter(real(rx_rayleigh_csi(1, :)), imag(rx_rayleigh_csi(1, :)), 'black', 'filled', 'MarkerFaceAlpha', 0.5);
title('MQAM Constellation at Receiver over Wireless Channels');
xlabel('In-Phase');
ylabel('Quadrature');

% ?? th? ch�m sao
sgtitle('MQAM Constellation Plots');
set(gcf, 'Position', [100, 100, 800, 600]);

% V? BER so v?i SNR
figure;
semilogy(SNR_dB, ber_awgn, '-bs', 'DisplayName', 'Wireline (AWGN)');
hold on;
semilogy(SNR_dB, ber_rayleigh, '-ro', 'DisplayName', 'Wireless (Rayleigh with CSI)');
semilogy(SNR_dB, ber_rayleigh_no_csi, '-k^', 'DisplayName', 'Wireless (Rayleigh without CSI)');
title('BER Performance over AWGN and Rayleigh Channels');
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend;
grid on;