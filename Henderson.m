function diff = Henderson(x,aw,M,temp) 
 
k=x(1);
n=x(2);

diff = ((-log(1-aw)/(k*temp)).^(1/n))-M;
