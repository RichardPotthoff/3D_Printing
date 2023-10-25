module screwhole()
translate([0,0,-1]){cylinder(r=3/2,h=2,$fn=32);translate([0,0,1.99])cylinder(r1=3/2,r2=2.2/2,h=(3-2.2)/2,$fn=32);cylinder(r=2.2/2,h=10,$fn=32);}
difference(){cube([58,25,6]);
translate([-0.5,6.6-0.3,6-1.3])cube([59,12.6,6]);
translate([58-51.0,1.7,0])screwhole();
translate([58-21.0,1.7,0])screwhole();
translate([58-53.4,25-1.7,0])screwhole();
translate([58-16.4,25-1.7,0])screwhole();}