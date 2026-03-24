clear all
clc
close all

%% 1
l1 = 5;
l2 = 8;
h = 1.5;
s = 9;

Func = @(x) h*x + s*sqrt(1-x^2)-(s^2 + l1^2 -l2^2 + h^2)/(2*l1);
x_sol = fzero(Func,0);

theta = asind(x_sol)

%% 2
Func = @(x) x^3 - x^2*exp(-0.5*x) - 3*x + 1;

fzero(Func,-2.5)
fzero(Func,0.3)
fzero(Func,3.5)

x = linspace(-4, 5, 1000); 
figure()
plot(x,x.^3 - x.^2.*exp(-0.5.*x) - 3.*x + 1)

%% 3
Func = @(x) (2+(x-1.45)^2)/(3+3.5*(0.8*x^2-0.6*x+2));

[xmin,fmin] = fminbnd(Func,2,2.2)

[xmax,fmax] = fminbnd(@(x)-Func(x),-1.7,-1.5) % 그냥 -Func로 하면 안댐 @(x)-Func(x)이렇게 해야댐

x = linspace(-5,5,100);
figure()
plot(x,(2+(x-1.45).^2)./(3+3.5*(0.8.*x.^2-0.6.*x+2)))

%% 4
L = 108;
Lc = 68;
W = 250;

d = linspace(0,70,100);
T = (W*L*Lc)./(d.*sqrt(Lc^2 - d.^2));
d = linspace(0,70,100);
figure()
plot(d,T,'b-')

Func = @(d)(W*L*Lc)/(d*sqrt(Lc^2 - d^2));

[dmin, fmin] = fminbnd(Func,40,50)

%% 5
x = [0, 0.4, 0.8, 1.2, 1.6, 2.0, 2.4, 2.8];
F = [0, 0.85, 1.30, 1.60, 1.87, 2.14, 2.34, 2.52];

q = trapz(x,F)


%% 6
b=5;
t = linspace(0,2*pi,100);
x = 2*b*cos(t)-b*cos(2*t);
y = 2*b*sin(t)-b*sin(2*t);

figure()
plot(x,y)

dx = -2*b*sin(t)+2*b*sin(2*t);
dy = 2*b*cos(t)-2*b*cos(2*t);

%func = @(t) sqrt(dx.^2 + dy.^2); 
func = @(t) sqrt((-2*b*sin(t)+2*b*sin(2*t)).^2 + (2*b*cos(t)-2*b*cos(2*t)).^2);

int = integral(func,0,2*pi)

%% 7
R = 6371;
g0 = 9.81;
%g = ((R^2)/(R+y)^2)*g0;
m = 500;
h = 800;

func = @(y) m*((R^2)./(R+y).^2)*g0

integral(func,0,h)
% 적분이니까 .써야함


