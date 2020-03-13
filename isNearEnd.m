function [out] = isNearEnd(in)
%ISNEAREND Summary of this function goes here
%   Detailed explanation goes here
pos = in(1:3);
global targets targetIter

if norm(pos(2:3)) < 0.5
    targetIter = targetIter+1;
    if targetIter > 3
        targetIter = 3
    end
end
target = targets(:,targetIter);
out = target;
end

