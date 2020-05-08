function [out] = getDistFromObstacle(ob, pos)
%GETDISTFROMOBSTACLE Summary of this function goes here
%   Detailed explanation goes here

dist = sqrt((pos(2)-ob(2))^2 + (pos(3)-ob(3))^2)-ob(4);
out = dist;
end

