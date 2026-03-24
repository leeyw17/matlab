clear all
clc
close all
%% 1
function p = polyadd(p1,p2,operation)
if operation == 1
    p = p1 + p2;
else
    p = p1 - p2;
end
end

p1 = [8 10 0 -5 13 -4 -2];
p2 = [0 0 4 0 7 0 6];

polyadd(p1,p2,1) % 숫자가 문자로 설정하는것보다 유용함 문자로 하는순간 매트랩은 그 문자가 뭔지 찾기시작
polyadd(p1,p2,2)

%% 2
function [x,y,z] = maxormin(a,b,c)
k = polyder([a b c]);
x = roots(k)
y = polyval([a b c], x)
if a < 0
    w = 1
else
    w = 2
end
end

maxormin(3, -7, 14)
maxormin(-5, -11, 15)

%% 3 조타
y = linspace(0,4,200);
p = [4 -32 97 -136 80];
d = sqrt(polyval(p,y));
figure;
plot(y,d)

p = [4 -32 97 -136 71];
y_roots = roots(p);
real_y = y_roots(imag(y_roots) == 0) % 실근만 구하는 방법이다 허수부가 0인 근만 True로 만족시켜서 출력된다
x = 2.*(real_y-2).^2 + 3

p = [4 -32 97 -136 80];
dpdy = polyder(p)
rootsdy = roots(dpdy)
real_rootsdy = rootsdy(imag(rootsdy) == 0)
ans_d = sqrt(polyval(p,real_rootsdy))

%% 4
for i = 0:11
    h(i+1) = 3*i;
end

D = [1.2, 0.91, 0.66, 0.47, 0.31, 0.19, 0.12, 0.075, 0.046, 0.029, 0.018, 0.011];

figure;
plot(h,D);

figure;
semilogx(h,D);

figure;
semilogy(h,D);

figure;
loglog(h,D);

%% 5
t = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0];
C = [1.7 3.1 5.7 9.1 6.4 3.7 2.8 1.6 1.2 0.8 0.7 0.6];

A = [t(1)^2 t(1) 1; t(2)^2 t(2) 1; t(3)^2 t(3) 1];
B = [1/C(1) ; 1/C(2) ; 1/C(3)];

ans = A\B

a2 = ans(1);
a1 = ans(2);
a0 = ans(3);

C_t2 = 1/(a2*(2)^2 + a1*2 + a0)

%% 5 조타
t = [0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0];
C = [1.7 3.1 5.7 9.1 6.4 3.7 2.8 1.6 1.2 0.8 0.7 0.6];

Y = 1./C;

p = polyfit(t,Y,2); %2차원이니까 자동으로 계수가 t^2 t 1 이렇게 되는겨 그래서 걍 t라고 쓰는거임
C_t = @(t) 1./polyval(p,t);
C_t2 = C_t(2); %t가 2일때의 값


input = linspace(0,6,200);
output = C_t(input);  % 이렇게 함수처럼 호출해야 함

figure;
plot(t, C, 'ro'); hold on;
plot(input, output, 'b-');


Y = 1./C;

p = polyfit(t,Y,3); 
C_t = @(t) 1./polyval(p,t);
C_t2 = C_t(2); 


input = linspace(0,6,200);
output = C_t(input);  

figure;
plot(t, C, 'ro'); hold on;
plot(input, output, 'b-');


%% 6
x = [5 10 15 20 25 30 35 40 45 50];
y = [15 25 32 33 37 35 38 39 41 42];

invx = 1./x;
invy = 1./y;

p = polyfit(invx, invy,1);
a = 1/p(2);
b = a*p(1);

x_esti = 23;
y_esti = (a*x_esti)/(b + x_esti)

y_fit = (a.*x)./(b + x);

figure;
plot(x, y, 'bo', 'MarkerFaceColor', 'b'); hold on;
plot(x, y_fit, 'r-', 'LineWidth', 2);          
xlabel('x');
ylabel('y');

