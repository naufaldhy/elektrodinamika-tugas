clc
clear all
close all

% Inisiasi paramater dan domain (r dan \theta)
r = linspace(0,2,40);
theta = linspace(0,2*pi,40);
q = 4;
k = 8.98*10^(9);
N = 10;
alpha = pi/2;
c = 5;

% Iterasi pada persamaan dan pembuatan meshgrid
[R,T] = meshgrid(r, theta);
Phi = 0;
for i = 1:N
    Vi = k.*q.*(R./(c.^(i))).*legendreP(i-1,cos(alpha)).*legendreP(i-1,cos(T));
    Phi = Phi + Vi;
end

% Plotting dalam koordinat polar
[x,y,z] = pol2cart(T,R,Phi);
surf(x,y,z)
colorbar
xlabel("x"),
ylabel("y")
zlabel("z")