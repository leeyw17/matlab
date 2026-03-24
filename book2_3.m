close all
clc
clear all
%%
fzero(@cos, 2)

%%
function f = f4(x)
f = x(1).*exp(-x(1).^2 - x(2).^2);
end

fminsearch(@f4, [0,0])

%%
parfun = @(x,a) x.^3 - 3.*x.^2 + 5.*x.*sin(a.*x/4 - 5.*a/4) + 3;
a = pi;
fun = @(x) parfun(x,a);
xp = 0:0.001:4;
plot(xp,fun(xp))
x1 = fzero(fun, 1.2)
x2 = fminbnd(fun, 0,3)

%% 200pg

fn = @(s,v,A,theta) (s^2 - v^2)./(s^2 + v^2 - 2*v*s*cos(A)) + 2*v.*cos(theta-A)./ ...
    sqrt(s^2 + v^2 - 2*v*s*cos(A))-1;

s = 10;
v = 20;
R = 10;
theta = pi/3;

func = @(A) fn(s,v,A,theta);

%% 
mon = @(th,d,h) 1./(cos(th).^2.*(d*tan(th)-h));
d = 310; h = 33; g = 32.2;
fun = @(th) mon(th,d,h);
theta = fminbnd(fun,0,pi/2);


%%
function see = see_linear(x,tdata, ydata)
a = x(1);
b = x(2);
sse = sum((ydata - a*data-b).^2);
end

%% 206
% t = 0:2:10;
% y = [3.8, 3.5, 2.7, 2.1, 1.2, 0.7];
% function 
% fun = @(x) s(x, t, y);
% x0 = [1, 1];
% coeffs = fminsearch(fun, x0)
% 
% 

%%
function y = subfun(a)
y = a - mean(a);
    function w = mean(x)  %함수 내부에 같은 이름의 중첩 함수가 있으면 → 그 중첩 함수가 내장 함수보다 우선 실행
        w = sqrt(sum(x.^2))/length(x);
    end
end

subfun([-4,4])

a = [-4,4];
b = a-mean(a)


%% 
function yzero = fun_demo1(range)
fun = @testfun;
[yzero,value] = fzero(fun,range);
    function y = testfun(x)
        y = (x.^2-4).*cos(x);
    end
end

yzero = fun_demo1([3,6])

%%
function f = parabola(a,b,c)
f = @p;
    function y = p(x)
        y = polyval([a,b,c],x);
    end
end

% f = parabola(4, -50,5);
% fminbnd(f, -10,10)
