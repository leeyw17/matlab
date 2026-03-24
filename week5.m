clear all
clc
close all
math = input('Enter the points in Math');
phy = input('Enter the points in phy');
chem = input('Enter the points in chem');

ave = (math + phy + chem)/3

mat = [ 1 2 3; 4 5 6];
disp(mat)


for k = 1:2:5
    x(k) = k^2;
end
x