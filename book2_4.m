close all
clc
clear all
%%
tot = 0;
k = 0;
while tot < 20000
    k = k+1;
    tot = 10*k^2 - 4*k + 2 + tot;
end

tot

%% 247
a = 40;
v0 = 20;
g = 9.81;
t_hit = 2*(v0/g)*sind(a);
t = [0:t_hit/100:t_hit];
h = (v0*t*sind(a))-(0.5*g*t^2);
v = sqrt(v0^2 - 2*v0*g*t*sind(a) + g^2*t^2);
ans = find(h>=6 & v<=16);

