tol=0.05; //tolerance[mm]: >0=loose <0=tight
rb=14/sqrt(2);
ra=rb+tol*sqrt(2);
r=(rb+ra+2*0.15);
module segment()
difference(){
intersection(){
sphere(r=r,$fn=100);
translate([ra,0,0])cylinder(r=rb,h=90,$fn=4,center=true);
}
rotate([90,0,0])rotate(90)translate([ra,0,0])cylinder(r=ra,h=50,$fn=4,center=true);
rotate([270,0,0])rotate(90)translate([ra,0,0])cylinder(r=ra,h=50,$fn=4,center=true);
}
module segment1(o)translate([o,0,0])segment();
module dodecahedron_rhomb(r)intersection(){intersection(){rotate([45,0,0])cube([4*r,2*r,2*r],center=true); rotate([0,45,0])cube([2*r,4*r,2*r],center=true); }rotate([0,0,45])cube([2*r,2*r,4*r],center=true); }
o=(1-$t)*15;
//o=0;
rotate([90,0,0])rotate(45)difference(){
translate([rb-ra,0,0])segment();
%dodecahedron_rhomb(0*11.5);
%rotate([0,0,0])cube([2*ra-3.5,2*ra,2*ra],center=true);}
$union(){segment1(o);
rotate(180)segment1(o);
rotate([90,90,0])segment1(o);
rotate([90,-90,0])segment1(o);
rotate([90,0,90])segment1(o);
rotate([90,0,-90])segment1(o);}