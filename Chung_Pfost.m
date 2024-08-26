function diff = Chung_Pfost(x,aw,M) 
 
k=x(1);
c=x(2);
R=8.314;
T=293.15;

diff = (-1/c*log(-R*T/k*log(aw)))-M;
