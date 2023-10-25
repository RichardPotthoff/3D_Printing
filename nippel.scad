module M1()
hull(){
cylinder(r=5,h=20,$fn=36);
translate([0,5,0])cylinder(r=5,h=20,$fn=36);}

module M2(){
M1();translate([0,30,0])M1();translate([-5,5,0])cube([8,25,21]);
}
module M3(){
translate([-5.5,-17.50,-1])M2();
translate([5.5,17.5,-1])rotate(180)M2();}
difference(){
union(){
difference(){
cube([70,65,16]);
 translate([20,30,0])M3();
translate([50,35,0])M3();
translate([25,7.5,-1])cube([35,1.5,21]);
translate([10,56,-1])cube([35,1.5,21]);
translate([51,7.5,-1])cube([7,10,21]);
translate([12,47.5,-1])cube([7,10,21]);}
translate([0,0,0])cube([13,65,16]);
translate([57,0,0])cube([13,65,16]);
translate([27,9,0])cube([16,47,16]);
}
translate([35,32.5,-1])cylinder(r=4,h=21,$fn=36);
}
