//create a dodecahedron by intersecting 6 boxes
module dodecahedronStar(l,d)
  {
  cylinder(h=2*l,r=d/2,center=true,$fn=16);
  for(i=[0:4]) 
    rotate([0,0,72*i])
     rotate([116.565,0,0])
       cylinder(h=2*l,r=d/2,center=true,$fn=16);
  }
  
module dodecahedron(height) 
  intersection()
    {
    //make a cube
    cube([2*height,2*height,height], center = true);
    intersection_for(i=[0:4]) //loop i from 0 to 4, and intersect results
      //make a cube, rotate it 116.565 degrees around the X axis,
      //then 72*i around the Z axis
      rotate([0,0,72*i])
        rotate([116.565,0,0])
          cube([2*height,2*height,height], center = true);
    }

module dodecahedronWithHoles(height,d_outer_sphere,d_hole,d_inner_sphere)
difference(){
  intersection(){
    dodecahedron(height=20,d_outer_sphere=1.17*20,d_inner_sphere=14); 
    sphere(r=d_outer_sphere/2,center=true,$fn=60);
    }
  sphere(r=d_inner_sphere/2,center=true,$fn=30);
  dodecahedronStar(height,d_hole);
  }

module template(offset,D_sphere,d_cone,h_step)
  {
  translate([0,0,offset+D_sphere/2])
    {
    union()
      {
      intersection()
        {
        sphere(r=D_sphere/2,$fn=120);
        translate([0,0,-D_sphere/2])cylinder(r1=d_cone/2,r2=0,h=D_sphere/2,$fn=120);
        }
      sphere(r=D_sphere/2-h_step,$fn=120);
      }
    }
  }

module test(){dodecahedronWithHoles(height=20,d_outer_sphere=1.17*20,d_hole=2.5,d_inner_sphere=14);
#mirror([0,0,1])template(offset=5,D_sphere=50,d_cone=21,h_step=2);
rotate([0,0,72*1])
rotate([116.565,0,0])
template(offset=5,D_sphere=50,d_cone=21,h_step=2);
#rotate([0,0,72*2])
rotate([116.565,0,0])
template(offset=5,D_sphere=50,d_cone=21,h_step=2);
rotate([0,0,72*3])
rotate([116.565,0,0])
template(offset=5,D_sphere=50,d_cone=21,h_step=2);
%dodecahedron(27);
}
module centerPiece()difference()
  {
  dodecahedron(27);
  dodecahedron(20);
  for (i=[1:5])
    rotate([0,0,72*i])
      rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
  cylinder(r=30,h=30);
  }

module cornerPiece()difference()
  {
  intersection()
    {
    dodecahedron(27);
    mirror([0,0,1])template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    rotate([0,0,72*1])
      rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    rotate([0,0,72*2])
      rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    }
  sphere(r=(1.17*20)/2,center=true,$fn=60);
  }
module edgePiece()difference()
  {
  intersection()
    {
    dodecahedron(27);
    mirror([0,0,1])template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    rotate([0,0,72*2])
      rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    }    
    rotate([0,0,72*1])
    rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
    rotate([0,0,72*3])
      rotate([116.565,0,0])
        template(offset=5,D_sphere=50,d_cone=21,h_step=2);
  sphere(r=(1.17*20)/2,center=true,$fn=60);
  }
*centerPiece();
*cornerPiece();
edgePiece();