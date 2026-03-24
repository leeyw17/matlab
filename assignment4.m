clear all
clc
close all

%% 1
a = [93, 77, 51, 62, 99, 41, 82, 77, 71, 68, 100, 46, 78, 80, 83];
numgrade = length(a);
ave = mean(a);
stdgrade = std(a);

%% 2
x = [0.15 0.35 0.5 0.7 0.85];
y = [0.08909  0.09914 0.08823 0.06107 0.03421];

A = [sqrt(x(1)) x(1) x(1)^2 x(1)^3 x(1)^4; ...
    sqrt(x(2)) x(2) x(2)^2 x(2)^3 x(2)^4; ...
    sqrt(x(3)) x(3) x(3)^2 x(3)^3 x(3)^4; ...
    sqrt(x(4)) x(4) x(4)^2 x(4)^3 x(4)^4; ...
    sqrt(x(5)) x(5) x(5)^2 x(5)^3 x(5)^4];

B = [y(1) y(2) y(3) y(4) y(5)];

A\B'

%% 3
A = [cosd(50) 1 0 0 0 0 0 0 0 0 0;...
    sind(50) 0 0 0 0 0 0 0 0 0 0;...
    0 -1 0 0 0 1 0 0 0 0 0;...
    -cosd(50) 0 0 1 cosd(41) 0 0 0 0 0 0;...
    sind(50) 0 1 0 sind(41) 0 0 0 0 0 0;...
    0 0 0 0 -sind(41) -1 0 0 0 1 0;...
    0 0 0 0 sind(41) 0 1 0 0 0 0;...
    0 0 0 -1 0 0 0 1 cosd(37) 0 0;...
    0 0 0 0 0 0 -1 0 -sind(37) 0 0;...
    0 0 0 0 0 0 0 0 -cosd(37) -1 0;...
    0 0 0 0 0 0 0 0 sind(37) 0 1];

B = [0 400 0 0 800 0 1200 0 0 4933 0];

A\B'

%% 4
x = 50:0.1:200; % ,가 아니라 : 인거 주의하렴 ...
distance = x + 2.*sqrt((210-x).^2 + 80^2);

[val, dix] = min(distance)

%% 5
disp('세 점의 좌표를 입력하세요:');
x1 = input('첫 번째 점의 x좌표: ');
y1 = input('첫 번째 점의 y좌표: ');
x2 = input('두 번째 점의 x좌표: ');
y2 = input('두 번째 점의 y좌표: ');
x3 = input('세 번째 점의 x좌표: ');
y3 = input('세 번째 점의 y좌표: ');

A = [-2*(x1-x2), -2*(y1-y2); -2*(x3-x1), -2*(y3-y1)];
B = [-(x1^2+y1^2-x2^2-y2^2); -(x3^2+y3^2-x1^2-y1^2)];
sol = A\B

r = sqrt((11.5-sol(1))^2 + (5-sol(2))^2)

%% 6
num = input('n을 입력하세요');
a = sqrt(2)/2

for n = 1:num
     val(n) = a;
     a = sqrt(2+2*a)/2;
end

est_pi = 2./prod(val)

%% 7 좋다
a = input('a값을 입력하세요');
x = input('x값을 입력하세요');

n = 0;
E = 1; %루프를 돌리기위한 초기오차값 임의로 지정.. 참이어야 일단 돌아가니까

while E>=0.000001
    c(n+1) = ((log(a))^n/factorial(n))*x^n;
    E = abs(c(n+1)/(sum(c)-c(n+1)));   %여기서 첫번째 루프때 분모가 0이 되는 오류가 있지만 매트랩은 분모 0이어도 계산 계속 함
    n = n+1;
end

sum(c)

%% 7
n = 0;
term = 1;
Sn = term;
E = 1;

while E >= 1e-6
    n = n + 1;
    term = ((log(a))^n / factorial(n)) * x^n;
    S_prev = Sn;
    Sn = Sn + term;
    E = abs((Sn - S_prev) / S_prev);
end

%% 8
t = 0:0.5:10;
y = sin(t) -0.1 + 0.2*rand(1,length(t));
y_smooth = y;

for i = 2:length(y)-1
    y_smooth(i) = (y(i-1) + y(i) + y(i+1)) / 3;
end

figure()
plot(t, y, 'r.-'); hold on;
plot(t, y_smooth, 'b.-');

%% 9 좋다

B = 10;
%바깥에서 초기화하면 누적돼서 안됨

for i = 1:100 % !!중요!! 이거 그냥 루프 100번 반복해줌
    x = 0;  %“매 반복마다 새로 시작해야 하나?” → 안에서 초기화
    step = 0;
    while abs(x)<10
        s = randn(1,1);
        x = x + s;
        step = step+1;
    end
    k(i) = step;
end
mean(k)


%% 10 좋다
n = input('숫자를 입력하세요');
x(1) = 0;
y(1) = 0;

for i = 1:n
    k = randi(3);  
    if k == 1
        x(i+1) = 0.5 * x(i);
        y(i+1) = 0.5 * y(i);
    elseif k == 2
        x(i+1) = 0.5 * x(i) + 0.25;
        y(i+1) = 0.5 * y(i) + sqrt(3)/4;
    else  
        x(i+1) = 0.5 * x(i) + 0.5;
        y(i+1) = 0.5 * y(i);
    end
end

figure;
plot(x,y);



















