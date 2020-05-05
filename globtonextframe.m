function [out] = globtonextframe(in)
%GLOBTONEXTFRAME Summary of this function goes here
%   Detailed explanation goes here
global targets targetIter
q_glob = in(1:3);
i_glob = targets(:,targetIter);

R = [cos(i_glob(1)), -sin(i_glob(1));...
    sin(i_glob(1)), cos(i_glob(1))];

pos_new = R\(q_glob(2:3)-i_glob(2:3));
th_new = q_glob(1)-i_glob(1);
out = [th_new; pos_new];


end

