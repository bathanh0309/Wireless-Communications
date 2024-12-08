% Vi?t ch??ng tr�nh th? hi?n ?? th? k?t qu? ph�p t�ch ch?p gi?a 2 d�y sau:
% x(n) = rect6(n)   
% h(n) = 1-(n/4)   0 <= n <= 4    
% h(n) = 0         n c�n l?i
% v?i  -4 <= n <= 10
n = -4:10;
x = zeros(size(n));
x(n >= -3 & n < 3) = 1;

h = zeros(size(n));
h(n >= 0 & n < 4) = 1 - n(n >= 0 & n < 4) / 4;
y = conv(x, h, 'full');
n_y = -8:20;

figure;
stem(n_y, y, 'filled');
title('y(n) = x(n) * h(n)');
xlabel('n');
ylabel('y(n)');
grid on;
