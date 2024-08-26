function diff = Iglesias_Chirife(x,aw,M,M_half) 
 
k=x(1);
c=x(2);

diff = (log(M+(M.^2+M_half).^0.5)-c)/k-aw;