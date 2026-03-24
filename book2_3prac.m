close all
clc
clear all
%% 217-6
e = 8.854*10^-12;
L = 1; r = 0.001; d = 0.004;
C = (pi*e*L)/log((d-r)/r)

%% 218-7
mu = input('mu:');
beta = input('beta:');
f_2 = input('f_2:');

real_beta = deg2rad(beta);

f_1 = f_2*exp(mu*real_beta)

%% 218-9
% x = linspace(0,4,200);
% f = .3*x - sin(2*x);

syms x
f = @(x).3*x - sin(2*x);
df = diff(f,x)  % diff 쓰려면 syms 로 x 해줘야함

fzero(f,0)
fzero(f,2)

% x = linspace(-15,15,2000);
% f = .3*x - sin(2*x);
% figure;
% plot(x,f)

% x = linspace(0,4,200);
% df = 3/10 - 2*cos(2*x);
% figure;
% plot(x,df)

[xmin,fmin] = fminbnd(f,0,4)
%% 218-10
p = [-(1/2)*9.81 50 -100];
roots(p)

%% 218-11
f = @(r) 1000*((1000/r-(2/3*pi*r^3)/r)) + 1400*pi*r^2;
rmax = (1500/pi)^(1/3);
[r, rmin] = fminbnd(f,0,rmax)
h = 1000/(pi*r^2) - (2/3*pi*r^3)/(pi*r^2)

%% 219-12
f = @(w) (1+sqrt(2))*w + 2*((80)/(w+w^2/4));
[w_min, w_idx] = fminbnd(f, 0, 100)

L = 80/(w_min+w_min^2/4)
P = (1+sqrt(2))*w_min + 2*((80)/(w_min+w_min^2/4))

%% 220-14
r = 0.01:0.01:100;
f = (2.*r + (2000-(pi/2).*r.^2)./r).*50 + 60*pi.*r;
[fmin, idx] = min(f)
r(idx)




