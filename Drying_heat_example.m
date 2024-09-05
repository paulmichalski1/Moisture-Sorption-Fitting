% Code by Paul Michalski, paulmichalski@monash.edu, 2023
% Written in MATLAB R2022b

clear all;
close all;
clc;

% This script is an example of how the moisture sorption isotherm data and
% the new analytical expression of the net isosteric heat of sorption may
% be used to calculate the heat required to achieve a target water
% activity.

MW = 18.015; % kg/kmol, molecular weight of water
dHv = 40.65; % kJ/mol, latent heat of vapourisation of water
R = 8.314; % kJ/kmol.K, universal gas constant

M_i = 0.8414; % Initial moisture content (kg/kg d.b.)
M_i = 0.7970; % Initial moisture content (kg/kg d.b.)
M_f = 0.0544; % Target final moisture content (kg/kg d.b.) based on target water activity (here 0.4)
M_f = 0.0209; % Target final moisture content (kg/kg d.b.) based on target water activity (here 0.4)

sample = 'Frozen Muntrie'; % Sample name

switch lower(sample)
    case 'frozen apple'
        C = 0.2335; % (-)
        M0 = 0.00138; % (kg/kg d.b.)
        dHc = 585.5e+03; % (kJ/kmol)
        dHk = 1.784e+03; % (kJ/kmol)
        dM0dinvT = -107.8; % (K)
    case 'frozen muntrie'
        C = 0.2451; % (-)
        M0 = 0.00309; % (kg/kg d.b.)
        dHc = 298.1e+03; % (kJ/kmol)
        dHk = 2.714e+03; % (kJ/kmol)
        dM0dinvT = -152.1; % (K)
end

q_st = @(M) R*(((M*dHc/R-dM0dinvT-M0*dHc/R)+((M*(C-2)-M0*C).*(M*dHc/R-dM0dinvT-M0*dHc/R)+2*M.^2*dHc/R)./(((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5))*C*(C-1)-(dHk/R*(C-1)+dHc/R*C)*((M*(C-2)-M0*C)+((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5))./(((M*(C-2)-M0*C)+((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5)*(C-1));

Q = (dHv-integral(q_st,M_i,M_f))/MW; % (kJ/kg)