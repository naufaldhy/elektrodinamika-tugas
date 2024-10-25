clc
clear all
close all

% Inisiasi parameter dan domain (r dan \theta)
r = linspace(0,2,40);
theta = linspace(0,2*pi,40);
N = 20;
a = 2;

% Pembuatan meshgrid dan iterasi pada persamaan
[R,T] = meshgrid(r, theta);
V = 0;
for i = 1:N
    Vi = ((2.*besselj(1,pi.*((i-1)+1/4)).*besselj(1,((pi.*R)./a).*((i-1)+1/4)))./((2.*(i-1)+3).*((besselj(2,pi.*((i-1)+1/4))).^2))).*(sin(T));
    V = V + Vi;
end

% Plotting
[x,y,z] = pol2cart(T,R,V);
surf(x,y,z)
colorbar
xlabel("x"),
ylabel("y")
zlabel("z")