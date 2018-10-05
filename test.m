
% MAS354 - PROJECT
% Clem Davies 32563824
% just a test


d = 0:0.01:2;

line1 = plot(d,x(d),'-');
title("Sinusoid test")


function y = x(d)
    y = cos(pi*d) + sin(pi*d);
end
