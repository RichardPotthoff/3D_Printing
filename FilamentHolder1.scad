module BearingGuides(){
for (i=[1:6]){
rotate(60*i)BearingGuide();
}
}
module BearingGuide(){
translate([22/2+1,0,1])hull(){rotate(a=90,v=[1,0,0])cylinder(r=1,h=7,$fn=32,center=true);translate([0,0,10])rotate(a=90,v=[1,0,0])cylinder(r=1,h=7,$fn=32,center=true);}
}
module FilamentHolder(){
union(){
difference(){
union(){
cylinder(r=50,h=3,$fn=120);
translate([0,0,3])rotate_extrude($fn=120,convexity=10)
translate([47,0,0])circle(r=3,$fn=32);
cylinder(r=31/2,h=10,$fn=60);
translate([0,0,10-0.1])cylinder(r1=31/2,r2=26/2,h=(31-26)/2,$fn=60);
cylinder(r=26/2,h=60+3-26/2,$fn=120);
difference(){cylinder(r=31/2+3,h=3+3,$fn=120);translate([0,0,6])rotate_extrude($fn=120)
translate([31/2+3,0,0])circle(r=3,$fn=120);}
translate([0,0,63-26/2])sphere(r=26/2,$fn=120);
}
translate([0,0,49.99])cylinder(r1=23/2,r2=5,h=11,$fn=120);
translate([0,0,-1])cylinder(r=23/2,h=50+1,$fn=120);
intersection(){
cylinder(r=44,h=22,center=true,$fn=120);
union()
for (i=[0,1,2,3,4])
rotate(a=i*360/5)translate([50,0,0])cylinder(r=25,h=20,center=true,$fn=60);
}
}
intersection(){
union(){
translate([0,0,1])BearingGuides();
translate([0,0,41])BearingGuides();
}
cylinder(r=24/2,h=100);}
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

module FilamentHolderBase() intersection(){
scale(0.88388)stencil();
//cylinder(r=13,h=30,center=true,$fn=200);
difference(){
cylinder(r1=150,r2=9,h=10,$fn=200);
translate([0,0,-0.01])union(){
cylinder(r=7.7/2,h=11,$fn=60);
intersection(){
cylinder(r1=12/2+1.5*(6.7+0.05),r2=7.7/2,h=6.7+(12-7.7)/2/1.5+0.05,$fn=60);
cylinder(r=12.45/sqrt(3),h=10.1,$fn=6);
}
cylinder(r1=12.45/sqrt(3)+0.6,r2=12.45/sqrt(3),h=1,$fn=6);
translate([0,0,10.0-(0.84)])cylinder(r2=12/2+1.5*(0.9),r1=12/2,h=(0.9),$fn=60);
}
}
}
module zwickel()
difference(){
rotate(-45)translate([0,0,-0.5])cube([50,50,13]);
translate([160/2,160/2,-1])cylinder(r=90,h=14,$fn=260);
translate([160/2,-160/2,-1])cylinder(r=90,h=14,$fn=260);
translate([0,0,-1])cylinder(r=25,h=14,$fn=160);}

module stencil()
rotate(45)difference(){
union(){
translate([-80,-80])cube([160,160,11]);
for(i=[1:4])rotate(360/4*i)translate([160/2,0,0])cylinder(r=10,h=11,$fn=60);
}
for(i=[1:4])rotate(360/4*i)
{translate([160/2,160/2,-0.5])cylinder(r=70,h=12,$fn=360);
zwickel();
translate([160/2,0,3])cylinder(r=5.1,h=12,$fn=60);
translate([160/2,0,-0.5])cylinder(r=2.275,h=12,$fn=60);
}

}

translate([0,0,3])spacer(38.5);
intersection(){FilamentHolder();*translate([0,0,41])cylinder(r=30,h=25);}
translate([0,0,-12])FilamentHolderBase();