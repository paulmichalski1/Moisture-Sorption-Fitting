%y = GAB(P,[Mo Kg k]);

%GAB(P;Mo,Kg,k) = (x(1)*x(2)*x(3)*P)/((1-x(3)*q)*(1+(x(2)-1)*x(3)*P));

function diff = GAB(x,aw,M) 
 
M0=x(1);
K=x(2);
C=x(3);       

diff = M0*K*C.*aw./((1-K.*aw).*(1+(C-1)*K.*aw))-M;

