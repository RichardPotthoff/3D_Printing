module cube_()
  hull()for (x=[-1,1])for(y=[-1,1])for(z=[-1,1])translate([x,y,z])sphere(0.5,$fn=20);
module octaeder()
  hull()for(a = [[0,0,0],[0,90,0],[0,0,90]])rotate(a)for(x=[-1,1])translate([x,0,0])sphere(0.5,$fn=20);
octaeder();