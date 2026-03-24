clear all
clc
close all

%% 5.14-11번 161pg
x = linspace(-1,1,1000);
y = (1 - abs(x).^(2/3)).^(3/2);  

figure;
plot(x, y); hold on;
plot(x, -y);

%% 19번
theta = linspace(0,2*pi,1000);
r = 2.*cos(theta).*sin(theta)./(cos(theta).^3 + sin(theta).^3); % 분모가 0이되는경우 어케 처리?
x = r.*cos(theta);
y = r.*sin(theta);

figure;
plot(x,y)

%% 23번
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

%% 
linspace(0,4.5,100);


%% 208pg-18

pita = [];
for a = 1:50
    for b = a:50   
        c2 = a^2 + b^2;
        c = sqrt(c2);
        if c == floor(c) && c <= 50
            pita = [pita; a b c];
        end
    end
end

pita

%다른풀이
pita=[];
for a = 1:50
    for b = a:50
        c2 = a^2+b^2;
        c = sqrt(c2);
        if c == floor(c)           
            if c <= 50
                pita = [pita; a b c];
            end
        end
    end
end

pita

%% 208pg-19
num = [];
for i = 100:999
    hun = floor(i / 100);           % 백의 자리 floor = 소수점 이하를 버리고 내림 312/100 -> 3.12-> 3
    ten = floor(mod(i, 100) / 10);  % 십의 자리 mod = 나머지를 구하는 함수
    one = mod(i, 10);               % 일의 자리

    if hun*ten*one == 6*(hun + ten + one)
        num(end+1) = i;
    end
end

disp(num)

%% 208pg-20
primes=[];
for i = 1:500
    div=[];
    for n = 1:i     
        if mod(i,n) == 0
            div(end+1) = n;
        end
    end
        if length(div) == 2
                primes(end+1) = i;
        end
end

safe=[];
for i = 1:1000
    for n = 1:length(primes)
        if i == 2*primes(n)+1
            for k = 1:length(primes)
                if i == primes(k); 
                    safe(end+1) = i;
                end
            end
        end
    end
end
                
safe


%% 208pg - 21번
primes = [];
for i = 1:300
    div = [];
    for n = 1:i
        if mod(i,n) == 0 
            div(end+1) = n;
        end
    end
        if length(div) == 2
            primes(end+1) = i;
        end
    
end

sexy = [];
for i = 1:length(primes)
    for n = i : length(primes)
        if abs(primes(i) - primes(n)) == 6
            sexy = [sexy; primes(i) primes(n)];
        end
    end
end

sexy

%% 208-22
primes = [];
for i = 1:10000
    div = [];
    for n = 1:i
        if mod(i,n) == 0 
            div(end+1) = n;
        end
    end
        if length(div) == 2
            primes(end+1) = i;
        end
    
end

mer=[];

for n = 1:13
    for i = 1:length(primes)
        if primes(i) == 2^n-1
            mer(end+1) = primes(i);
        end
    end
end

mer

%% 209-23
perfect_num = [];
for i = 1:10000
    div=[];
    for n = 1:i
        if mod(i,n) == 0
            div(end+1) = n;
        end
    end
    k = length(div);
    sum_perfect = sum(div) - div(k);
    if sum_perfect == div(k)
        perfect_num(end+1) = div(k);
    end
end

perfect_num

%% 209-23
perfect_num = [];
i = 1;

while length(perfect_num) < 4
    div = [];
    for n = 1:i-1
        if mod(i,n) == 0
            div(end+1) = n;
        end
    end
    if sum(div) == i
        perfect_num(end+1) = i;
    end
    i = i + 1;
end

perfect_num

%% 213 - 38
for i = 10:99
    ten = floor(i / 10);
    one = mod(i, 10);
    seq = [ten, one];

    next = sum(seq);
    
    while next < i 
        seq = [seq(end), next]; 
        next = sum(seq);
    end

    if next == i
        disp(i)
    end
end