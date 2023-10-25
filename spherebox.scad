module octaeder(size)scale(size)hull()for(i=[0,180])rotate([i,0,0])cylinder(r1=1,r2=0,h=1,$fn=4);
module spherecube(x=[1,1,1],chamfer=0,center=false)
scale(x)translate([1,1,1]*(center?0.0:0.5))
intersection(){
sphere(r=sqrt(0.5)-chamfer/sqrt(x[0]*x[0]+x[1]*x[1]+x[2]*x[2]),$fn=200);
cube(1,center=true);
}

module chamfercube(x=[1,1,1],chamfer=0,center=false)
translate([1,1,1]*chamfer-x*(center?0.5:0.0))
minkowski(){
octaeder(chamfer);
cube(x-(2*chamfer*[1,1,1]));
}
module chamferbox()
difference(){
chamfercube([42,42,42],0.5,center=true);
chamfercube([40,40,40.4],0.5,center=true);
translate([-50,-50,0])cube(100);
}
module spherebox()
difference(){
spherecube([42,42,42],3.5,center=true);
spherecube([40,40,40.4],3.5,center=true);
translate([-50,-50,0])cube(100);
}
//chamferbox();
spherebox();
module peg()translate([-1.5,-0.5,0])
{translate([0,0,-3])hull(){translate([0,0,-1.5])cube([3,0.5,0.5]);cube([3,2,3]);}
rotate([-2,0,0])translate([0,0.5,-0.1])cube([3,1.5,2]);
}
for(i=[[-15.5,-20,0],[15.5,-20,0],[-15.5,20,0],[15.5,20,0]])translate(i)rotate(i[1]>0?180:0)peg();