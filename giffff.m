clear all
clc 
close all
%% 

%% 

v_0 = 20;
theta = 30;
alpha = 25;
g = 9.81;


v_x = v_0*sind(theta)*cosd(alpha);
v_y = v_0*sind(theta)*sind(alpha);
v_z = v_0*cosd(theta);

t_b = (2*v_z)/g;

T1 = t_b;
T2 = T1 * 0.8;
T3 = T2 * 0.8;
T4 = T3 * 0.8;
T5 = T4 * 0.8;

dt = 0.01;
t_all = 0:dt:(T1+T2+T3+T4+T5);

x_all = zeros(size(t_all));
y_all = zeros(size(t_all));
z_all = zeros(size(t_all));

for i = 1:length(t_all)
    t = t_all(i);

    if t <= T1
        x = v_x*t;
        y = v_y*t;
        z = v_z*t - 0.5*g*t^2;
    elseif t <= T1+T2
        tau = t - T1;
        x = v_x*t;
        y = v_y*t;
        z = 0.8*v_z*tau - 0.5*g*tau^2;
    elseif t <= T1+T2+T3
        tau = t - T1 - T2;
        x = v_x*t;
        y = v_y*t;
        z = (0.8^2)*v_z*tau - 0.5*g*tau^2;
    elseif t <= T1+T2+T3+T4
        tau = t - T1 - T2 - T3;
        x = v_x*t;
        y = v_y*t;
        z = (0.8^3)*v_z*tau - 0.5*g*tau^2;
    else
        tau = t - T1 - T2 - T3 - T4;
        x = v_x*t;
        y = v_y*t;
        z = (0.8^4)*v_z*tau - 0.5*g*tau^2;
    end

    x_all(i) = x;
    y_all(i) = y;
    z_all(i) = max(z, 0);  
end

filename = 'bouncing_ball.gif';
figure('Color','w');
axis tight manual
hold on

plot3(x_all, y_all, z_all, 'k--');
xlabel('x (m)'); ylabel('y (m)'); zlabel('z (m)');
grid on
axis equal
view(45,25)

for i = 1:10:length(t_all)
    cla
    plot3(x_all, y_all, z_all, 'k--'); hold on
    plot3(x_all(i), y_all(i), z_all(i), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 10);
    xlim([0 max(x_all)]); ylim([0 max(y_all)]); zlim([0 max(z_all)*1.1]);
    view(45,25)
    drawnow

    frame = getframe(gcf);
    img = frame2im(frame);
    [imind, cm] = rgb2ind(img, 256);

    if i == 1
        imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 0.02);
    else
        imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 0.02);
    end
end


%%
[x, y, z] = sphere(40);
r = 1;
x = r * x;
y = r * y;
z = r * z + 1;  

figure;
axis equal
axis([-3 3 -3 3 0 3])
view(35,30)
hold on
grid on

project_shadow = @(x, y, z, light_pos) deal( ...
    x - z * (light_pos(1)/light_pos(3)), ...
    y - z * (light_pos(2)/light_pos(3)), ...
    zeros(size(z)));

surf(x, y, z, 'FaceColor', 'blue', 'EdgeColor', 'none', 'FaceAlpha', 1);
material shiny

light_obj = light('Position', [5 0 5], 'Style', 'infinite');


for deg = 0:1:1800
    light_pos = [5*cosd(deg), 5*sind(deg), 5];

    delete(findobj(gca, 'Tag', 'shadow'))

    [xs, ys, zs] = project_shadow(x, y, z, light_pos);
    surf(xs, ys, zs, 'FaceColor', [0 0 0], 'EdgeColor', 'none', ...
         'FaceAlpha', 0.3, 'Tag', 'shadow');
   
    set(light_obj, 'Position', light_pos);

    pause(0.005);
end





