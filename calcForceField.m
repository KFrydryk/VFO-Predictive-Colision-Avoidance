function [out] = calcForceField(pos)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
global obstacles task_data
k = 1;
activationDistance = task_data.force.activationDistance;
force = 0;
for i = 1:size(obstacles,2)
    dist = getDistFromObstacle(obstacles{1,i}, pos);
    sign = getObstacleSide(obstacles{1,i}, pos);
    if dist < activationDistance
        force = force + eval(task_data.force.function);
        %force = force + sign*1/dist;
        %force = force + sign*(activationDistance-dist);
    end
end
%account for left border
dist = getDistFromObstacle([0, 10, pos(3), 0], pos);
sign = getObstacleSide([0, 10, pos(3), 0], pos);
force = force + eval(task_data.force.function);
%account for right border
dist = getDistFromObstacle([0, 30, pos(3), 0], pos);
sign = getObstacleSide([0, 30, pos(3), 0], pos);
force = force + eval(task_data.force.function);
out = force;
end

