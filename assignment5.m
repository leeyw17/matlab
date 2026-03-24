clear all
clc
close all

%% 1
function [V,S] = VolSArea(r,R,h)
x = h/(R-r);
V = (pi/3)*(R^2*(h+x)-r^2*x);
l = sqrt((R-r)^2 + h^2);
S = pi*r^2 + pi*R^2 + pi*(R+r)*l;
end

[v1,s1] = VolSArea(2,3.5,4.25)
[v2,s2] = VolSArea(2.5,3.5,4.5)

%% 2
function th = ang(A,B,C)
a = sqrt((B(1)-C(1))^2 + (B(2) - C(2))^2 + (B(3) - C(3))^2);
b = sqrt((A(1)-C(1))^2 + (A(2) - C(2))^2 + (A(3) - C(3))^2);
c = sqrt((B(1)-A(1))^2 + (B(2) - A(2))^2 + (B(3) - A(3))^2);

th = acosd((a^2 + c^2 - b^2)/(2*a*c));
end
A1 = [-5, -1, 6];
B1 = [2.5, 1.5, -3.5];
C1 = [-2.3, 8, 1];

A2 = [-5.5, 0, 0];
B2 = [3.5, -6.5, 0];
C2 = [0, 7, 0];
[th1] = ang(A1, B1, C1)
[th2] = ang(A2, B2, C2)

%% 2
function th = anglines(A, B, C)
    u = A - B;       
    v = C - B;      
    cos_theta = dot(u, v) / (norm(u) * norm(v));  % 내적 공식
    th = acosd(cos_theta);  % 각도를 degree로 반환
end
A1 = [-5, -1, 6];
B1 = [2.5, 1.5, -3.5];
C1 = [-2.3, 8, 1];

A2 = [-5.5, 0, 0];
B2 = [3.5, -6.5, 0];
C2 = [0, 7, 0];
[th1] = anglines(A1, B1, C1)
[th2] = anglines(A2, B2, C2)

%% 3 
function A = APolygon(Crd)
[m,n] = size(Crd);
area = zeros(1, n-2); 
for i = 1:n-2
    u = Crd(1:2,i+2) - Crd(1:2,1);
    v = Crd(1:2,i+1) - Crd(1:2,1);
    cos_theta = dot(u, v)/(norm(u)*norm(v));
    th = acos(cos_theta);
    area(i) = (1/2).*norm(u).*norm(v).*sin(th);
end
A = sum(area);
end

Crd = [1 7 10 9 6 1 -3 -4; 1 2 5 11 12 12 8 4];

A = APolygon(Crd)


%% 4 
function pr = Tureprime(m)
factor= [];
if floor(m) == m % floor은 정수부분 뽑아내는 함수
    for i = 1:m
    if rem(m,i) == 0 % rem은 나머지를 구하는 기능 
        factor(end+1) = i;
    end
    end
    if length(factor) == 2
        pr =1
     else
            pr = 0
    end
else
     disp('The input argument must be a positive integer.')
     pr = 0;
     % 무조건 pr 이 뭔지 할당해줘야함 그래야 돌아감
    
end
end

m = input('m을 입력하세요');
pr = Tureprime(m);


%% 5
% function y = sinTay(x)
% 
% x = mod(x,360);
% if x > 180
%     x = x-360;
% end
% Tay =[];
% E = 1;
% k = 0;
% 
% while E > 1e-6
%     Tay(k+1) = ((-1)^k) * x^(2*k + 1) / factorial(2*k + 1);
%     E = abs(Tay(k+1)/Tay(k));
%     k = k+1;
% end
% x = sum(Tay);
% end
% 
% sinTay(39)
% 

%% 5
function y = sinTay(x)
    x = mod(x, 360);
    if x > 180
        x = x - 360;
    end

    x = x * pi / 180;  % 라디안으로 변환

    Tay = [];
    E = 1;
    k = 1;

    while E > 1e-6
        Tay(k) = ((-1)^(k-1)) * x^(2*(k-1)+1) / factorial(2*(k-1)+1);
        if k > 1
            E = abs(Tay(k) / Tay(k-1));
        end
        k = k + 1;
    end

    y = sum(Tay);
end

sinTay(39)


%% 6
function dfdx = foptder(fun, x0)
h = 0.6;
dfdx = (fun(x0-2*h) - 8*fun(x0-h) + 8*fun(x0+h) - fun(x0+2*h))/(12*h);
end

f = @(x) x^2*exp(x);
g = @(x) x^3*exp(2*x);

foptder(f,0.6)
foptder(g,0.6)


%% 7

function RV = filtarfreq(R,C,L,f)
w = 2*pi.*f;
RV = abs((R-R.*w.^2*L*C)./sqrt((w.*L).^2) + (R-R.*w.^2*L*C).^2);
end

f = linspace(10,100000,200);
RV1 = filtarfreq(200, 160*10^-6, 45*10^-3, f);
RV2 = filtarfreq(50, 160*10^-6, 45*10^-3, f);


figure;
semilogx(f,RV1,'b-'); hold on;
semilogx(f,RV2,'r-');
xlabel('Frequency'); ylabel('Voltage Ratio');
legend('RV1','RV2')

%% 8
function x = lotto(a,b,n)
x = randperm(b-a+1,n) + a - 1;
end

lotto(1,59,7)
lotto(50,65,8)
lotto(-25,-2,9)