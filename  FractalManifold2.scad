scale=10;

mr =[[         0, -1/sqrt(2),         0,  -scale],
     [-1/sqrt(2),          0,         0,       0],
     [         0,          0, 1/sqrt(2), 2*scale],
     [         0,          0,         0,       1]];

ml =[[         0,  1/sqrt(2),         0,   scale],
     [ 1/sqrt(2),          0,         0,       0],
     [         0,          0, 1/sqrt(2), 2*scale],
     [         0,          0,         0,       1]];

module disk(n){
translate([-scale,-scale*(sqrt(2)-1),0])cylinder(r=scale,h=scale*1e-3,$fn=32*pow(2,n/3));
}
module cube_2() translate([0,-scale*sqrt(2),0])cube(2*scale);

module fork0(n){
for (m=[ml,mr]) hull(){disk(n); multmatrix(m=m)disk(n-1);}
}

module fork(n) {
fork0(n);
if(n>0) for(m=[ml,mr]) multmatrix(m=m)fork(n-1);
}

module s(){
children(0);
for(m=[ml,mr]) multmatrix(m=m)children();
}
module sm(){
mirror()children(0);
for(m=[ml,mr]) multmatrix(m=m)children();
}

//s()s()s()s()s()union(){mirror()cube_2();color("green")cube_2();}
//sm()sm()sm()sm()sm()union(){mirror()fork0(1);color("green")fork0(1);}
s()s()s()s()s()fork0(1);
//mirror(v=[0,0,1]) fork(5);