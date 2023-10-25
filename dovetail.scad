
module dovetail1()
  intersection()
    {
    rotate([0,20,0])cube([40,40,20],center=true);
    union()
        {
        cylinder(20,10,0,$fn=3);
        translate([3,-10,0])cube(20);
        };
    };
module dovetail2(a=4,b=10,h=10,l=25)
    linear_extrude(l)polygon([[0,-a/2],[0,a/2],[h,b/2],[h,-b/2]]);
intersection() 
    {
    translate([0,0,-20])cube(40,center=true); 
    union()
      {
      rotate([0,60,0])dovetail2(25,5,20,40);
      translate([-40,0,0])rotate([0,60,0])dovetail2(25,5,20,40);
      difference()
        {
        translate([0,0,-20])cube(40 ,center=true);
        rotate([0,30,0])translate([0,0,30])cube(60,center=true);
        rotate([0,-30,0])translate([0,0,30])cube(60,center=true);
        };
      };
    };
$translate([-40,0,0])rotate([0,60,0])dovetail2(25,5,20,25);