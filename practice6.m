close all
clc
clear all

%% 1
p = [2 -256 8094 6240];
c = roots(p);

c = round(c)
b = 142-2*c
a = c-57

%% 2
function p = polymult(p1, p2)
    n1 = length(p1);
    n2 = length(p2);
    p = zeros(1, n1 + n2 - 1);  

    for i = 1:n1
        for j = 1:n2
            p(i + j - 1) = p(i + j - 1) + p1(i) * p2(j);
        end
    end
end
p1 = [-2 0 3 4 0 -7 8];     
p2 = [5 0 -4 3 -5];        

my_result = polymult(p1, p2);
conv_result = conv(p1, p2);

disp(my_result)
disp(conv_result)

%% 3
R = 11;
h1 = linspace(0,11,1000);
V = 2*pi.*(R^2 -h1.^2).*h1;

figure()
plot(h1,V,'b-');
axis([0 12 0 3500]);

p = [2*pi 0 -2*pi*R^2 2000];
roots(p)

V = [2*pi 0 -2*pi*R^2 0];
k = polyder(V);
h = roots(k)
polyval(V,h)


%% 4
x = [1 2.2 3.7 6.4 9 11.5 14.2 17.8 20.5 23.2];
y = [12 9 6.6 5.5 7.2 9.2 9.6 8.5 6.5 2.2];

p = polyfit(x,y,1);
input = linspace(0,25,1000);
output = polyval(p,input);

figure()
plot(input,output,'b-'); hold on;
plot(x,y,'ro','MarkerSize',10);

p = polyfit(x,y,2);
input = linspace(0,25,1000);
output = polyval(p,input);

plot(input,output,'r-'); hold on;
plot(x,y,'ro','MarkerSize',10);

p = polyfit(x,y,3);
input = linspace(0,25,1000);
output = polyval(p,input);

plot(input,output,'m-'); hold on;
plot(x,y,'ro','MarkerSize',10);

p = polyfit(x,y,5);
input = linspace(0,25,1000);
output = polyval(p,input);

plot(input,output,'g-'); hold on;
plot(x,y,'ro','MarkerSize',10);

%% 5
t = [7 21 35 49 63 77 91];
y = [8.5 21 50 77 89 98 99];
H = 102;

Y = -log(H./y -1);
x = t;

p = polyfit(x,Y,1);

a = p(2)
b = p(1)

y_40 = 102/(1+exp(-a-b*40))

T = linspace(0,100,1000);
yy = H./(1+exp(-a-b.*T));

figure()
plot(T,yy,'b'); hold on;
plot(t,y,'ro','MarkerSize',10); 

%% 6
f = [0 0.6 0.9 1.16 1.18 1.19 1.24 1.48 1.92 3.12 4.14 5.34 6.22 7.12 7.86 8.42];
e = [0 1.2 2.4 3.6 4.8 6.0 7.2 8.4 9.6 10.8 12.0 13.2 14.4 15.6 16.8 18.0];

p = polyfit(e,f,4);
input = linspace(0,18,100);
output = polyval(p,input);
figure()
plot(input,output,'b-'); hold on;
plot(e,f,'ro');

F = interp1(e,f,11.5)

figure()
input = linspace(0,18,100);
yq = interp1(e,f,input,'spline');
plot(input,yq,'b-'); hold on;
plot(e,f,'ro');