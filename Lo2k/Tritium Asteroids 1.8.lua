NMS_MOD_DEFINITION_CONTAINER = 
{
["MOD_FILENAME"] 			= "Tritium Asteroids 1.8.pak", 
["MOD_AUTHOR"]				= "Lo2k",
["NMS_VERSION"]				= "3.33",
["MOD_DESCRIPTION"]			= "This mod makes small asteroids dispensing Tritium only",
["MODIFICATIONS"] 			= 
	{
		{
			["MBIN_CHANGE_TABLE"] 	= 
			{ 
				{
					["MBIN_FILE_SOURCE"] 	= "GCSOLARGENERATIONGLOBALS.GLOBAL.MBIN",
					["EXML_CHANGE_TABLE"] 	= 
					{
						{
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"CommonAsteroidResourceFuelMultiplier",	"3"},
								{"CommonAsteroidResourceProduct", "GEODE_SPACE"},
								{"CommonAsteroidResourceMain", "ROCKETSUB"},
								{"CommonAsteroidResourceSecondary", "ROCKETSUB"},

							}
						}
					}
				}
			}
		}
	}	
}