function diff = Halsey(x,aw,M) 
 
k=x(1);
n=x(2);

diff = (-k./log(aw)).^(1/n)-M;