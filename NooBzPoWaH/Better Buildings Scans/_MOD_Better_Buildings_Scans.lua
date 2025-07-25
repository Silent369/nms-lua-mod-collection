NMS_MOD_DEFINITION_CONTAINER = 
{
["MOD_FILENAME"] 			= "_MOD_Better_Buildings_Scans", 
["MOD_AUTHOR"]				= "NooBzPoWaH",
["LUA_AUTHOR"]				= "NooBzPoWaH",
["NMS_VERSION"]				= "5.5+",
["MOD_DESCRIPTION"]			= "This mods increases the ships and visor's scans range to find buildings",
["MODIFICATIONS"] 			= 
	{
		{
			["MBIN_CHANGE_TABLE"] 	= 
			{ 
				{
					["MBIN_FILE_SOURCE"] 	= "GCBUILDINGGLOBALS.GLOBAL.MBIN",
					["MXML_CHANGE_TABLE"] 	= 
					{
						{
							["PRECEDING_KEY_WORDS"] = "",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"UnknownBuildingRange",	"4800"}  --Original "600"  line 665
							}
						},
						{
							["PRECEDING_KEY_WORDS"] = "",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"MaxIconRange",	"9600"}  --Original "1200"  line 666
							}
						},
						{
							["PRECEDING_KEY_WORDS"] = "",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"MinShipScanBuildings",	"1"}  --Original "0"  line 669
							}
						},
						{
							["PRECEDING_KEY_WORDS"] = "",
							["VALUE_CHANGE_TABLE"] 	= 
							{
								{"MaxShipScanBuildings",	"4"}  --Original "2" line 670
							}
						}	
					} --4 global replacements
				}	
			}
		}
	}	
}
--NOTE: ANYTHING DOWN HERE IS IGNORED
--ADD THINGS AT THE TOP IF YOU NEED TO
--DON'T ADD ANYTHING PASS THIS POINT HERE