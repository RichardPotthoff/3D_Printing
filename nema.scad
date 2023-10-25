module nema(w=39,h=31,d=22,d1=30,d2=51.5,d3=7,d4=7,d5=44,d6=3,h0=2,h00=-0.5,h1=10.,h2=12,w1=31)
{
eps=0.01;
//    $fa=1;
difference(){

union(){

difference(){

intersection(){
translate([-w/2,-w/2,-h])cube([w,w,h]);
translate([0,0,-1.5*h])cylinder(r=d2/2,h=3*h,$fn=3.14*sqrt(d2/(4*eps)));
}//intersection

translate([0,0,h00])cylinder(r1=d1/2,r2=d1/2+h0-h00,h=+h0-h00,$fn=3.14*sqrt(d1/(4*eps)));
}//difference

translate([0,0,-h0])cylinder(r=d/2,h=h0*2,$fn=3.14*sqrt(d/(4*eps)));
}//union

difference(){
translate([-w,-w,-h+h2])cube([2*w,2*w,h-h1-h2]);
translate([0,0,-1.5*h])cylinder(r=d5/2,h=h*2,$fn=3.14*sqrt(d5/(4*eps)));
}

for (i=[0:3])
rotate(i*90)translate([w1/2,w1/2,-h-(h0-h00)+h0])
union(){
hull()
for (i=[0,1],j=[0,1])translate([i*(w-w1),j*(w-w1),0])cylinder(r2=d3/2,r1=d3/2+0.5*(h0-h00),h=+h0-h00,$fn=3.14*sqrt(d3/(4*eps)));
cylinder(r=d6/2,h=h*2,$fn=3.14*sqrt(d6/(4*eps)));
}//union

for (z=[0,-h+h00])translate([0,0,z])cylinder(r=d4/2,h=h0-h00,$fn=3.14*sqrt(d4/(4*eps)));
}//difference
}//module nema

module spindle(l=100,l1=6.5,l2=5,l3=0.5,d=5,d1=4,w=0.5)
{
eps=0.01;
difference(){
union(){
cylinder(r=d/2,h=l-l1,$fn=3.14*sqrt(d/(4*eps)));
translate([0,0,l-l1-1])cylinder(r=d1/2,h=l1+1,$fn=3.14*sqrt(d1/(4*eps)));
}//union
translate([d1/2-w,-d,l-l2])cube([d,2*d,l2-l3]);
}//difference
}//module spindle
nema();
translate([0,0,-80])spindle();
