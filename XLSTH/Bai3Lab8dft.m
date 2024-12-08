function [Xk] = dft(xn,N)

n = [0:1:N-1];
k = [0:1:N-1];

WN = exp(-1j*2*pi/N);
nk = n'*k;
WNnk = WN.^nk;
Xk = xn*WNnk;
% ....
xn = [1, 2, 3, 4];
N = length(xn);    

Xk = dft(xn, N);  
disp('Các h? s? DFT:');
disp(Xk);
%Các h? s? DFT:
  10.0000 + 0.0000i  
  -2.0000 + 2.0000i  
  -2.0000 - 0.0000i  
  -2.0000 - 2.0000i