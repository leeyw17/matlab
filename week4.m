close all
clc
clear all

x = linspace(0,2,20);

y1 = x;
y2 = x.^2;
y3 = sqrt(x);

figure()
plot(x,y1,'ko-'); hold on;
plot(x,y2, 'r*--'); hold on;
plot(x,y3,'bs:'); hold on;



figure()
y1 = x;
plot(x,y1,'ko-','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','b','MarkerFaceColor','g')


x = linspace(0,2,20);

y1 = x;
y2 = x.^2;
y3 = sqrt(x);
y4 = exp(x);

figure()

subplot(2,2,1)
plot(x,y1,'ko-');

subplot(2,2,2)
plot(x,y2,'b*--');

subplot(2,2,3)
plot(x,y3,'rs:');

subplot(2,2,4)
plot(x,y4,'g^-');

x = linspace(0,2,20);

y1= x;
y2 = x.^2;
y3 = sqrt(x);

figure()


x = -1:3;
y = 1:4;
[X,Y] = meshgrid(x,y)


x = -1:0.1:3;
y = 1:0.1:4;

[X,Y] = meshgrid(x,y);
Z = X.*Y.^2./(X.^2+Y.^2);
figure()
mesh(X,Y,Z)
xlabel('x'); ylabel('y'); zlabel('Z')

figure()
surf(X,Y,Z)
xlabel('x'); ylabel('y'); zlabel('Z')

