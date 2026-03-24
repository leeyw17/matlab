clear all
clc
close all

%% 1
x = linspace(0,10,10000);
y1 = x.^2.*exp(-x);
y2 = exp(-x).*(2.*x - x.^2);

figure;
plot(x,y1,'b-'); hold on;
plot(x,y2,'r--');

xlabel('x')
ylabel('y')
legend('Original function','Its derivative') 


%% 2
t = linspace(0,pi,1000);
x = 0.7.*cos(10.*t);
y = 1.2.*sin(8.*t);

figure()
subplot(3,1,1)
plot(t,x,'b-');

subplot(3,1,2)
plot(t,y,'b-');

subplot(3,1,3)
plot(x,y,'b-');

%% 3
x = linspace(-1,1,10000);

y1 = sqrt(1-(x).^2) + nthroot(x.^2,3);
y2 = -sqrt(1-(x).^2) + nthroot(x.^2,3);


figure()
plot(x,y1,'r-'); hold on;
plot(x,y2,'r-');
axis equal

%% 4
Q = 9.4*10^(-6); 
q = 24*10^(-6);
R = 0.1;
o = 0.885*10^(-12);

z =linspace(0,0.3,1000);
F = (Q*q.*z)./(2*o).*(1-z./sqrt(z.^2+R.^2));
[val,idx] = max(F)
z(idx)

figure()
plot(z,F,'b-');
xlabel('x(m)')
ylabel('F(N)')



%% 5
t = 0:0.1:5;
x = 52.*t - 9.*t.^2;
y = 125 - 5.*t.^2;

dxdt = 52 - 18.*t;
dydt = -10.*t;

v = sqrt(dxdt.^2 + dydt.^2);
% find를 이용하는 방법
low_v = min(v)
k = find(v == min(v));
low_time = t(k)

% min으로 한번에 구하는 방법
[val, idx] = min(v)
low_time1 = t(idx)

figure()
subplot(1,2,1)
plot(x,y,'b*-','MarkerFaceColor','b');
xlabel('x(m)')
ylabel('y(m)')

subplot(1,2,2)
plot(time,v,'b*-','MarkerFaceColor','b');
axis([-20 25 25 65])

%% 6
f = linspace(10,50000,10000);
w = 2*pi*f;
R = 2000;
C = 0.2*10^-6;

vol = (w.*R*C)./sqrt(1 + (w.*R*C).^2);

figure()
semilogx(f,vol,'b-');

%% 7
R = 4;
L = 1.3;
V = 12;

t1 = linspace(0,0.5,1000);
t2 = linspace(0.5,2,1000);

i1 = (V/R).*(1 - exp(-(R.*t1)./L));

%i2 = exp((-R.*t2)/L).*(V/R).*(exp(-(0.5*R)/L)-1)
i2 = exp((-R.*t2)./L) .* (V/R) .* (exp((0.5*R)/L) - 1); 

figure()
plot(t1,i1,'b-'); hold on;
plot(t2,i2,'b-');
xlabel('time(s)')
ylabel('current(A)')

%% 8
x = linspace(-5,5,1000);
y = linspace(-5,5,1000);

[X,Y] = meshgrid(x,y);
R = sqrt((X).^2 + (Y).^2);
Z = (-cos(2.*R))./(exp(0.2.*R));
figure()
mesh(X,Y,Z)
xlabel('x'); ylabel('y'); zlabel('z')
grid on

%% 9
theta = linspace(-20,20,1000);
p = linspace(2,10,1000);

[THETA,P] = meshgrid(theta,p); % 2차원 좌표 격자생성
alpha = pi.*P.*sind(THETA); %alpha는 중간변수
I = (sin(alpha)./alpha).^2; %이미 위에서 sind로 받았으니 여기선 그냥 sin
figure()
mesh(P,THETA,I)
xlabel('alpha/lambda'); ylabel('theta'); zlabel('Relative Intensity')
grid on

%% 10
v_0 = 20;
theta = 30;
alpha = 25;
g = 9.81;

v_x = v_0*sind(theta)*cosd(alpha);
v_y = v_0*sind(theta)*sind(alpha);
v_z = v_0*cosd(theta);

t_b = (2*v_z)/g;

t1 = linspace(0,t_b,1000);

x1 = v_x*t1;
y1 = v_y*t1;
z1 = v_z*t1 - (0.5).*g.*t1.^2;

figure()
plot3(x1,y1,z1,'k-'); hold on;


t2 = linspace(t_b,t_b + t_b*0.8,1000);

x2 = v_x*t2;
y2 = v_y*t2;
z2 = 0.8*v_z*(t2-t_b)- (0.5).*g.*(t2-t_b).^2;

plot3(x2,y2,z2,'k-'); hold on;

T = t_b*0.8;

t3 = linspace(t_b + T,t_b + T + T*0.8,1000);

x3 = v_x*t3;
y3 = v_y*t3;
z3 = (0.8)^2*v_z*(t3-t_b-T)- (0.5).*g.*(t3-t_b-T).^2;

plot3(x3,y3,z3,'k-'); hold on;

t4 = linspace(t_b + T + T*0.8 ,t_b + T + T*0.8 + T*(0.8)^2,1000);

x4 = v_x*t4;
y4 = v_y*t4;
z4 = (0.8)^3*v_z*(t4-t_b-T-T*(0.8))- (0.5).*g.*(t4-t_b-T-T*(0.8)).^2;

plot3(x4,y4,z4,'k-'); hold on;

t5 = linspace(t_b + T + T*0.8 + T*(0.8)^2 ,t_b + T + T*0.8 + T*(0.8)^2 + T*(0.8)^3,1000);

x5 = v_x*t5;
y5 = v_y*t5;
z5 = (0.8)^4*v_z*(t5-t_b-T-T*(0.8)-T*(0.8)^2)- (0.5).*g.*(t5-t_b-T-T*(0.8)-T*(0.8)^2).^2;

plot3(x5,y5,z5,'k-'); hold on;
xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)')
grid on




