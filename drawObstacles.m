function [] = drawObstacles( in )
%przyjmuje tablice nx3 - n liczba punktow
%DRAWOBSTACLES Summary of this function goes here
%   Detailed explanation goes here
N = 30;  
x = in(:,1);
y = in(:,2);
r = in(:,3);
s = size(in);
for i = 1:1:s(1)
center = [x(i); y(i)];
radius = r(i);
circr = @(radius,rad_ang)  [center(1) + radius*cos(rad_ang);  center(2) + radius*sin(rad_ang)]; 
                                                       % Number Of Points In Complete Circle
r_angl = linspace(0, 2*pi, N);                             % Angle Defining Arc Segment (radians)                                                  % Arc Radius
xy_r = circr(radius,r_angl);                                    % Matrix (2xN) Of (x,y) Coordinates

%figure(1)
plot(xy_r(1,:), xy_r(2,:));                                % Draw An Arc Of Blue Stars
%axis([-6 6 -6 6])             % Set Axis Limits
%axis equal     
hold on
end
end

