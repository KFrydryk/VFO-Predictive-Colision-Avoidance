function [out] = getObstacleSide(ob, pos)
%GETOBSTACLESIDE Summary of this function goes here
%   Detailed explanation goes here
out = sign(ob(2)-pos(2));
end

