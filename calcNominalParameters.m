function [out] = calcNominalParameters(in)
%CALCNOMINALPARAMETERS Summary of this function goes here
%   Detailed explanation goes here
global miNominal sigmaNominal
qi = in;
thi = qi(1);
xi = qi(2);
yi = qi(3);
ki = ((yi/tan(thi))-xi)/norm(qi(2:3));
sigmaNominal = sign(ki);
miNominal = abs(ki);
out = [sigmaNominal; miNominal];
end

