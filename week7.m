clear all
clc
close all


function [pie, error] = seriesf(n)
a_n(1) = sqrt(2)/2;
s_n = a_n(1);
for count = 2:n
    a_n(count) = sqrt(2*a_n(count-1)+2)/2;
    s_n = prod(a_n);
end
pie = 2/s_n;
error = abs(pie - pi);
end
[pie, error] = seriesf(20)


function output = ascending(x)
n = length(x);
for i = 1:n
    [val, idx] = min(x);
    x_new(i) = val;
    x(idx) = []; 
end
output = x_new; 
end
x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];

output1 = ascending(x)

theta = linspace(0,2*pi,1000);
r = sin(theta).*sqrt(abs(cos(theta)))./(sin(theta)+7/5)-2*sin(theta)+2;

figure()
polar(theta,r,'r')

theta = linspace(0,4*pi,1000);

r = 3.*sind(3.*cos(0.5.*theta));

figure()
polar(theta, r, 'b')
%%
g = 9.81;
function z = par(v0,t)
z = v0 * t - 0.5 * g * t^2;
end
v0 = 5;
t = 0:0.01:10;
figure()
z = v0 .* t - 0.5 * g .* t.^2;

plot(t,z)