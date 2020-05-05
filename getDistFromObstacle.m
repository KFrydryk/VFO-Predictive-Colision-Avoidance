function [out] = getDistFromObstacle(ob, pos)
%GETDISTFROMOBSTACLE Summary of this function goes here
%   Detailed explanation goes here
Ox = ob(1);
Oy = ob(2);
Or = ob(3);
Px = pos(2);
Py = pos(3);
Pth = pos(1);

dist = sqrt((pos(2)-ob(1))^2 + (pos(3)-ob(2))^2)-ob(3);
out = dist;
end

