clear all; 
close all;
clc;

% Code by Paul Michalski, paulmichalski@monash.edu, 2023
% Written in MATLAB R2022b

% This script fits the net isosteric heat of sorption as a function of
% moisture content to the newly proposed analytical expression

excelname = 'DVS_example_export.xlsx'; % Contains calculated NIHS(M) using isotherms at multiple tempertaures.

isoq = readmatrix('DVS_example_export.xlsx','Sheet','NIHS','Range','B2:C11');
M = isoq(:,1);
q = isoq(:,2);

[fitresult, gof] = NIHS_fit(M, q);
param = coeffvalues(fitresult);
C = param(1);
M0 = param(2);
dHC = param(3);
dHK = param(4);
dM0dinvT = param(5);
qpred = 0.008314*(((M*dHC/0.008314-dM0dinvT-M0*dHC/0.008314)+((M*(C-2)-M0*C).*(M*dHC/0.008314-dM0dinvT-M0*dHC/0.008314)+2*M.^2*(dHC)/0.008314)./(((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5))*C*(C-1)-(dHK/0.008314*(C-1)+dHC/0.008314*C)*((M*(C-2)-M0*C)+((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5))./(((M*(C-2)-M0*C)+((M*(C-2)-M0*C).^2-4*M.^2*(1-C)).^0.5)*(C-1));
chi2 = sum((qpred-q).^2./abs(qpred))/(length(q)-length(param));

