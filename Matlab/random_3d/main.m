clc
clear all
close all
rng('default')

dh=20;
Dx=1500; Dy=2000; Dz=1000;
dx=dh;  dy=dh; dz=dh;
x=0:dx:Dx;  y=0:dy:Dy; z=0:dz:Dz;
epsilon=0.05;
a=100;


M=random_media_3d(y,z,x,epsilon,a);

figure
h=slice(y,x,z,permute(M,[3 2 1]),0,0,0);
colormap(jet), 
set(h,'edgecolor','none'),
set(gca, 'Zdir', 'reverse')
xlabel('Y'), ylabel('X'), zlabel('Z'),