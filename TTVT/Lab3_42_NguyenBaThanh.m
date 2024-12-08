f_c =  2000 *10^6;
h_b = 70;         
h_m = 1.5;         
d = (1:10)*1000;
% Tính toán các h? s? ?i?u ch?nh theo khu v?c
a1 = (1.1 * log10(f_c) - 0.7) * h_m - 1.56 * log10(f_c) + 0.8; %medium /suburban areas
a2 = 8.28 * (log10(1.54 * h_m))^2 - 1.1; %large city fc<200M
a3 = 3.2 * (log10(11.75 * h_m))^2 - 4.97; %large city fc>400M

% Tính toán h? s? suy hao cho t?ng khu v?c
A1 = 46.3 + 33.9 * log10(f_c) - 13.82 * log10(h_b) - a1;
A2 = 46.3 + 33.9 * log10(f_c) - 13.82 * log10(h_b) - a2;
A3 = 46.3 + 33.9 * log10(f_c) - 13.82 * log10(h_b) - a3;

B = 44.9 - 6.55*log10(h_b);

% Small and Medium city
%The pass loss in medium city suburban area
Lp1 = A1+B*log10(d);
%The pass loss in metropolitan center area
Lp2 = A1+B*log10(d)+3;

% Large city
%The pass loss in medium city suburban area
Lp3= A2+B*log10(d);
%The pass loss in metropolitan center suburban area
Lp4 = A2+B*log10(d)+3;

% V? bi?u ??
figure(1);
plot(log10(d/1000), Lp1, 'r-o', 'LineWidth', 2, 'DisplayName', 'Suburban area');
hold on;
plot(log10(d/1000), Lp2, 'b-s', 'LineWidth', 2, 'DisplayName', 'Metropolitan area');

hold off;
xlabel('Log_{10}(Distance d in km)');
ylabel('Path Loss (dB)');
title('COST231-HATA Path Loss vs Distance for Small/ Medium City (h_b=70 m)');
legend('Location', 'best');
grid on;

figure(2);
plot(log10(d/1000), Lp3, 'r-o', 'LineWidth', 2, 'DisplayName', 'Suburban area');
hold on;
plot(log10(d/1000), Lp4, 'b-s', 'LineWidth', 2, 'DisplayName', 'Metropolitan area');

hold off;
xlabel('Log_{10}(Distance d in km)');
ylabel('Path Loss (dB)');
title('COST231-HATA Path Loss vs Distance for Large City (h_b=70 m)');
legend('Location', 'best');
grid on;