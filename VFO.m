function [u] = VFO(in)
global obstacles task_data
%VFO Summary of this function goes here
%   Detailed explanation goes here

qi = in(1:3);
q_p = in(4:6);
forceField = in(7);

qi_p = q_p;%globtonextframe(q_p, target)
%qi_p(1) = th_p

vfo_kp = task_data.vfo.kp;
vfo_ka = task_data.vfo.ka;
vfo_eta = task_data.vfo.eta;
%mii = 0.65;
vfo_sigmai = task_data.vfo.sigmai;
vfo_U2 = task_data.vfo.U2;
%kb = 0.6;



roi = vfo_U2;
mii = vfo_eta*vfo_kp^(-1);
vdi = -vfo_kp*mii*vfo_sigmai*norm(qi(2:3))*[1;0];
hdi = -vfo_kp*qi(2:3)+vdi;
thai = atan2(vfo_sigmai * hdi(2), vfo_sigmai*hdi(1));
eai = thai - qi(1);  

%%needed for thai_p only
v_p = -vfo_kp*mii*vfo_sigmai*((qi(2:3)'*(qi_p(2:3))))/norm((qi(2:3)))*[1;0];
hdi_p = -vfo_kp*(qi_p(2:3))+v_p;
thai_p = (hdi_p(2)*hdi(1)-hdi_p(1)*hdi(2))/(hdi(1)^2+hdi(2)^2);


hai = vfo_ka*eai + thai_p + forceField;%q_p(1);
if norm(qi(2:3)) > 0.5
    u = [hai; roi*vfo_sigmai*cos(eai)];
else
    u = [0;0];
end

end

