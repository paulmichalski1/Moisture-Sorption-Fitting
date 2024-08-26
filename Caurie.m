function diff = Caurie(x,aw,M) 
 
M0=x(1);
C=x(2);

diff = (2/M0/C*((1-aw)./aw).^(2*C/M0)).^(-1)-M;
