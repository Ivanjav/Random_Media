clc
clear all
close all
rng('default')

dh=10;
Dy=2000; Dz=2000;
dy=dh; dz=dh;
y=0:dy:Dy; z=0:dz:Dz;
epsilon=0.05;
a=100;

M=random_media_2d(y,z,epsilon,a,'gaussian');

figure
imagesc(y,z,M)
colormap(jet), 
xlabel('Y'), ylabel('Z'), 