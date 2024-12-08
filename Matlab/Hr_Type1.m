function [Hr,w,a,L] = Hr_Type1(h)
M = length(h);
L =(M-1)/2;
a = [h(L+1) 2*h(L:-1:1)];
n = [0:1:L];
w = [0:1:500]'*pi/500;
Hr = cos(w*n)*a';
