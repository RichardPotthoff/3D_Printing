module bellowA()
difference()
{
union()
{
difference(){
cylinder(r=15,h=0.8,$fn=180);
translate([0,0,0.3])cylinder(r=12.5,h=1.,$fn=180);
translate([0,0,0.2])cylinder(r=12.2,h=1.,$fn=180);

}
cylinder(r=5.3,h=0.3,$fn=180);
}
translate([0,0,-0.1])cylinder(r=2.5,h=1.2,$fn=180);
}
module bellowB()
difference(){
union()
{
cylinder(r=15,h=0.2,$fn=180);
cylinder(r=5,h=0.5+0.2,$fn=180);
cylinder(r=5.3,h=0.1+0.2,$fn=180);

}
translate([0,0,-0.1])cylinder(r=2.5,h=1.2,$fn=180);
}

translate([-16,0,0])bellowA();
translate([16,0,0])bellowB();