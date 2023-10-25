translate([-5,-5,5])rotate([90,90,90])intersection(){
    linear_extrude(7.4)translate([10,0,0])rotate(90)text("G");
translate([10,0,-1.2])rotate(-90,[0,1,0])linear_extrude(11){text("E");};
translate([0,10,-1.2])rotate(90,[1,0,0])translate([10,0,0])rotate(90)linear_extrude(11){text("B");};
};