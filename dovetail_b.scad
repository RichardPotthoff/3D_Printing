module dovetail(a=10,b=4,h=10,l=25)
    linear_extrude(l)polygon([[-h,-a+b/2],[-h,a-b/2],[h,b/2],[h,-b/2]]);
module dovetail_template(ang=-30)
    union()
      {
     for (x=[1,-1])
      translate([x*20,0,0])difference()
          {rotate([0,60,0])translate([0,0,-20])dovetail(20,10,10,40);
           rotate([0,x*ang,0])translate([0,0,30])cube(60,center=true);}   
      difference()
        {
        translate([0,0,-20])cube(45 ,center=true);
        for (a=[30,-30]) rotate([0,a,0])translate([0,0,30.01])cube(60,center=true);
        };
      };
//$t=0.5;
for (o_a=[[-40,-30],[40,0]])let(o=o_a[0],a=o_a[1])translate([o,0,0])rotate($t*720){
intersection() 
    {
    translate([0,0,-19.999])cube(40.01,center=true); 
    dovetail_template(ang=a);
        };      
color("blue",1)translate([sin($t*180)^2*25,0,sin($t*180)^2*25*tan(30)+0.01])difference(){
    cube(39.99,center=true);
    dovetail_template(ang=a);
    };}
