include <MBI.scad>

union()
{
	cube( [ 62, 150, 10 ], center = true  );

	rotate( [ 180, 0, 0 ] )
	{
		translate( [ -18, -58, -9 ] )
		{
			MBI( height=5 );
		}
	}
}
