function [out] = isNearEnd(in)
%ISNEAREND Summary of this function goes here
%   Detailed explanation goes here
pos = in(1:3);
global targets targetIter
out = 0;
if norm(pos(2:3)) < 1
%     targetIter = targetIter+1;
%     if targetIter > size(targets, 2)
%         targetIter = size(targets, 2);
%     end
    out = 1;
end
% target = targets(:,targetIter);
% out = target;
end

