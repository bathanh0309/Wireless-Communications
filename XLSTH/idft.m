function [xn] = idft(Xk,N)
% t�m bi?n ??i fourier r?i r?c ng??c
%[Xn] = idft(Xk,N)
%Xn = d�y c�c h? s? DFT tr�n ?o?n 0<=k<=N-1
%Xk = d�y h?u h?n N ?i?m
%N = chi?u d�i DFT

n = [0:1:N-1];
k = [0:1:N-1];

WN = exp(-1j*2*pi/N);
nk = n'*k;
WNnk = WN.^nk; % ma tr?n IDFT
xn = (Xk*WNnk)/N;
%....
Xk = [10, -2 + 2j, -2, -2 - 2j]; % D�y t�n hi?u DFT
N = length(Xk);                  % Chi?u d�i DFT

xn = idft(Xk, N);                % T�nh IDFT

% Hi?n th? k?t qu?
disp('D�y t�n hi?u ph?c h?i t? DFT:');
disp(xn);