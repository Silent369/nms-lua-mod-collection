LightFOV = 360
LightFalloff = "linear"					--"quadratic" ; use linear if your lights are dim, quadratic if they are really bright
LightMultiplier = 0.5						--1
LightRedOf1 = 1.0
LightGreenOf1 = 1.0
LightBlueOf1 = 1.0

NMS_MOD_DEFINITION_CONTAINER = {
MOD_FILENAME		= "GLight 234a Atlas.pak",
MOD_DESCRIPTION		= "Atlas Light modifications",
MOD_AUTHOR			= "Gumsk",
NMS_VERSION			= "2.3.4",
MODIFICATIONS		= {{ MBIN_CHANGE_TABLE = {{ MBIN_FILE_SOURCE = {

--Atlas Station
		"MODELS\SPACE\ATLASSTATION\ATLASSTATION_EXTERIOR.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\EXTERIOR\FRONTFACE.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_2.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_3.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_4.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_5.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_6.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_7.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_8.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_9.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_10.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_BASESCENE.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_ENDING_1.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\ATLASINTERIOR_ENDING_2.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\INTERIORLIGHTS.SCENE.MBIN",
		"MODELS\SPACE\ATLASSTATION\MODULARPARTS\INTERIOR\INTERIORROOM.SCENE.MBIN"
		},
		
EXML_CHANGE_TABLE = {
	-- {SPECIAL_KEY_WORDS		= {"Name","FOV"},
		-- REPLACE_TYPE 		= "ALL",
		-- VALUE_CHANGE_TABLE	= {
			-- {"Value", LightFOV}}},
	{SPECIAL_KEY_WORDS 		= {"Name","FALLOFF"},
		REPLACE_TYPE 		= "ALL",
		VALUE_CHANGE_TABLE	= {
			{"Value", LightFalloff}}},
	{SPECIAL_KEY_WORDS 		= {"Name","INTENSITY","Value","IGNORE"},
		["MATH_OPERATION"]		= "*",
		REPLACE_TYPE 		= "ALL",
		VALUE_CHANGE_TABLE	= {
			{"IGNORE", LightMultiplier}}},
	-- {SPECIAL_KEY_WORDS = {"Name","COL_R"},
		-- REPLACE_TYPE 		= "ALL",
		-- VALUE_CHANGE_TABLE	= {
			-- {"Value", LightRedOf1}}},
	-- {SPECIAL_KEY_WORDS = {"Name","COL_G"},
		-- REPLACE_TYPE 		= "ALL",
		-- VALUE_CHANGE_TABLE	= {
			-- {"Value", LightGreenOf1}}},
	-- {SPECIAL_KEY_WORDS = {"Name","COL_B"},	
	-- REPLACE_TYPE 		= "ALL",
		-- VALUE_CHANGE_TABLE	= {
			-- {"Value", LightBlueOf1}}}
}}}}}}