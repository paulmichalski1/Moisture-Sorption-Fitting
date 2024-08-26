function diff = BET(x,aw,M) 
 
M0=x(1);
c=x(2);

diff = M0*c.*aw./((1-aw)+(c-1).*(1-aw).*aw)-M;
