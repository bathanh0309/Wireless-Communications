M = 4; % Modulation level for 4-QAM
k = log2(M);
N = 1e4; % Number of symbols per frame (can adjust based on accuracy needs)

num_iter = 100; % Number of Monte Carlo iterations
SNR_range_dB = 0:5:15; % SNR range from 0 to 15 dB
ber_sim = zeros(size(SNR_range_dB)); % Initialize BERsim array
ber_theory = zeros(size(SNR_range_dB)); % Initialize theoretical BER array

% Loop over SNR values
for snr_idx = 1:length(SNR_range_dB)
    SNR_dB = SNR_range_dB(snr_idx);
    SNR_linear = 10^(SNR_dB / 10); % Convert SNR from dB to linear scale
    noise_variance = 1 / SNR_linear; % Normalized noise variance for 4-QAM
    
    num_errors = 0; % Initialize error count
    total_bits = 0; % Initialize total bit count
    
    for iter = 1:num_iter
        % Generate random binary data
        data_in = randi([0 1], N*k, 1);
        z = reshape(data_in, k, N);

        % 4-QAM modulation
        Q = (2*z(1,:) - 1) + 1j*(2*z(2,:) - 1);
        
        % Add noise to the transmitted signal
        noise = sqrt(noise_variance/2) * (randn(1, N) + 1j*randn(1, N));
        received_signal = Q + noise;

        % Demodulate
        constellation_points = [1+1j, 1-1j, -1+1j, -1-1j];
        constellation_bits = [1 1; 1 0; 0 1; 0 0];
        demodulated_bits = zeros(2, N);

        for i = 1:N
            distances = abs(received_signal(i) - constellation_points);
            [~, closest_point_index] = min(distances);
            demodulated_bits(:, i) = constellation_bits(closest_point_index, :)';
        end

        % Reshape demodulated bits
        received_bits = reshape(demodulated_bits, [], 1);
        
        % Count errors
        num_errors = num_errors + sum(data_in ~= received_bits);
        total_bits = total_bits + length(data_in);
    end
    
    % Compute BER simulation (average over all iterations)
    ber_sim(snr_idx) = num_errors / total_bits;

    % Compute theoretical BER for 4-QAM
    ber_theory(snr_idx) = 2 * (1 - 1/sqrt(M)) * qfunc(sqrt(2 * SNR_linear * log2(M) / (M - 1)));
end

% Plot results
figure;
semilogy(SNR_range_dB, ber_theory, 'k--^', 'LineWidth', 2); % Theoretical BER
hold on;
semilogy(SNR_range_dB, ber_sim, 'b-o', 'LineWidth', 2); % Simulated BER
xlabel('SNR (dB)');
ylabel('Bit Error Rate (BER)');
legend('BER via Theoretical Analysis', 'BER via Monte Carlo Simulation');
title('BER vs SNR for 4-QAM over AWGN Channel');
grid on;