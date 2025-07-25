-- Ship Hunting Assistant // Will NOT affect default seeds!
-- Author: DarkScythe
-- Date Created: Jul 03, 2022
-- Last Updated: Aug 29, 2023
--------------------------------------------------------------------------------
modName		= "FastLocateAssistantforShipHunting"
batchName	= ""
modAuthor	= "DarkScythe"
modMaint	= "DarkScythe"
modDesc		= "Speeds up ship hunting by filtering to specific types and increases spawn rates WITHOUT affecting default seeds so you get the same ships as vanilla players in every system. Helpful for players who want to share coordinates of interesting finds with others."
modVer		= "1.1"
scriptVer	= "a"
gameVer		= "4.42"
-- Credits --
-- Thanks to Lenni and Apex Fatality for the idea of isolating ship models.
-- Thanks to Gumsk for the idea of speeding up NPC spawns.

--[[
Toggle ship types to look for here (mix and match using true/false)
-----------------------------------------------------------------------------
If looking for Exotics, it is recommended to disable all other types as well.
If other types are enabled alongside Exotics, it is assumed the primary
target are the other types, and Exotics may take a while to spawn.

You can technically disable everything, but then nothing will spawn.
You can also enable everything and ship pools will be as normal, but with
extra spawns and boosted turnover at trading posts.
--]]
huntExotics			= true	-- Extreme spawn rate boost if all others are disabled
huntExplorers		= false
huntFighters		= false
huntHaulers			= false
huntShuttles		= false	-- I don't know why anyone wants to, but if you do, go ahead
huntSolars			= false

--[[
Optional toggles for additional settings
-----------------------------------------------------------------------------
Note that enabling either of these will cause the mod to load additional files.
These files will then conflict with any other mod that alters those files.

Forcing S-Class will force *everything* in the system to be S-class
including Ships, Freighters, and Multitool Cabinets.
This may be unwanted if you're trying to share coordinates, as a cabinet may not
normally be an S class.

Spawn Frequency Multiplier can be adjusted as well, but it will also load
another file and potentially cause conflict with other mods using that file.
Honestly, I didn't notice much of a difference using it, so default is off.
--]]
forceSClass				= false
modSpawnFreqMultis		= false
spawnFreqMultiOverride	= 100	-- Only used if modSpawnFreqMultis is enabled
								-- Default values range from 0.5 to 5

---- **** END OF USER-ADJUSTABLE SETTINGS **** ----
-----------------------------------------------------------------------------
---- Alter following code only if this mod is no longer being maintained ----
-----------------------------------------------------------------------------

