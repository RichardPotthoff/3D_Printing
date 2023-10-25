ra=9.9;
module segment()
difference(){
intersection(){
sphere(r=20,$fn=100);
translate([10,0,0])cylinder(r=ra-0.1,h=50,$fn=4,center=true);
}
rotate([90,0,0])rotate(90)translate([10,0,0])cylinder(r=ra,h=50,$fn=4,center=true);
rotate([270,0,0])rotate(90)translate([10,0,0])cylinder(r=ra,h=50,$fn=4,center=true);
}
module segment1(o)translate([o,0,0])segment();
o=(1-$t)*15;
segment1(o);
rotate(180)segment1(o);
rotate([90,90,0])segment1(o);
rotate([90,-90,0])segment1(o);
rotate([90,0,90])segment1(o);
rotate([90,0,-90])segment1(o);