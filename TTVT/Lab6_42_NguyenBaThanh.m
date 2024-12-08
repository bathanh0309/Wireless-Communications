M=4;
N=1000;
k=log2(M);
data_in = randi([0 1],N, 1);
z = reshape(data_in, k, N/k);
% Modulate the data using QPSK (4-QAM) where each symbol is represented by 2 bits
for i = 1:(N/k)
    Q(i) = 2*z(1,i) - 1 + 1j*(2*z(2,i) - 1); % 4-QAM modulation
end

% Transmitted signal
tx = Q;

% Calculate signal power (which is constant for 4-QAM)
signal_power = mean(abs(Q).^2); % Average power of QAM signal

% Define SNR and noise variance
SNR_dB = 10; 
SNR_linear = 10^(SNR_dB / 10); % Convert SNR to linear scale
noise_variance = signal_power / SNR_linear; % Noise variance

% Add noise to the transmitted signal
for i = 1:(N/k)
    % Generate noise for each symbol
    noise = sqrt(noise_variance / 2) * (randn + 1j*randn); 
    
    % Received signal = transmitted signal + noise
    received_signal(i) = Q(i) + noise;
end

% Received signal
rx = received_signal;

% Define 4-QAM constellation points
constellation_points = [1 + 1j, 1 - 1j, -1 + 1j, -1 - 1j];

% Define the corresponding bits for each constellation point
constellation_bits = [1 1; 1 0; 0 1; 0 0];  % [real bit, imaginary bit]

% Demodulate by comparing distance to constellation points
for i = 1:(N/k)
    % Calculate the Euclidean distance to each constellation point
    distances = abs(rx(i) - constellation_points);
    
    % Find the index of the closest constellation point
    [~, closest_point_index] = min(distances);
    
    % Map the closest constellation point to the corresponding bits
    demodulated_bits(:, i) = constellation_bits(closest_point_index, :)';
end

% Reshape the demodulated bits into a column vector (to match original bitstream)
received_bits = reshape(demodulated_bits, [], 1);

% Display original bits and demodulated bits for comparison
disp('Original bits (first 10):');
disp(data_in(1:10)');
disp ('Transmitted signal:');
for i=1:5
    disp (Q(i));
end
disp ('Received signal:');
for i=1:5
    disp(received_signal(i));
end
disp('Demodulated bits (first 10):');
disp(received_bits(1:10)');

% Compare original and demodulated bits
num_errors = sum(data_in ~= received_bits);
fprintf('Number of bit errors: %d\n', num_errors);
