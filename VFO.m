function [u] = VFO(in)
%VFO Summary of this function goes here
%   Detailed explanation goes here
global ux uy x y
qi = in(1:3);
q_p = in(4:6);
x = [x; qi(2)];
y = [y; qi(3)];

qi_p = q_p
%globtonextframe(q_p, target)
%qi_p(1) = th_p

kp = 0.5;
ka = 1;
eta = 0.32;
%mii = 0.65;
sigmai = 1;
U2 = 1;
%kb = 0.6;



roi = U2;
mii = eta*kp^(-1);
vdi = -kp*mii*sigmai*norm(qi(2:3))*[1;0];
hdi = -kp*qi(2:3)+vdi;
thai = atan2(sigmai * hdi(2), sigmai*hdi(1));
eai = thai - qi(1);  

%%needed for thai_p only
v_p = -kp*mii*sigmai*((qi(2:3)'*(qi_p(2:3))))/norm((qi(2:3)))*[1;0];
hdi_p = -kp*(qi_p(2:3))+v_p;
thai_p = (hdi_p(2)*hdi(1)-hdi_p(1)*hdi(2))/(hdi(1)^2+hdi(2)^2);


hai = ka*eai + thai_p;%q_p(1);
if norm(qi(2:3)) > 0.5
    
    u = [hai; roi*sigmai*cos(eai)]
    
    %u = [0; -5]
else
    u = [0;0]
    
end
ux = [ux; u(1)];
uy = [uy; u(2)];
end

