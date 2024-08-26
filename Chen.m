function diff = Chen(x,aw,M) 
 
k=x(1);
c=x(2);
b=x(3);


diff = (-1/b*log(1/c*(k-log(aw))))-M;