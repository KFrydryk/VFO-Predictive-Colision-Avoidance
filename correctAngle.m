function [out] = correctAngle(in)
th = atan2(sin(in(1)), cos(in(1)));
out = [th; in(2:end)];
end

