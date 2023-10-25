tetr_ang2=acos(1/sqrt(3));
tetr_ang=2*tetr_ang2;
module rod(){hull(){translate([0,0,10])sphere(1.5,$fn=20);sphere(2,$fn=20);}}
module tetr1(){
hull(){rotate([0,180-tetr_ang2,0])rod();
translate([0,0,-15])rotate([0,180-tetr_ang2,0])rod();}
hull(){rotate([0,180+tetr_ang2,0])rod();
translate([0,0,-15])rotate([0,180+tetr_ang2,0])rod();}
hull(){rotate([tetr_ang2,0,0])rod();translate([0,0,-15])rotate([tetr_ang2,0,0])rod();}
hull(){rotate([-tetr_ang2,0,0])rod();translate([0,0,-15])rotate([-tetr_ang2,0,0])rod();}
}
module tetr2(){
rod();
rotate([tetr_ang,0,0])rod();
rotate([tetr_ang,0,120])rod();
rotate([tetr_ang,0,-120])rod();
}
r1=17;
h=r1/sqrt(8);
module mold(){
difference(){
intersection(){
sphere(r=13,$fn=180);
translate([0,0,-h])rotate(30)cylinder( r1=r1,r2=0,h=h,$fn=3);}
tetr2();}

}
mold();