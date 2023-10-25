module nippel(dh,d1,d2,h)difference(){
union(){
cylinder(r1=d2/2+2,r2=d2/2,h=0.7,$fn=72);
cylinder(r1=d2/2,r2=d1/2,h=h,$fn=72);}
translate([0,0,-1])cylinder(r1=dh/2+(d2-d1)/2*(h+1)/h,r2=dh/2-(d2-d1)/2*1/h,h=h+2,$fn=72);}
module lid(dh,d1,d2,x1,h,s1,s2)
difference(){
hull(){cylinder(r1=d2/2+s1-s2*s1/h,r2=d2/2+s1+s2,h=h+s1,$fn=72);translate([x1,0,0])cylinder(r1=d1/2+s1-s2*s1/h,r2=d1/2+s1+s2,h=h+s1,$fn=72);}
translate([0,0,s1])hull(){cylinder(r1=d2/2,r2=d2/2+s2*(h+s1)/h,h=h+s1,$fn=72);translate([x1,0,0])cylinder(r1=d1/2,r2=d1/2+s2*(h+s1)/h,h=h+s1,$fn=72);}
translate([x1,0,-1])cylinder(r2=dh/2+s1+1,r1=dh/2-1,h=s1+2,$fn=36);
}
translate([0,-10,0])nippel(4.5,6.5,8,8+2);
translate([0,15,0])lid(6,13.35,27.35,45.45-(13.35+27.35)/2,8,2,0.2);