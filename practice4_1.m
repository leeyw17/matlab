close all
clc
clear all
%% 1
theta = 0:10:90;
alpha = asind((1+3.*cosd(theta))./sqrt((1+3.*cosd(theta)).^2 + (3-3.*sind(theta)).^2));
F = (300.*4.5.*sind(theta))./(3.*(alpha-theta));
dataXY(:,1) = theta;
dataXY(:,2) = F;
disp('         theta               Force')
disp('')
disp(dataXY)

%% 2
x = 0:1:5000;  %수 나열이고

t = (10000-x)/(8.6) + (sqrt(3000^2 + x.^2)./3.9); %얘도 나열이야
val_t = find(t == min(t)) %t가 최소일때의 인덱스는 몇번째?
ans_t = t(val_t) %그 인덱스에서 t의값은?

%% 3
t = 0:0.5:6;
v = 350* 5280 / 3600; % 마일 피트 단위 변환
h = 1500;

r = sqrt(h^2 + (v.*t).^2 - 2*h*v.*t.*cosd(100));
theta = asind((v.*t.*cosd(80) + h)./r);

data(:,1) = t;
data(:,2) = theta;
data(:,3) = r;

disp('Time(s)   Theta(deg)   r(ft)')
disp('____       ________    _____')
disp(data)