-- AMUMSS Input Request Definitions
-- Using the values defined in the variables above as the fallback
inputPrompts		= {
	tweakSettings	= {false,
[[	Would you like to tweak this mod's settings?
	Pressing ENTER without a response to any question will use CURRENT settings from the Lua script.
]]},
	findExotics		= {huntExotics,
[[	[#1 / 6] Do you want to find Exotic Ships?
	Default: Y | Current: >> ]] .. (huntExotics and "Y" or "N") .. [[ <<
]]},
	findExplorers	= {huntExplorers,
[[	[#2 / 6] Do you want to find Explorers?
	Default: N | Current: >> ]] .. (huntExplorers and "Y" or "N") .. [[ <<
]]},
	findFighters	= {huntFighters,
[[	[#3 / 6] Do you want to find Fighters?
	Default: N | Current: >> ]] .. (huntFighters and "Y" or "N") .. [[ <<
]]},
	findHaulers		= {huntHaulers,
[[	[#4 / 6] Do you want to find Haulers?
	Default: N | Current: >> ]] .. (huntHaulers and "Y" or "N") .. [[ <<
]]},
	findShuttles	= {huntShuttles,
[[	[#5 / 6] Do you want to find Shuttles?
	Default: N | Current: >> ]] .. (huntShuttles and "Y" or "N") .. [[ <<
]]},
	findSolars		= {huntSolars,
[[	[#6 / 6] Do you want to find Solar Sail ships?
	Default: N | Current: >> ]] .. (huntSolars and "Y" or "N") .. [[ <<
]]},
	tweakOpts		= {false,
[[	Would you like to adjust the optional script settings?
]]},
	toggleSRank		= {forceSClass,
[[	Do you want to restrict all spawns to S-class?
	Default: N | Current: >> ]] .. (forceSClass and "Y" or "N") .. [[ <<
]]},
	toggleSpawnFreq	= {modSpawnFreqMultis,
[[	Do you want to change the spawn frequency multipliers?
	Default: N | Current: >> ]] .. (modSpawnFreqMultis and "Y" or "N") .. [[ <<
]]},
	getFreqOverride	= {spawnFreqMultiOverride,
[[	Please enter any non-negative number as a desired spawn frequency multiplier:
	Default: 0.5 ~ 5 | Current: >> ]] .. spawnFreqMultiOverride .. [[ <<
]]},
	processNone		= {false,
[[	WARNING: Current settings will result in ZERO ship types being spawned!
	Do you want to continue processing the script with these settings?
	Default: N
]]},
}

-- Allow overrides to avoid needing to make any changes to the Lua at all
if GUIF(inputPrompts.tweakSettings, 10) then
	-- Get ship types desired
	huntExotics		= GUIF(inputPrompts.findExotics,	5)
	huntExplorers	= GUIF(inputPrompts.findExplorers,	5)
	huntFighters	= GUIF(inputPrompts.findFighters,	5)
	huntHaulers		= GUIF(inputPrompts.findHaulers,	5)
	huntShuttles	= GUIF(inputPrompts.findShuttles,	5)
	huntSolars		= GUIF(inputPrompts.findSolars,		5)
	-- See if Optional Settings need changing
	if GUIF(inputPrompts.tweakOpts, 5) then
		forceSClass				= GUIF(inputPrompts.toggleSRank,		5)
		modSpawnFreqMultis		= GUIF(inputPrompts.toggleSpawnFreq,	5)
		spawnFreqMultiOverride	= modSpawnFreqMultis and GUIF(inputPrompts.getFreqOverride, 10) or spawnFreqMultiOverride
	end
end

-- Safety check
assert(type(spawnFreqMultiOverride) == "number" and spawnFreqMultiOverride >= 0,
	"Invalid Spawn Frequency Multiplier defined: Must be a non-negative number.")

--[[
These are the files being used by this mod.
Adjust these if the filenames or directory structures ever change,
and the mod is no longer being maintained.

This mod will conflict with any other mod that alters these same files.
A spot for merging in code from conflicting mods is provided in the tables below.
Note that ONLY code from AMUMSS' MXML_CHANGE_TABLE blocks should be pasted there.

Two files are optional, and should only be active (and conflict with other mods)
if their associated optional toggles are enabled; Otherwise they shouldn't load.
One other file is *conditionally* optional: Only when nothing is filtered.
Space for merging code for all files exist in various functions at the bottom.
Look for spaces that have been marked as reserved for merging for each file.
--]]

-- Main files always required by this mod
spawnTableFile		= "METADATA\SIMULATION\SCENE\EXPERIENCESPAWNTABLE.MBIN"
shipGlobalFile		= "GCAISPACESHIPGLOBALS.GLOBAL.MBIN"

-- This file is optional ONLY if every ship type is enabled simultaneously
-- In that case nothing is filtered, so the script will skip the file entirely
shipManagerFile		= "METADATA\SIMULATION\SPACE\AISPACESHIPMANAGER.MBIN"

-- Optional files that should only be in use when their toggles are enabled
-- Will NOT conflict with other mods using these files if toggles remain disabled
inventoryTableFile	= "METADATA\REALITY\TABLES\INVENTORYTABLE.MBIN"	-- forceSClass
solargenGlobalFile	= "GCSOLARGENERATIONGLOBALS.GLOBAL.MBIN"		-- modSpawnFreqMultis

-----------------------------------------------------------------------------
--
-- Begin Definition of Variables and Data
--
-----------------------------------------------------------------------------

--[[
Starting with information from AISPACESHIPMANAGER
-------------------------------------------------
Add/edit entries to/in this table if new ship types get added/modified.
Remember to add a new toggle at the top for new ship types.
Path to each model's Scene files should be exactly as found in the above file.
Ignoring Freighters and Living Ships because the latter doesn't spawn naturally.
--]]
shipInfo = {
	{shipActive = huntExotics,		shipFile = "MODELS/COMMON/SPACECRAFT/S-CLASS/S-CLASS_PROC.SCENE.MBIN"},
	{shipActive = huntExplorers,	shipFile = "MODELS/COMMON/SPACECRAFT/SCIENTIFIC/SCIENTIFIC_PROC.SCENE.MBIN"},
	{shipActive = huntFighters,		shipFile = "MODELS/COMMON/SPACECRAFT/FIGHTERS/FIGHTER_PROC.SCENE.MBIN"},
	{shipActive = huntHaulers,		shipFile = "MODELS/COMMON/SPACECRAFT/DROPSHIPS/DROPSHIP_PROC.SCENE.MBIN"},
	{shipActive = huntShuttles,		shipFile = "MODELS/COMMON/SPACECRAFT/SHUTTLE/SHUTTLE_PROC.SCENE.MBIN"},
	{shipActive = huntSolars,		shipFile = "MODELS/COMMON/SPACECRAFT/SAILSHIP/SAILSHIP_PROC.SCENE.MBIN"},
}

-- We need to find keywords that let us specify which code block to modify.
-- Still using AISPACESHIPMANAGER for these.
-- Alter these values if they ever change to something else at some point.
shipFaction		= "Civilian"	-- We're not interested in Player/Pirate/Police factions
fileHandle		= "Filename"	-- In case they change this again in the future

-- Time to figure out what ship types we need to work with.
-- ************************************
-- **** DO NOT CHANGE THIS SECTION ****
-- ************************************
-- Breaking this loop may break the whole mod if we need to filter anything

--[[
This loop checks our shipInfo table to see which ship types have been enabled.

Disabled ones have entries created for AMUMSS to overwrite their model files
with empty strings to effectively prevent the game from being able to load them.
These are loaded into the empty table we'll declare below and will be recalled
later to insert the entries into the AMUMSS mod container, after it exists.
--]]

-- This table will be filled in automatically in a moment.
shipsToRemove	= {}

-- Scan through shipInfo and fill in the above table
for i = 1, #shipInfo do
	if not shipInfo[i].shipActive then
		shipsToRemove[#shipsToRemove + 1] = {fileHandle, shipInfo[i].shipFile}
	end
end

-- We can now figure out how many ship types are active
-- We need this number to scale spawn rates with later
activeShipCount	= #shipInfo - #shipsToRemove

-- Second safety check, in case all ship types got filtered out
if activeShipCount == 0 then
	assert(GUIF(inputPrompts.processNone, 10),
		"Script processing canceled by user: No ship types selected.")
end

--[[
Define some multipliers for various spawn rate numbers we need.
These values have been tested to give pretty good results as-is
but can be altered for specific needs.
--]]

-- Space generally has fewer spawns than on-planet, so we'll boost those more
spaceSpawnMulti		= 2
-- If Exotics are the ONLY ship type enabled, we need to boost spawns dramatically
-- since their natural spawn rate is so low, otherwise you'd likely see nothing at all
exoticSpawnMulti	= (huntExotics and not (huntExplorers or huntFighters or huntHaulers or huntShuttles or huntSolars)) and 10 or 1
-- If Exotics are not the only type enabled (or not at all) then we'll boost
-- max active spawns a bit to handle the more numerous regular ships spawning
maxSpawnMulti		= exoticSpawnMulti > 1 and 1 or 2

--[[
Define spawn count limits.
Min/Max counts are reduced as more ship types are enabled.
This is because there's a greater chance to spawn them instead of "empty" spawns.
Reducing the count alleviates absolute chaos with 50+ ships spawning in at once.
Max active increases instead, to handle more "successful" ship spawns.
--]]

-- Minimum spawn count between 3 to 8 (80 if only Exotic)
minSpawns		= (#shipInfo + 3 - activeShipCount) * exoticSpawnMulti
-- Maximum spawn count between 5 to 10 (100 if only Exotic)
maxSpawns		= (#shipInfo + 5 - activeShipCount) * exoticSpawnMulti
-- Maximum active spawns total between 104 to 124 (520 if only Exotic)
maxActiveSpawns	= (#shipInfo + 19 + activeShipCount) * spaceSpawnMulti * exoticSpawnMulti * maxSpawnMulti

--[[
The following table modifies entries from GCAISPACESHIPGLOBALS
--------------------------------------------------------------
Update these only if they change at some point in the future, or if new entries
related to ship spawning behaviors are added.

These settings are adjusted to make finding specific ships much faster.
--]]

-- This table will be inserted into the AMUMSS mod container table later
shipBehaviorAdjustments = {
	VCT	= {
		-- These settings allow more ships to land
		-- Warning: Space Stations may fill up and not allow you inside
		{"MaxNumActiveTraders", maxActiveSpawns},	-- Default 15 // Modded 104~520 depending on ship types
		{"FillUpOutposts", true},					-- Default false

		-- These settings allow ships to cycle in and out faster
		{"MinimumCircleTimeBeforeLanding", 3},		-- Default 5
		{"MinimumTimeBetweenOutpostLandings", 1},	-- Default 3
		{"DockWaitMinTime", 15},					-- Default 20
		{"DockWaitMaxTime", 30},					-- Default 60
		
		-- These settings affect spawning controls
		{"SpaceStationTraderRequestTime", 1},		-- Default 20
		{"ShipSpawnStationRadius", 500},			-- Default 2000
		{"TraderArriveSpeed", 3000},				-- Default 300
		{"TraderArriveTime", 1},					-- Default 3

		-- Additional settings pending investigation
		{"TraderWantedTime", 10},					-- Default 20
		{"TraderRequestTime", 1},					-- Default 5
		{"TradingPostTraderRequestTime", 1},		-- Default 5
		{"TradingPostTraderRangeSpace", 1000},		-- Default 3000

		-- Any extra/new settings below if they don't require additional lookup
		-- Those that do will need to be added to the main Mod Container table

	},
}

-----------------------------------------------
---- BEGIN MAIN AMUMSS MOD CONTAINER TABLE ----
-----------------------------------------------
-- This is still just a Lua table at its core, so you can add to it later
-- See the if() blocks near the bottom for how to reference it
NMS_MOD_DEFINITION_CONTAINER	= {
	MOD_FILENAME		= table.concat({"__", modName, "_v", modVer, ".", gameVer, scriptVer, ".pak"}),
	MOD_BATCHNAME		= batchName ~= "" and (batchName .. ".pak") or nil,
	MOD_DESCRIPTION		= modDesc,
	MOD_AUTHOR			= modAuthor,
	LUA_AUTHOR			= modAuthor,
	MOD_MAINTENANCE		= modMaint,
	NMS_VERSION			= gameVer,

	-- Actual mod container
	MODIFICATIONS	= {
		{
			MBIN_CHANGE_TABLE	= {
				{
					-- Modding EXPERIENCESPAWNTABLE
					-- Adjust the keywords if they ever change in future versions
					MBIN_FILE_SOURCE	= spawnTableFile,
					MXML_CHANGE_TABLE	= {
						{
							-- OutpostSpawns controls the waves bound for
							-- Planetary Trading posts
							PKW	= {"OutpostSpawns", "Count"},
							VCT	= {
								{"x", minSpawns},	-- "x" is used as the min
								{"y", maxSpawns},	-- "y" is used as the max
							},						-- Update if they ever change
						},
						{
							PKW	= {"OutpostSpawns", "Spread"},
							VCT	= {
								{"x", 15},	-- Default 20
								{"y", 20},	-- Default 30
							},
						},
						{
							-- TraderSpawns controls the waves bound for
							-- Space Stations
							PKW	= {"TraderSpawns", "Count"},
							VCT	= {
								{"x", minSpawns * spaceSpawnMulti},
								{"y", maxSpawns * spaceSpawnMulti},
							},
						},
						{
							PKW	= {"TraderSpawns", "Spread"},
							VCT	= {
								{"x", 10},	-- Default 100
								{"y", 15},	-- Default 100
							},
						},
						{
							-- SpaceFlybySpawns controls the additional waves
							-- that spawn when you're flying around in space
							-- Used to help supplement the naturally lower
							-- spawns in space
							PKW	= {"SpaceFlybySpawns", "Count"},
							VCT	= {
								{"x", minSpawns * spaceSpawnMulti},
								{"y", maxSpawns * spaceSpawnMulti},
							},
						},
						{
							PKW	= {"SpaceFlybySpawns", "Spread"},
							VCT	= {
								{"x", 20},	-- Default 300
								{"y", 30},	-- Default 300
							},
						},
						----------------------------------------------------------------
						---- Merge additional changes to EXPERIENCESPAWNTABLE below ----
						----------------------------------------------------------------

					}
				},
				{
					-- Modding GCAISPACESHIPGLOBALS
					-- All of these changes were already defined earlier, so
					-- we'll just insert the table as-is here
					MBIN_FILE_SOURCE	= shipGlobalFile,
					MXML_CHANGE_TABLE	= {
						shipBehaviorAdjustments,
						----------------------------------------------------------------
						---- Merge additional changes to GCAISPACESHIPGLOBALS below ----
						----------------------------------------------------------------

					}
				},
			}
		}
	}
}
------------------------------------------------
---- END OF MAIN AMUMSS MOD CONTAINER TABLE ----
------------------------------------------------

---------------------------------------------------
-- Begin Lua functions for optional table additions
-- Do not modify unless you know what you are doing
---------------------------------------------------

--[[
This block is contained inside an IF condition to prevent two things:
1. A harmless warning about an empty table from AMUMSS if nothing is filtered.
2. This mod using AISPACESHIPMANAGER if there's nothing to remove from it.

Again, the ONLY time this section doesn't run / file becomes optional is when
every single ship type is enabled simultaneously, meaning no ships are filtered.
--]]
if #shipsToRemove > 0 then
	local shipSpawnFilter = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE
	shipSpawnFilter[#shipSpawnFilter + 1] = {
		MBIN_FILE_SOURCE	= shipManagerFile,
		MXML_CHANGE_TABLE	= {
			{
				PRECEDING_FIRST	= "TRUE",
				PKW				= shipFaction,
				FSKWG			= shipsToRemove,
				REPLACE_TYPE	= "ONCE",
				VCT				= {
					{fileHandle, ""}
				},
			},
			--------------------------------------------------------------
			---- Merge additional changes to AISPACESHIPMANAGER below ----
			--------------------------------------------------------------

		}
	}
end

--[[
This block is contained inside an IF condition to prevent the mod from
conflicting with other mods needing to use INVENTORYTABLE when its associated
toggle is not enabled.

Remember that enabling this will cause things besides ships to also be forced
to S-Class.

Merging to this table can be done directly below, but is not necessary unless
forceSClass is enabled.
--]]
if forceSClass then
	local addExtraTable = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE
	addExtraTable[#addExtraTable + 1] = {
		MBIN_FILE_SOURCE	= inventoryTableFile,
		MXML_CHANGE_TABLE	= {
			{
				-- Update this if the keyword ever changes in the future
				PKW				= "ClassProbabilityData",
				REPLACE_TYPE	= "ALL",
				VCT				= {
					{"C", 0},
					{"B", 0},
					{"A", 0},
					{"S", 100},
				}
			},
			----------------------------------------------------------
			---- Merge additional changes to INVENTORYTABLE below ----
			----------------------------------------------------------

		}
	}
end

--[[
This block is similarly contained inside an IF condition to prevent the mod from
conflicting with other mods needing GCSOLARGENERATIONGLOBALS when its
associated toggle is not enabled.

Merging to this table can be done directly below, but is not necessary unless
modSpawnFreqMultis is enabled.

Bear in mind that any changes to this table that affect the overall distribution
of ships and such in the system WILL CHANGE THE SEEDS USED which may cause
other people not running the same mods to see different ships and make sharing
reliable coordinates impossible.

This one change to Spawn Frequency does not alter seeds.
--]]
if modSpawnFreqMultis then
	local addExtraTable = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE
	addExtraTable[#addExtraTable + 1] = {
		MBIN_FILE_SOURCE	= solargenGlobalFile,
		MXML_CHANGE_TABLE	= {
			{
				-- Update these keywords if they ever change in the future
				PKW				= "SpaceshipSpawnFreqMultipliers",
				MATH_OP			= "*",
				REPLACE_TYPE	= "ALL",
				VCT				= {
					{"IGNORE", 0}
				}
			},
			{
				PKW				= "SpaceshipSpawnFreqMultipliers",
				MATH_OP			= "+",
				ITF				= "FORCE",
				REPLACE_TYPE	= "ALL",
				VCT				= {
					{"IGNORE", spawnFreqMultiOverride}
				}
			},
			--------------------------------------------------------------------
			---- Merge additional changes to GCSOLARGENERATIONGLOBALS below ----
			--------------------------------------------------------------------

		}
	}
end