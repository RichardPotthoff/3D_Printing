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
module M4()
difference(){
hull(){
translate([0,-22,0])cylinder(r=3,h=16,$fn=36);
translate([0,22,0])cylinder(r=3,h=16,$fn=36);
}
M3();
}
difference(){
union(){
translate([15,0,0])rotate(20)M4();
translate([-15,0,0])rotate(-20)M4();
translate([-35,-29,0])cube([20,10,16]);
translate([15,-29,0])cube([20,10,16]);
translate([-35,-29,0])cube([70,6,16]);
translate([-7,-21.5,0])cube([14,45,16]);

}
translate([0,-15,-1])cylinder(r=4,h=20,$fn=36);
}