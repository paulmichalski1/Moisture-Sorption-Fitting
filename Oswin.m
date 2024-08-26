function diff = Oswin(x,aw,M) 
 
k=x(1);
n=x(2);

diff = k*(aw./(1-aw)).^n-M;