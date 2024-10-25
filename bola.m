clc
clear all
close all

% Inisiasi parameter domain (r dan \theta)
r = linspace(0,1,100);
theta = linspace(0,pi/2,100);

% Pembuatan mehsgrid dan iterasi dengan boundary condition
[R,T] = meshgrid(r,theta);
if theta <= pi/2
    Phi = (5)*((3/2).*R.*(cos(T)) - (7/8).*(R.^3).*((1/2).*((5/2).*(cos(T)).^3 - (3/2).*cos(T))) + (11/16).*(R.^5).*(((63/8).*((cos(T)).^5) - (70/8).*((cos(T)).^3) + (15/8).*cos(T))));
else
    Phi = (-5)*((3/2).*R.*(cos(T)) - (7/8).*(R.^3).*((1/2).*((5/2).*(cos(T)).^3 - (3/2).*cos(T))) + (11/16).*(R.^5).*(((63/8).*((cos(T)).^5) - (70/8).*((cos(T)).^3) + (15/8).*cos(T))));
end

% Plotting dalam koordinat bola
[x,y,z] = sph2cart(Phi,T,R);
surf(x,y,z)
colorbar
xlabel("x"),
ylabel("y")
zlabel("z")