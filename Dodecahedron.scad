//create a dodecahedron by intersecting 6 boxes
module dodecahedron(height,d_outer_sphere,d_hole,d_inner_sphere) 
  {
  module punchedCube(){ difference(){
   cube([2*height,2*height,height], center = true);
   cylinder(h=2*height,r=d_hole/2,center=true,$fn=16);
  } }
difference(){
  intersection(){
                intersection(){
                        //make a cube
                      punchedCube();
                        intersection_for(i=[0:4]) //loop i from 0 to 4, and intersect results
                        { 
                                //make a cube, rotate it 116.565 degrees around the X axis,
                                //then 72*i around the Z axis
                                rotate([0,0,72*i])
                                        rotate([116.565,0,0])
                                       punchedCube();
                        }
                }
sphere(r=d_outer_sphere/2,center=true,$fn=60);
        }
sphere(r=d_inner_sphere/2,center=true,$fn=30);
}
}
//call the module with a height of 2
dodecahedron(height=20,d_outer_sphere=1.17*20,d_hole=2.5,d_inner_sphere=14); 