%%
L = 2.5; N = 40;
M = [0:(N/2) (-N/2):(-1)]';
clf; kx = 2*pi*M/L;
[Kx,Ky,Kz] = meshgrid(kx,kx,kx);
x = -L/2:L/N:L/2;
[X,Y,Z] = meshgrid(x,x,x);
Phi = 2-(2*X.^2 + Y.^2 + Z.^2 -1).^3 + 0.2*X.^2.*Z.^3 + Y.^2.*Z.^3;
Phihat = fftn(Phi);
gam = 0.01*(-Kx.^2-Ky.^2-Kz.^2);
t1 = 0:0.05:1;
t1 = [t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1) t1 fliplr(t1)];
clf;
set(gcf,'color','w');
t = 1;
Phi = ifftn(Phihat.*exp(gam*t1(t)));
isosurface(Phi,2);
lighting phong;
colormap([1 0 0]);
axis([0 N+N/4 0+-10 N+N/4 0 N+N/4]);
view(-63,12); box off;
grid on
set(gca,'XTick',[],'YTick',[],'ZTick',[],...
    'xcolor','w','ycolor','w','zcolor','w')
drawnow;
pumpAmplitudeScaleFactor = 0.04;
for ii = 1:0.5:50
    zoomval = 1+pumpAmplitudeScaleFactor*sin(ii);
    zoom(zoomval)
    pause(0.05)
end

%%
% Cute Puffy Star with Soft "Pop"
L = 2.5; N = 70;
x = linspace(-L, L, N);
[X,Y,Z] = meshgrid(x,x,x);

set(gcf,'color',[0.02 0.03 0.08]); axis equal off; view(3);
light('style','infinite'); lighting gouraud; camproj('perspective');

% 스파클 방향(고정)
rng(7);
numSpark = 160;
U = randn(numSpark,3); U = U./vecnorm(U,2,2);

for t = 1:160
    % 구면좌표
    r = sqrt(X.^2 + Y.^2 + Z.^2);
    theta = atan2(sqrt(X.^2 + Y.^2), Z);
    phi   = atan2(Y,X);

    % ★ 말랑 별 요철(부드럽게): 뾰족함 ↓, 시간에 따른 살랑살랑
    wobble = 0.06 * sin(0.12*t);
    A = 0.12 + wobble;                          % 작고 말랑한 진폭
    bump = A .* cos(5*phi) .* (sin(theta)).^4;  % 부드러운 별 패턴

    % 팽창(부드러운 pop)
    explode = 0.0025 * (t^1.7);  % 서서히 커짐
    R  = 1 + bump + explode;
    Phi = r - R;

    clf
    p = patch(isosurface(X,Y,Z,Phi,0));
    isonormals(X,Y,Z,Phi,p);
    
    % 파스텔 톤 + 반투명 + 과도한 하이라이트 제거
    pastel = [1.00, 0.88 + 0.06*cos(0.03*t), 0.70 + 0.10*sin(0.03*t)];
    pastel = min(max(pastel,0),1);
    set(p,'FaceColor',pastel,'EdgeColor','none','FaceAlpha',0.65);
    material dull
    camlight headlight; camlight; 
    axis([-1.8 1.8 -1.8 1.8 -1.8 1.8]);

    % 살짝 회전(부드럽게)
    camorbit(0.35, 0.15, 'camera');

    hold on
    % 팝 이후 스파클(작고 귀엽게)
    if t > 110
        dt = t - 110;
        s = 1.05 + 0.03*(dt.^1.6);              % 반경 증가(부드럽게)
        P = U * s;                              % 점 위치
        sz = 12 * (1 + 0.2*sin(0.4*t));         % 크기 살짝 떨림
        c  = [ones(numSpark,1), ones(numSpark,1)*0.98, 0.95*ones(numSpark,1)];
        h = scatter3(P(:,1),P(:,2),P(:,3), sz, c, 'filled');
        if verLessThan('matlab','9.9')==0       % R2020b+면 알파 적용
            set(h,'MarkerFaceAlpha',0.85,'MarkerEdgeAlpha',0.0);
        end
    end

    % 팝이 진행될수록 살짝 사라지기
    if t > 130
        a = max(0.65 - 0.02*(t-130), 0.05);
        set(p,'FaceAlpha',a);
    end

    drawnow;
end
