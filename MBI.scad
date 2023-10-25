include <OpenScadFont.scad>

module MBI( height )
{
	/*
	 * MakerBot
	*/
	
	// M
	fnt_str( [ "M" ], 1, 1, height );
	
	// aker
	translate( [ 0, 20, 0 ] )
		fnt_str( [ "a", "k", "e", "r" ], 4, 1, height );
	
	// Bot
	translate( [ 0, 85, 0 ] )
		fnt_str( [ "B", "o", "t" ], 3, 1, height );
	
	
	/*
	 * INDUSTRIES
	*/
	
	scale( [ 0.91, 0.91, 1 ] )
	{
		translate( [ 25, -1, 0 ] )
		{
			// I
			fnt_str( [ "I" ], 1, 1, height );
	
			// NDUS
			translate( [ 0, 7, 0 ] )
				fnt_str( [ "N", "D", "U", "S" ], 7, 1, height );
	
			// Renderable T
			translate( [ 0, 79.5, 0 ] )
			{
				scale( [ 1, 0.85, 1 ] )
					fnt_str( [ "I" ], 1, 1, height );
			
					scale( [ 0.9, 1.2, 1 ] )
						translate( [ -16.9, -2.6, 0 ] )
							fnt_str( [ "-" ], 1, 1, height );
			}
		
			// RI
			translate( [ 0, 92, 0 ] )
				fnt_str( [ "R", "I" ], 2, 1, height );
	
			// ES
			translate( [ 0, 115, 0 ] )
				fnt_str( [ "E", "S" ], 2, 1, height );
		}
	}
}
