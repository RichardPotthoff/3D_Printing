module loop()rotate([90,0,0])intersection(){rotate_extrude($fn=30,convexity=10)translate([1.8125+0.75,0,0])circle(r=1.8125,$fn=30);
cylinder(r=2.25,h=2.5,$fn=30,center=true);}
module link()union(){
loop();
translate([0,0,5.196])loop();
translate([1.25,-1.25])cube([1,2.5,5.196]);
translate([0,-1.25,1.25])cube([4.5/2,2.5,1]);
translate([0,-1.25,5.196-1-1.25])cube([4.5/2,2.5,1]);
intersection(){cube([4.5,2.5,2*5.196],center=true);translate([1.25,0,5.196/2])cylinder(r=1.25,h=5.196-4.5+1,$fn=30,center=true);}}

difference(){translate([-5,0,-5])cube(10,center=true);
translate([-2.25,0,-5.196/4]){
for(i=[0,1]){rotate([0,i*120,0])link();
translate([0,2.5+0.1,-5.196/2])rotate([0,i*60,0])link();}
translate([1.25,-1.25,-2.5])cube([1.25,2.5,4.75]);}}
