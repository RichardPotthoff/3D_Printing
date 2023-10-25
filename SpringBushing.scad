difference(){
cylinder(r=11.5/2,h=3,$fn=60);
translate([0,0,1])cylinder(r=9.5/2,h=5,$fn=60);
translate([0,0,-1])cylinder(r=8.2/2,h=5,$fn=60);
}