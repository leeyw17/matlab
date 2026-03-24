clear all
clc
close all
%% 246-20
function TriCirc(A, B, C)
    X = [A(1), B(1), C(1), A(1)];
    Y = [A(2), B(2), C(2), A(2)];
    plot(X, Y, 'k-');
    hold on;
    axis equal;

    a = norm(B-C);
    b = norm(C-A);
    c = norm(A-B);
    
    P = a + b + c;
    Ix = (a*A(1) + b*B(1) + c*C(1)) / P;
    Iy = (a*A(2) + b*B(2) + c*C(2)) / P;
    I = [Ix, Iy];

    s = (a+b+c)/2;
    area = sqrt(s*(s-a)*(s-b)*(s-c)); 
    r = area/s;

    plot(I(1), I(2), 'ro', 'MarkerFaceColor', 'r');

    theta = linspace(0, 2*pi, 200);
    x_circ = I(1) + r*cos(theta);
    y_circ = I(2) + r*sin(theta);
    plot(x_circ, y_circ, 'b-');


end

A = [2.6, 3.2];
B = [11, 14.5];
C = [-2, 2.8];
TriCirc(A, B, C);


%%
function y = f3(x)
y = polyval([0.025, -0.0625, -0.333, 1, 0, 0], x);
end

x = fminbnd(@f3, -1, 4)