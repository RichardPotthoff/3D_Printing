module template()polygon([[0,-20],[0.25,-20],[2,-1.5],[3,-0.5],[3,0.5],[2,1.5],[0,1.5],[0,-20]]);
module template2()union(){template();mirror()template();}
module nail()rotate_extrude()template();
//{translate([5,20,0])nail();translate([20,10,0])nail();}
//linear_extrude(height=5)template2();
rotate([180,0,0])rotate_extrude($fn=60)translate([25,0,0])template2();