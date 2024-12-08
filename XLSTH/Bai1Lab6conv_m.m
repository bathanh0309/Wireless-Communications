%t?o hàm tích ch?p th?c hi?n tích ch?p 2 dãy, m?i dãy 2 vector
function [y,ny] = conv_m(x,nx,h,nh)
% Ham tinh tich chap da duoc sua doi danh cho xu ly so
    % [y,ny] = day ket qua
    % [x,nx] = day thu nhat
    % [h,nh] = day thu hai
    nyb = nx(1) + nh(1);
    nye = nx(length(x))+nh(length(h));
    ny = [nyb:nye];
    y = conv(x,h);
end
%%%
>> x = [3:5]            x = 3     4     5
>> h = [4:7]            h = 4     5     6     7
>> nx = [0:3]           nx =0     1     2     3
>> nh = [2:6]           nh =2     3     4     5     6
>> conv_m(x,nx,h,nh)    ans =12    31    58    70    58    35
>> nyb = nx(1) + nh(1)  nyb = 2
>> nye = nx(length(x))+nh(length(h))    nye =   7
>> ny = [nyb:nye]        ny = 2     3     4     5     6     7
>> y = conv(x,h)         y =    12    31    58    70    58    35