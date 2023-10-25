include <MBI.scad>

difference()
{
	cube( [ 62, 150, 10 ], center = true  );

	translate( [ -18, -58, 1 ] )
	{
		MBI( height=5 );
	}
}
