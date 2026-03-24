clear all
clc
close all

%% 1

V = 4000:-500:1000;

r = ((3*V)./(4*pi)).^(1/3);
S = 4*pi.*r.^2;

r = round(r);
S = round(S); %반올림

ans1 = [r' V' S']

%% 2
theta = (5:5:35);
mu = 0.35;
f = (20*mu)./(mu.*sind(theta) + cosd(theta));

theta_b = (5:0.01:35);
f_b = (20*mu)./(mu.*sind(theta_b) + cosd(theta_b));
ansb = min(f_b)

k = find(f_b == min(f_b)); %f_b가 최소인 인덱스 위치를 찾아줌, 1430번 위치에서 최소
theta_min = theta_b(k) %theta_b(k)는 1430번째 각도를 찾아줌 -> 그때가 f_b가 최소일때의 각도



%find 안쓰고 이렇게 할수도 있습니다
[val, idx] = min(f_b)
theta_b(idx)


%% 3

r1 = [2.5 8 -5];
r2 = [-1 6 3];

theta_3 = asind(norm(cross(r1,r2))/(norm(r1)*norm(r2)))

%% 4
format long
a = 1:1:5;
b = 1:1:50;
c = 1:1:5000;

suma = sum(1./(a).^2)
sumb = sum(1./(b).^2)
sumc = sum(1./(c).^2)

inf_series = (pi)^2/6

%% 5
x = [1 0.1 0.01 0.001 0.0001];
ans5 = (5*sin(6.*x))./(4.*x)

%% 6
%1mile=5280 feet, 1 hour=3600 seconds
t = [0 : 1 : 10];
train_pos = -400 + 54*(5280/3600).*t;
car_pos = -200 + 28*(5280/3600).*t  +(1/2)*4.*(t.^2);

distance = sqrt((train_pos).^2 + (car_pos).^2);
car_speed = 28 + 4.*t;
rel_speed = distance./t;

ans6 = [t' train_pos' car_pos' distance' car_speed' rel_speed']