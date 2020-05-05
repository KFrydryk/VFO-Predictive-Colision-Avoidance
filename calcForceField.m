function [out] = calcForceField(pos)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global obstacles
k = 0.03;
activationDistance = 13;
force = 0;
for i = 1:size(obstacles,2)
    dist = getDistFromObstacle(obstacles{1,i}, pos);
    sign = getObstacleSide(obstacles{1,i}, pos);
    if dist < activationDistance;
        force = force + sign*(activationDistance-dist);
    end
end
%account for left border
dist = getDistFromObstacle([10, pos(3), 0], pos);
sign = getObstacleSide([10, pos(3), 0], pos);
force = force + sign*(activationDistance-dist);
%account for right border
dist = getDistFromObstacle([30, pos(3), 0], pos);
sign = getObstacleSide([30, pos(3), 0], pos);
force = force + sign*(activationDistance-dist);
out = k*force
end

