function [out] = unicycle(in)
%kinematics of aan unicycle

u = in(1:2);
q = in(3:5);

q_p = [1;0;0]*u(1)+[0;cos(q(1));sin(q(1))]*u(2);
out = q_p; 
end

