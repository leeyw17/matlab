close all
clc
clear all
%% 1 for문 사용
a(1)=0;
a(2)=1;
for k = 1:1:23
    a(k+2) = a(k+1) + a(k);
end
a

%% 1 else 사용
for k = 1:25
    if k == 1
        a(k) = 0;
    elseif k == 2
        a(k) = 1;
    else
        a(k) = a(k-1) + a(k-2);
    end
end
a

%% 1 while문 사용
a(1) = 0; a(2) = 1;
n = 1;
while length(a) < 25
    a(n+2) = a(n+1) + a(n);
    n = n+1;
end
a
%% 2
format short
x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];
a = zeros(1, length(x));  % 정렬된 값을 담을 배열 a

for k = 1:length(x)
    [val, idx] = min(x);  % 현재 x에서 가장 작은 값과 그 위치
    a(k) = val;           % 최소값을 a에 저장
    x(idx) = [];          % 최소값은 x에서 제거
end

disp(a)

%% 2
x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];
a = [];  % 정렬된 값을 담을 배열 a

for k = 1:length(x)
    [val, idx] = min(x);  % 현재 x에서 가장 작은 값과 그 위치
    a(k) = val;           % 최소값을 a에 저장
    x(idx) = [];          % 최소값은 x에서 제거
end

a

%x = [7 3 9 2];

% 하나만 받을 때
%v = min(x)
% 결과: v = 2

% 둘 다 받을 때
%[v, idx] = min(x)
% 결과: v = 2, idx = 4 (4번째 값이 2임)

%% 2
x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];
n = length(x);

for i = 1:n-1
    for j = 1:n-i
        if x(j) > x(j+1)
            temp = x(j);
            x(j) = x(j+1);
            x(j+1) = temp;
        end
    end
end

disp(x)


%% 3
perfect = [];     
n = 2;          

while length(perfect) < 4
    sumdiv = 0;  

    for i = 1:n-1
        if rem(n, i) == 0
            sumdiv = sumdiv + i;  
        end
    end

    if sumdiv == n
        perfect(end+1) = n;        
    end

    n = n + 1;
end

disp(perfect)

%% 3
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

%% 4  
format long

x = [];
n1 = 10;

for i = 0:n1
    x(i+1) = ((-1)^(i))/((2*(i)+1)^3);
end

s1 = sum(x);
disp((32*s1)^(1/3))

n2 = 100;
for i = 0:n2
    x(i+1) = ((-1)^(i))/((2*(i)+1)^3);
end

s2 = sum(x);
disp((32*s2)^(1/3))

disp("나는 바보 도기도기");


%% 1
a(1) = 0;
a(2) = 1;
if length(a) < 25
    for n = 1:23
        a(n+2) = a(n+1) + a(n);
    end
end
a

%% 2
x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];
n = length(x);
a=[];
format short
for i = 1:n
    [val, idx] = min(x);
    x(idx) = [];
    a(i) = val;
end

a

%% 3
num =0
if length(per) < 4
    num = num +1;
    for i = 1 : num-1
        if rem(num,i) == 0
            fac(end+1) =  i;
        end
    end

    if num == sum(fac)
        per(end+1) = num;
    end
end

per


