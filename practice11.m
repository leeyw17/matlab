clear all
clc
close all
%%
syms a b c x y
f = a*x^2 + b*x +c
f
%%
syms a b c x
S = sqrt(a*x^2+ b*x + c)
pretty(S)