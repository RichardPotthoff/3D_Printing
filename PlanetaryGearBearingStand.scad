difference(){
hull(){
translate([0,0,1.2])cube([90,45,2.4],center=true);
translate([0,0,1.2+10])cube([60,25,2.4],center=true);
}

translate([0.,0,49.5+12.4-6])rotate([90,0,0]){
#cylinder(r=49.5,h=15.2,center=true,$fn=200);
#cylinder(r=44.5,h=16,center=true,$fn=200);
#difference(){
cylinder(r=49.5,h=15.7,center=true,$fn=200);
cylinder(r=48.5,h=17,center=true,$fn=200);
translate([0,-60,0])rotate(-30)cylinder(r=50,h=17,center=true,$fn=3);
}
}
translate([0,0,-0.1]){
hull(){
translate([-16.81,0,0])rotate(45)cylinder(r1=15*sqrt(2),r2=0,h=15,$fn=4);
translate([16.81,0,0])rotate(45)cylinder(r1=15*sqrt(2),r2=0,h=15,$fn=4);
}
rotate([90,0,0])rotate(45)cube([45,45,15.2],center=true);
}
}