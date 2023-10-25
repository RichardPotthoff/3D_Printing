module BearingGuides(){
for (a=[0,60,120,180,240,300]){
rotate(a)BearingGuide();
}
}
module BearingGuide(){
translate([22/2+1,0,1])hull(){sphere(r=1,$fn=32);translate([0,0,8])sphere(r=1,$fn=32);}
}
module FilamentHolder(){
union(){
difference(){
union(){
cylinder(r=50,h=3,$fn=120);
translate([0,0,3])rotate_extrude($fn=120,convexity=10)
translate([47,0,0])circle(r=3,$fn=16);
cylinder(r=31/2,h=10,$fn=60);
translate([0,0,10-0.1])cylinder(r1=31/2,r2=26/2,h=(31-26)/2,$fn=60);
cylinder(r=26/2,h=60+3-26/2,$fn=60);
difference(){cylinder(r=31/2+3,h=3+3,$fn=60);translate([0,0,6])rotate_extrude($fn=60)
translate([31/2+3,0,0])circle(r=3,$fn=60);}
translate([0,0,63-26/2])sphere(r=26/2,$fn=60);
//hull()translate([0,0,60])rotate_extrude($fn=60)
translate([25/2-3,0,0])circle(r=3,$fn=16);
}
translate([0,0,50.99])cylinder(r1=23/2,r2=5,h=10,$fn=60);
translate([0,0,-1])cylinder(r=23/2,h=51+1,$fn=60);
}
BearingGuides();
translate([0,0,42])intersection()
{BearingGuides();cylinder(r=24/2,h=10);}
}
}
module spacer(od){
difference(){
union(){
cylinder(r=od/2,h=10-3-0.15,$fn=120);
cylinder(r=od/2+5,h=3-0.15,$fn=120);
}
cylinder(r=31/2+0.15,h=20,$fn=120);
translate([0,0,-0.01])cylinder(r1=31/2+3,r2=31/2,h=5,$fn=120);
}
}
spacer(38.5);
//intersection(){FilamentHolder();*translate([0,0,41])cylinder(r=30,h=25);}