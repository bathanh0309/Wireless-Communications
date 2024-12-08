
f_c = 900 * 10^6;  
h_b = 50;          
h_m = 1.5;        
d = (1:20) * 1000; 

a1 = (1.1 * log10(f_c) - 0.7) * h_m - 1.56 * log10(f_c) + 0.8;
a2 = 8.28 * (log10(1.54 * h_m))^2 - 1.1;
a3 = 3.2 * (log10(11.75 * h_m))^2 - 4.97;

A1 = 69.55 + 26.16 * log10(f_c) - 13.82 * log10(h_b) - a1;
A2 = 69.55 + 26.16 * log10(f_c) - 13.82 * log10(h_b) - a2;
A3 = 69.55 + 26.16 * log10(f_c) - 13.82 * log10(h_b) - a3;

B = 49.9 - 6.55 * log10(h_b);
C = 5.4 + 2 * (log10(f_c / 28))^2;
D = 40.94 + 4.78 * (log10(f_c))^2 - 18.33 * log10(f_c);

Lp1 = A1 + B .* log10(d);        
Lp2 = A1 + B .* log10(d) - C;      
Lp3 = A1 + B .* log10(d) - D;      
Lp4 = A3 + B .* log10(d);          
Lp5 = A3 + B .* log10(d) - C;      
Lp6 = A3 + B .* log10(d) - D;      

figure(1);
plot(log10(d/1000), Lp1, 'r-o', 'LineWidth', 2, 'DisplayName', 'Urban area');
hold on;
plot(log10(d/1000), Lp2, 'b-s', 'LineWidth', 2, 'DisplayName', 'Suburban area');
plot(log10(d/1000), Lp3, 'g-^', 'LineWidth', 2, 'DisplayName', 'Open Area');
hold off;
xlabel('Log_{10}(Distance d in km)');
ylabel('Path Loss (dB)');
title('Path Loss vs Distance for Different Area Cases (Medium/Small city, h_b = 50 m)');
legend('Location', 'best');
grid on;

