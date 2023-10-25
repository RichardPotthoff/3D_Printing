module select(n)children(n);
module tilt(a=90/8,x=10)
translate([x,0,0])rotate(a,[0,1,0])translate([-x,0,0])children();
module addWedge(a=180,c="red")rotate(a)
    tilt(90/8,10){rotate(-a)children();
    color(c)hull(){cylinder(0.01,5); 
        tilt(-90/8,10)cylinder(0.01,5);}
    tilt(-90.0/16,10)translate([-5,0,0])
        cube([0.5,0.5,3.1],center=true);}  
module addElbow(angel=45,delta=10,br=20,r="",r1=5,r2=5,c="green",n=0){
    n=round(angel/delta+0.5);
    delta=angel/n;
    r1=r!=""?r:r1;
    r2=r!=""?r:r2;   
    dr=(r2-r1)/n; 
    translate([br,0,0])rotate(angel,[0,1,0]){
        color(c)
        for(i=[0:n-1])hull()
          for (j=[i:i+1]) 
              rotate(-delta*j,[0,1,0])translate([-br,0,0])
              cylinder(0.01,r1=r1+dr*j);
        translate([-br,0,0])children();
        }
     }
module addMarker(b=90){
    rotate(b)rotate(-90,[0,1,0])cylinder(20,center=true,$fn=9);
    children();}
module addDoubleWedge(a=0,b=90,c="green")
    addWedge(a=a,c=c)addMarker(b+a)addWedge(a=a,c=c)
    children();
module Nozzle(){
    cylinder(h=2,r=5.6,$fn=6);
    translate([0,0,2])cylinder(h=5,r1=5,r2=1);}
module selection(i)select(i){addWedge()children();
    addDoubleWedge()children();
    addMarker()children();}
    
module selection1(i)
    if (i==0) addWedge()children();
    else if(i==1) addDoubleWedge()children();
    else if(i==2) addMarker()children();
    else if(i==3) addTube()children();
    else children();
        
 rotate(-45)addElbow(45,c="red")rotate(180)addElbow(90,c="red")rotate(180)addElbow()Nozzle(); 
 
*for (i=[-1:3])translate([10*i,0,0])selection1(i)Nozzle();