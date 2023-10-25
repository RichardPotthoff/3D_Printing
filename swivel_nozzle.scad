module tilt(a=90/8,x=10)
translate([x,0,0])rotate(a,[0,1,0])translate([-x,0,0])children();
module addWedge(a=180,c="red")rotate(a)
    tilt(90/8,10){rotate(-a)children();
    color(c)hull(){cylinder(0.01,5); 
        tilt(-90/8,10)cylinder(0.01,5);}
    tilt(-90.0/16,10)translate([-5,0,0])
        cube([0.5,0.5,3.1],center=true);}  
module addMarker(b=90){
    rotate(b)rotate(-90,[0,1,0])cylinder(20,center=true,$fn=9);
    children();}
module addDoubleWedge(a=0,b=90,c="green")
    addWedge(a=a,c=c)addMarker(b+a)addWedge(a=a,c=c)
    children();
module swivel(a=0,b=90)
    addMarker(b+a)addWedge(a,"red")
    addDoubleWedge(-a,-b,"green")
    addDoubleWedge(a,b,"red")
    addDoubleWedge(-a,-b,"green")
    addWedge(a,"red")addMarker(b+a)
    rotate(a)children();
module swivelb(a=0,b=90)
    addWedge(-a,"green")addDoubleWedge(-a,-b,"green")
    addWedge(-a,"green"){
    color("blue")cylinder(30,r=0.5,center=true);
    addWedge(a,"red")addDoubleWedge(a,b,"red")addWedge(a,"red")
    rotate(a)children();}
module Nozzle(){
    cylinder(h=2,r=5.6,$fn=6);
    translate([0,0,2])cylinder(h=5,r1=5,r2=1);}
translate([0,-15,0])swivel(45*(1.0+cos($t*360)),90-180)Nozzle();
translate([0,15,0])swivelb(45*(1.0+cos($t*360)),90-180)Nozzle();
*for(i=[0:10:90])swivel(i,60-180)Nozzle();