close all
clc
clear all

%% 
r = [1 2 3];
p = poly(r)

p = [-1 0 1 0 ];
roots(p)'

x = -2:0.01:2;
y = polyval(p,x);
figure()
plot(x,y)


A = [2 3; 4 -1];  % 계수 행렬
b = [8; 2];       % 상수 벡터

x = A\b;          % 역행렬 없이 해 구함
disp(x)           % x(1) = x, x(2) = y


a = [2 3; 4 -1];
b = [8; 2];

x = a\b


function [C,R] = circle3pts(p,q,r)

x1 = p(1); y1 = p(2);
    x2 = q(1); y2 = q(2);
    x3 = r(1); y3 = r(2);

a = [2*(x2-x1), 2*(y2-y1); 2*(x3-x1), 2*(y3-y1)];
b = [x2^2 - x1^2 + y2^2 - y1^2;
     x3^2 - x1^2 + y3^2 - y1^2];



c = a\b
C = c;

R = sqrt((x1 - C(1))^2 + (y1 - C(2))^2);

theta = linspace(0,2*pi,1000);

x_circle = R*cos(theta) + c(1);
y_circle = R*sin(theta) + c(2);

figure()
plot(x_circle,y_circle,'b-'); hold on;
plot([p(1) q(1) r(1)], [p(2) q(2) r(2)], 'ro');
end

p = [7, 1.2];
q = [0.5, 2.6];
r = [-2.4, -1.4];

[C, R] = circle3pts(p,q,r);
disp('Center ='), disp(C)
disp('Radius ='), disp(R)


