size=10; skew=1.0; diameter=0.99;
s05=sqrt(0.5);
ml =[[   0, s05,   0,   size],
     [ s05,   0,   0,      0],
     [   0,   0, s05, 2*size],   [ 0, 0, 0, 1 ]];
mr =[[-1,0,0,0],[0,-1,0,0],[0,0,1,0],[0,0,0,1]]*ml;
module disk(n=5){
translate(skew*[-size,-size*(sqrt(2)-1),0])cylinder(r=diameter*size,h=size*1e-3,$fn=32*pow(2,n/3));
}
module fork0(n=5) union(){
for (m=[ml,mr]) hull(){disk(n); multmatrix(m=m)disk(n-1);}
}
module fork(n=5) union(){
    if(n>0) for(m=[ml,mr]) multmatrix(m=m)fork(n-1);
    fork0(n);
}
module disk_with_box(n=5){
   translate([0,0,-1e-3])scale([1,1,3])disk(n);
#translate(-2*size*[1,s05,-1e-4])cube(4*size*[1,s05,1e-4]);
}
module transform_demo() {
    color("red")disk_with_box();
    color("green")multmatrix(m=ml)disk_with_box();
    color("blue")multmatrix(m=mr)translate([0,0,1e-3])disk();
}

translate([0,3*size,0]){transform_demo();%fork0(0);}

fork(5);