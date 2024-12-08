function [xn] = idft(Xk,N)
% tìm bi?n ??i fourier r?i r?c ng??c
%[Xn] = idft(Xk,N)
%Xn = dãy các h? s? DFT trên ?o?n 0<=k<=N-1
%Xk = dãy h?u h?n N ?i?m
%N = chi?u dài DFT

n = [0:1:N-1];
k = [0:1:N-1];

WN = exp(-1j*2*pi/N);
nk = n'*k;
WNnk = WN.^nk; % ma tr?n IDFT
xn = (Xk*WNnk)/N;
%....
Xk = [10, -2 + 2j, -2, -2 - 2j]; % Dãy tín hi?u DFT
N = length(Xk);                  % Chi?u dài DFT

xn = idft(Xk, N);                % Tính IDFT

% Hi?n th? k?t qu?
disp('Dãy tín hi?u ph?c h?i t? DFT:');
disp(xn);