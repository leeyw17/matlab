clear all
clc
close all
%%
% n = input('n:');
% t = linspace(0,30,200);
% sum_f = zeros(size(t));         % 누적합 벡터
% 
% for k = 0:n-1
%     sum_f = sum_f + sin((2*k+1)*t)/(2*k+1);
% end
% 
% sum_f = (4/pi) * sum_f;
% figure;
% plot(t,sum_f)
% 
% 
% %%
% 
% a(1) = 0; a(2) = 1;
% 
% if length(a) < 25
%     for n = 1:23
%         a(n+2) = a(n+1) + a(n);
%     n = n+1;
%     end
% 
% end
% 
% a
% 
% %%
% a(1) = 0; a(2) = 1;
% n = 1;
% while length(a) < 25
%     a(n+2) = a(n+1) + a(n);
%     n = n+1;
% end
% 
% a
% 
% %%
% x = [9 -1.5 13.4 13.3 -2.1 4.6 1.1 5 -6.1 10 0.2];
% vec = [];
% for i = 1:length(x)
%     [val,idx] = min(x);
%     vec(end+1) = val;
%     x(idx) = [];
% end
% 
% vec
% 
% %%
% 
% function [C,R] = circle(p,q,r)
% 
% a = [-2*p(1)+2*q(1) -2*p(2)+2*q(2); -2*r(1)+2*q(1) -2*r(2)+2*q(2)];
% b = [q(1)^2+ q(2)^2 - p(1)^2 - p(2)^2; q(1)^2+ q(2)^2 - r(1)^2 - r(2)^2];
% 
% C = a\b;
% R = sqrt((C(1)-p(1))^2 + (C(2)-p(2))^2);
% 
% theta = linspace(0,2*pi,200);
% 
% x = R*cos(theta)+C(1);
% y = R*sin(theta)+C(2);
% 
% figure;
% plot(x,y,'b-')
% hold on;
% plot([p(1) q(1) r(1)], [p(2) q(2) r(2)], 'ro')
% axis equal
% end
% 
% p = [7 1.2]; q = [0.5, 2.6]; r = [-2.4, -1.4];
% [C,R] = circle(p,q,r)

%% dini's surface
u = linspace(0,4*pi,100);
v = linspace(0,pi,100);
a = 0.5;

[U,V] = meshgrid(u,v);

X = cos(U).*sin(V);
Y = sin(U).*sin(V);
Z = cos(V) + log(tan(V./2)) + a.*U;
figure;
surf(X, Y, Z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Dini''s Surface');

%% klein bottle
u = linspace(0,2*pi,50);
v = linspace(0,2*pi,50);

[U,V] = meshgrid(u,v);
X = -(4-2.*cos(U)).*cos(V) + 6*(sin(U)+1).*cos(U);
Y = 16.*sin(U);
Z = (4-2.*cos(U)).*sin(V);

figure;
surf(X,Y,Z);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('Klein Bottle');
axis equal;

%% halvorsen attractor

% function halvorsen_demo
%     a = 1.4;            
%     x0 = [1 0 0];         
%     tspan = [0 150];      
% 
%     opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
%     [t, X] = ode45(@(t,x) halvorsen(t,x,a), tspan, x0, opts);
% 
% 
%     cut = min(2000, size(X,1)-1);
%     Xp = X(cut:end,:);
% 
%     figure('Color','w');
%     plot3(Xp(:,1), Xp(:,2), Xp(:,3), 'LineWidth', 0.8);
%     grid on; axis vis3d
%     xlabel('x'); ylabel('y'); zlabel('z');
%     title(sprintf('Halvorsen attractor (a=%.2f, x0=[%.2f %.2f %.2f])', a, x0));
% end
% 
% function dx = halvorsen(~, x, a)
%     X = x(1); Y = x(2); Z = x(3);
%     dx = [
%         -a*X - 4*Y - 4*Z - Y^2;
%         -a*Y - 4*Z - 4*X - Z^2;
%         -a*Z - 4*X - 4*Y - X^2
%     ];
% end
% 
% ICs = [1 0 0; 0.5 -0.3 0.8; 2 2 2];
% a = 1.4; tspan = [0 150]; opts = odeset('RelTol',1e-8,'AbsTol',1e-10);
% figure('Color','w'); hold on; grid on; axis vis3d
% xlabel x; ylabel y; zlabel z; title('Halvorsen (여러 초기값)')
% for k = 1:size(ICs,1)
%     [~,X] = ode45(@(t,x)halvorsen(t,x,a), tspan, ICs(k,:), opts);
%     cut = min(2000, size(X,1)-1);
%     Xp = X(cut:end,:);
%     plot3(Xp(:,1), Xp(:,2), Xp(:,3), 'LineWidth', 0.8);
% end
% legend("x0=[1 0 0]","x0=[0.5 -0.3 0.8]","x0=[2 2 2]")

%% halvorsen attractor
% a = 1.4;
% fx = @(x,y,z) -a*x -4*y -4*z - y^2;
% fy = @(x,y,z) -a*y -4*z -4*x - z^2;
% fz = @(x,y,z) -a*z -4*x -4*y - x^2;
% 
% [t,X] = ode45(fx,[0 150],1);
% [t,Y] = ode45(fy,[0 150],0);
% [t,Z] = ode45(fz,[0 150],0);
% 
% figure;
% plot(t,X); hold on;
% plot(t,Y); hold on;
% plot(t,Z);

a = 1.4;
x0 = [1 0 0];
tspan = [0 150];

function dx = halvorsen2(~, x, a)
    X = x(1); Y = x(2); Z = x(3);
    dx = [
        -a*X - 4*Y - 4*Z - Y^2;
        -a*Y - 4*Z - 4*X - Z^2;
        -a*Z - 4*X - 4*Y - X^2
    ];
end

[t,X] = ode45(@(t,x) halvorsen2(t,x,a), tspan, x0);
figure;
plot3(X(:,1), X(:,2), X(:,3), 'LineWidth', 0.8);
grid on; xlabel('x'); ylabel('y'); zlabel('z');
title('Halvorsen attractor (ode45)');

%%
a = 2;
x = linspace(-sqrt(3), sqrt(3), 2000);
y = abs(x).^(2/3) + 0.9.*sin(a.*x).*sqrt(3-x.^2);

plot(x,y,'r-')
xlim([-1.8 1.8]); ylim([-0.2 2.6]);