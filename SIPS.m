function diff = SIPS(x,aw,M) 
 
Ks=x(1);
N=x(2);
C=x(3);

diff = Ks*aw.^N./(1+C*aw.^N)-M;
