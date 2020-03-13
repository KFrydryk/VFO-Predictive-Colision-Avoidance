function [out] = globtonextframe(q_glob, i_glob)
%GLOBTONEXTFRAME Summary of this function goes here
%   Detailed explanation goes here

R = [cos(i_glob(1)), -sin(i_glob(1));...
    sin(i_glob(1)), cos(i_glob(1))];

pos_new = R\(q_glob(2:3)-i_glob(2:3));
th_new = q_glob(1)-i_glob(1);
out = [th_new; pos_new];


end

