fc = 900*10^6; 
hm = 1.5; 
d = 1000;    
hb = 50:10:200; 
path_loss_small_city = zeros(size(hb));
path_loss_large_city = zeros(size(hb));

for i = 1:length(hb)
 
    path_loss_small_city(i) = 69.55 + 26.16*log10(fc) - 13.82*log10(hb(i)) ...
        + (44.9 - 6.55*log10(hb(i)))*log10(d) + 0; 
    path_loss_large_city(i) = 69.55 + 26.16*log10(fc) - 13.82*log10(hb(i)) ...
        + (44.9 - 6.55*log10(hb(i)))*log10(d) + 3; 
end

figure;
plot(hb, path_loss_small_city, 'b-o', 'DisplayName', 'Medium/Small City');
hold on;
plot(hb, path_loss_large_city, 'r-s', 'DisplayName', 'Large City');
grid on;
xlabel('Base Station Height (m)');
ylabel('Path Loss (dB)');
title('Path Loss vs Base Station Height');
legend('show');
