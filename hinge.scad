module hinge1(){
cylinder(r=5.,h=2.5,$fn=60,center=true);
cylinder(r=5.*sqrt(0.5),h=2.5+2*1.5,$fn=60,center=true);
}
module hinge2()
difference(){
union()
{translate([0,0,7])hinge1();
translate([0,0,0.5])cylinder(r1=5,r2=0,h=7+3+1.5,$fn=60);
translate([0,0,-0.005])cylinder(r=5,h=0.51,$fn=60);
}
difference(){
cylinder(r1=5,r2=0,h=7+1.5,$fn=60);
translate([-25,1,-25])
cube([50,50,50]);
}
translate([-25,0,1])rotate([-180-45,0,0])cube([50,50,50]);
rotate([0,90,0])cylinder(r=1,h=50,$fn=20,center=true);
cylinder(r=1,h=50,$fn=20,center=true);
}
hinge2();
mirror([0,0,1])hinge2();