close all
clc
clear all

%% 1
function r = rtheta(theta)
    r = 3 * sin(3 * cos(0.5 * theta));
end

r1 = rtheta(pi/6);
r2 = rtheta(5*pi/6);

disp(r1)
disp(r2)

theta = linspace(0, 4*pi, 1000);  % 0 <= theta <= 4π
r = rtheta(theta);                % 함수 값 계산

polarplot(theta, r)              % polar plot 그리기
title('Polar Plot of r(\theta) = 3sin(3cos(0.5\theta))')

%% 2
a = [-0.7, 2.1];
b = [9, 18];

function n = untivec(a,b)
c = b-a;
n = c./norm(c);
end

n = untivec(a,b); % function 안이랑 밖이랑 함수 정의 따로 해야함
disp(n)

a = [10, -3.5, -2.5];
b = [-11, 6.5, 5.9];

function n = unitvec(a,b)
c = b-a;
n = c./norm(c);
end

n = unitvec(a,b);
disp(n)

%% 3
function [C, R] = Circle3Pts(P, Q, Rpt)
    
    x1 = P(1); y1 = P(2);
    x2 = Q(1); y2 = Q(2);
    x3 = Rpt(1); y3 = Rpt(2);
    
    A = [2*(x2 - x1), 2*(y2 - y1);
         2*(x3 - x1), 2*(y3 - y1)];

    B = [(x2^2 - x1^2 + y2^2 - y1^2);
         (x3^2 - x1^2 + y3^2 - y1^2)];

    center = A\B; 
   
    radius = sqrt((x1 - center(1))^2 + (y1 - center(2))^2);
    
    C = round(center', 2);
    R = round(radius, 2);

    
    theta = linspace(0, 2*pi, 100);
    x_circle = R*cos(theta) + C(1);
    y_circle = R*sin(theta) + C(2);

    figure
    plot(x_circle, y_circle, 'b-'); hold on;
    plot([P(1) Q(1) Rpt(1)], [P(2) Q(2) Rpt(2)], 'ro', 'MarkerSize', 8);
    axis equal
    grid on
  
end

P = [7, 1.2];
Q = [0.5, 2.6];
Rpt = [-2.4, -1.4];

[C, R] = Circle3Pts(P, Q, Rpt); % 여기서 함수실행
disp('Center ='), disp(C)
disp('Radius ='), disp(R)

%% 3
function [C,R] = circle(p,q,r)

a = [-2*p(1)+2*q(1) -2*p(2)+2*q(2); -2*r(1)+2*q(1) -2*r(2)+2*q(2)];
b = [q(1)^2+ q(2)^2 - p(1)^2 - p(2)^2; q(1)^2+ q(2)^2 - r(1)^2 - r(2)^2];

C = a\b;
R = sqrt((C(1)-p(1))^2 + (C(2)-p(2))^2);

theta = linspace(0,2*pi,200);

x = R*cos(theta)+C(1);
y = R*sin(theta)+C(2);

figure;
plot(x,y,'b-')
hold on;
plot([p(1) q(1) r(1)], [p(2) q(2) r(2)], 'ro')
axis equal
end

p = [7 1.2]; q = [0.5, 2.6]; r = [-2.4, -1.4];
[C,R] = circle(p,q,r)
C
R

%% 4
function [r,th] = AddVecPol(r1,th1,r2,th2)

th1 = deg2rad(th1);
th2 = deg2rad(th2);

x1 = r1*cos(th1); x2 = r2*cos(th2);
y1 = r1*sin(th1); y2 = r2*sin(th2);

x = x1+x2;
y = y1+y2;

r = sqrt(x^2 + y^2);
th = atan2(y, x);
th = rad2deg(th);
end

[r_a, th_a] = AddVecPol(5,23,12,40);
disp(r_a) %disp는 인자 하나만 받을 수 있다. disp(r_a, th_a) 안됨
disp(th_a)
[r_b, th_b] = AddVecPol(6,80,15,125);
disp(r_b)
disp(th_b)

%% 5
function B = matrixsort(A)
    [m, n] = size(A);             % A의 행, 열 크기
    
    % Step 1: 전체 요소를 하나의 벡터로 만든 뒤 내림차순 정렬
    x = reshape(A, 1, []);        % A를 1행짜리 벡터로 변환
    x = downsort(x);              % 걍 함수 이름이 downsort

    % Step 2: 다시 column-wise로 정렬된 값을 행렬에 채움
    B = zeros(m, n);              % 출력 행렬 초기화
    k = 1;                        % 벡터 인덱스

    for col = 1:n
        for row = 1:m
            B(row, col) = x(k);
            k = k + 1;
        end
    end
end

function y = downsort(x)
    n = length(x);
    y = x;

    for i = 1:n-1
        for j = 1:n-i
            if y(j) < y(j+1)
                temp = y(j);
                y(j) = y(j+1);
                y(j+1) = temp;
            end
        end
    end
end

% 밑에 function에서 정렬된 결과 y가 위에 x = downsort(x)의 입력값으로 다시 들어감

A = randi([-30 30], 4, 7);  
disp(A)

B = matrixsort(A);      
disp('정렬된 행렬 B (열별 내림차순):')
disp(B)


  %x = reshape(A, new_rows, new_cols),이 함수는 A의 요소들을 복사해서 새로운 모양(new_rows × new_cols)으로 재배치합니다
  %A의 모든 원소를 한 줄로 쭉 나열한 1행 N열짜리 벡터를 만들어줍니다
  %reshape(A, [], 1)은 반대로 열벡터가 되고요
  %여기서 []는 "남은 크기는 알아서 맞춰줘"라는 뜻이에요.
  %예시 A = [ 1  2  3;
            % 4  5  6 ]

  %x = reshape(A, 1, [])   --->x = [1 4 2 5 3 6]

%% 5 
function B = matrix(A)
    [m, n] = size(A);             % A의 행, 열 크기
    
    % Step 1: 전체 요소를 하나의 벡터로 만든 뒤 내림차순 정렬
    x = reshape(A, 1, []);        % A를 1행짜리 벡터로 변환
    x = down(x);              % 직접 만든 내림차순 정렬 함수 사용

    % Step 2: 다시 column-wise로 정렬된 값을 행렬에 채움
    B = zeros(m, n);              % 출력 행렬 초기화
    k = 1;                        % 벡터 인덱스

    for col = 1:n
        for row = 1:m
            B(row, col) = x(k);
            k = k + 1;
        end
    end
end

function x = down(x)
    n = length(x);
    for i = 1:n-1
        for j = 1:n-i
            if x(j) < x(j+1)
                temp = x(j);
                x(j) = x(j+1);
                x(j+1) = temp;
            end
        end
    end
end


A = randi([-30 30], 4, 7);  
disp(A)

B = matrix(A);      
disp('정렬된 행렬 B (열별 내림차순):')
disp(B)

  
%% 6
function G = Harmean(x)
n = length(x);

for i = 1:n
    k(i) = 1/x(i);
end

G = 1/sum(k);

end

x = [250 320 550 160 1000];
G = Harmean(x);
disp(G)

%% 6
function [P1, P2] = DeltaRos(A,B,C)
P1 = (A+B+C)/3 + (sqrt(2)/3)*(sqrt((A-B)^2 + (B-C)^2 + (C-A)^2));
P2 = (A+B+C)/3 - (sqrt(2)/3)*(sqrt((A-B)^2 + (B-C)^2 + (C-A)^2));
end

A1 = 42*10^-6;
B1 = 970*10^-6;
C1 = 340*10^-6;

A2 = 110*10^-6;
B2 = 80*10^-6;
C2 = -60*10^-6;

[P1, P2] = DeltaRos(A1, B1, C1)
[p1, p2] = DeltaRos(A2, B2, C2)











