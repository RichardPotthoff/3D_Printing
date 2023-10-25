scale=10;
mr =[[0,-1/sqrt(2),0,-scale],
[-1/sqrt(2),0,0,0],
[0,0,1/sqrt(2),2*scale],
[0,0,0,1]];
ml =[[0,1/sqrt(2),0,scale],
[1/sqrt(2),0,0,0],
[0,0,1/sqrt(2),2*scale],
[0,0,0,1]];

module disk(n)translate([-scale,-scale*(sqrt(2)-1),0])cylinder(r=scale,h=scale*1e-6,$fn=16*pow(2,n/2));

module fork0(n) {
hull(){disk(n); multmatrix(m=ml)disk(n-1);}
hull(){disk(n); multmatrix(m=mr)disk(n-1);}
}

module fork(n) {
if(n>0){
multmatrix(m=ml)fork(n-1);
multmatrix(m=mr)fork(n-1);
}
fork0(n);
}
//fork(5);//recursion does not work in OpenSCAD:"fork0(n);

module fork1(n) {
multmatrix(m=ml)fork0(n-1);
multmatrix(m=mr)fork0(n-1);
fork0(n);
}
module fork2(n){
multmatrix(m=ml)fork1(n-1);
multmatrix(m=mr)fork1(n-1);
fork0(n);
}
module fork3(n){
multmatrix(m=ml)fork2(n-1);
multmatrix(m=mr)fork2(n-1);
fork0(n);
}
module fork4(n){
multmatrix(m=ml)fork3(n-1);
multmatrix(m=mr)fork3(n-1);
fork0(n);
}
module fork5(n){
multmatrix(m=ml)fork4(n-1);
multmatrix(m=mr)fork4(n-1);
fork0(n);
}

module s(){
children(0);
for(m=[ml,mr]) multmatrix(m=m)children();
}
//s()s()s()s()s()fork0(0);
//mirror(v=[0,0,1])
fork5(5);