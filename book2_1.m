clear all
clc
close all
%% 73-29
x1=linspace(0,pi,200);
x2=linspace(-pi,0,200);

f1 = ones(size(x1));
f2 = -ones(size(x2));

f_approx1 = (4/pi)*(sin(x1) + sin(3*x1)/3 + sin(5*x1)/5 + sin(7*x1)/7);
f_approx2 = (4/pi)*(sin(x2) + sin(3*x2)/3 + sin(5*x2)/5 + sin(7*x2)/7);

figure;
plot(x1,f_approx1); hold on;
plot(x2,f_approx2);

%% 
x = 0:0.001:0.6;
L = 100*(x/0.6).^(0.625).*((1-x)/0.4).^(-1.625);
figure;
plot(L,x)
[L,x] = ginput(1)

%% 147-11
A = [3 -2 1; 6 8 -5; 7 9 10];
B = [6 9 -4; 7 5 3; -8 2 1];
C = [-7 -5 2; 10 6 1; 3 -9 8];
cat(3, A, B, C)

size(D)

%% 152-29
R = 0.01:0.01:40;
cost = @(R) (2500)./(R*40) +(pi/2).*(R*40) + 2.*(R*40);
y = cost(R); %cost는 함수니까 배열 R에 대해 함수값 먼저 계산 후 min을 적용해야함
[minval,idx] = min(y)

%% 154-33
W = 100;
Lb = 4;
Lc = 6;
D = linspace(0,16,1000);

%% 161-59
p = [((320)^2+(160)^2) -2*((800*320)+(160*410)) (800)^2+(410)^2];
k = polyder(p);
w = roots(k);
d = sqrt((800-320*w)^2 + (410-160*w)^2)

p = [((320)^2+(160)^2) -2*((800*320)+(160*410)) (800)^2+(410)^2-900];
roots(p)

%% 163-63
v = 70;
a = 45
g = 9.81;
p1 = [-(1/2)*g v*sind(a)];
k1 = roots(p1)

p2 = [-(1/2)*g v*sind(a) -100];
k2 = roots(p2)

p3 = [-(1/2)*g v*sind(a) -200];
k3 = roots(p3)

roots(p2)
roots(p3)

%% 
function y = f3(x)
y = polyval([0.025, -0.0625, -0.333, 1, 0, 0], x);
end

x = fminbnd(@f3, -1, 4)


%%
per =[];
num = 0;
while length(per)<4
    num = num+1;
    fac = [];

    for i = 1:num-1
        if rem(num,i) == 0
            fac(end+1) = i;
        end
    end

        if num == sum(fac)
            per(end+1) = num;
        end
    
end

per

            


