module balken(x=5,y=10,a=1,b=2,l=15,alpha=75,beta=0) translate([x,y,0])rotate([alpha,0,0])rotate(beta)cube([a,b,l]);
difference(){
balken();
for (i = [1:4]) #rotate(-i*45)balken();}
for (i = [5:7]) #rotate(-i*45)balken();