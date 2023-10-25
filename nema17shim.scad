module nema17shim(slope,rotation){
difference(){
intersection(){
translate([-20,-20,0])cube([40,40,slope*50+0.5]);
cylinder(r=26,h=slope*105+2,$fn=120);
}//intersection
cylinder(r=15,h=slope*105+2,center=true);
translate([-3,0,-1])cube([6,40,slope*105+2]);
translate([15.5,15.5,0])cylinder(r=1.75,h=slope*105+1,center=true,$fn=24);
translate([15.5,-15.5,0])cylinder(r=1.75,h=slope*105+1,center=true,$fn=24);
translate([-15.5,-15.5,0])cylinder(r=1.75,h=slope*105+1,center=true,$fn=24);
translate([-15.5,15.5,0])cylinder(r=1.75,h=slope*105+1,center=true,$fn=24);
rotate(a=rotation)translate([0,0,slope*25+0.5])rotate(a=atan(slope),v=[0,1,0])translate([-40,-40,0])cube([80,80,slope*50+0.5]);
}//difference
}

//translate([-25,0,0])nema17shim(slope=76/5000,rotation=35);//left
//translate([25,0,0])nema17shim(slope=39.6/5000,rotation=45);//right
//translate([-25,0,0])nema17shim(slope=0.01805,rotation=78.104);//left
//translate([25,0,0])nema17shim(slope=0.007588,rotation=152.4);//right
//translate([-25,0,0])nema17shim(slope=0.012287,rotation=68.81);//left
//translate([25,0,0])nema17shim(slope=0.005811,rotation=98.76);//right
translate([-25,0,0])nema17shim(slope=0.0065844,rotation=137.4);//right