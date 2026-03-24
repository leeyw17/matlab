clear all
clc
close all

%% 3-2
t = linspace(-4,4,100);
x = (3.3-0.3.*t.^2).*cos(t);
y = (3.3-0.4.*t.^2).*sin(t);

figure()
plot(x,y,'b-')

%% 3-8
z = linspace(0.05,0.5,200);
r = linspace(0,2,200);

[Z,R] = meshgrid(z,r);
N = 1./sqrt((1-R.^2).^2 + (2.*Z.*R).^2);
figure()
mesh(Z,R,N)

%% 3-9
P = 15;
d = 15;
E = 18*10^6;
t = 0.08;
v = 0.3;
K = (E*t^3)/(12*(1-v^2));
r = linspace(0,d,200);
theta = linspace(0,2*pi,200);

[R,T] = meshgrid(r, theta); %r,t는 매개변수 느낌
X = R.*cos(T);
Y = R.*sin(T);
W = ((P*d^4)/(64*K)).*(1-(R/d).^2).^2;
figure()
mesh(X,Y,W)

%% 3-10
theta = linspace(0,pi/2,100);
r = linspace(0.02,0.2,100);
k = 300;

[T,R] = meshgrid(theta,r);
figure()

xx = (-k./sqrt(2*pi.*R)).*(sin(T./2)).*(2+cos(T./2).*cos((3.*T)./2));
yy = (k./sqrt(2*pi.*R)).*(sin(T./2)).*(cos(T./2)).*(cos((3.*T)./2));
xy = (k./sqrt(2*pi.*R)).*(cos(T./2)).*(1-sin(T./2).*(sin((3.*T)./2)));


X = R .* cos(T);
Y = R .* sin(T);

mesh(X, Y, xx); 
figure()
mesh(X, Y, yy);
figure()
mesh(X, Y, xy);