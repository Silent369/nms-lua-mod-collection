Author = "Gumsk"
ModName = "gCam"
ModNameSub = ""
GameVersion = "5.2.9.0"
ModVersion = "a"

--[[Files Modified:
GCCAMERAGLOBALS.GLOBAL.MBIN
]]--

CharacterOffsetXLarge = 0.8
CharacterOffsetXMedium = 0.6
CharacterOffsetXSmall = 0.4
MechOffsetXFollow = 2.2
MechOffsetXCombat = 5
PhotoModeMoveSpeed = 11
PhotoModeVelocitySmoothTime = 0.5

AerialBeaconTime = 5
AerialBeaconAerialViewMode = "FaceDownThenOut"
AerialBeaconTimeBack = 4
AerialBeaconStartTime = 1
AerialBeaconPauseTime = 2.5
AerialBeaconLookTime = 2
AerialBeaconDistance = 2000
AerialBeaconFocusTargetOffsetDistance = 2
AerialSignalTime = 3
AerialSignalAerialViewMode = "FaceOut"
AerialSignalTimeBack = 2
AerialSignalStartTime = 2.5
AerialSignalPauseTime = 0.3
AerialSignalLookTime = 2
AerialSignalDistance = 40
AerialSignalFocusTargetOffsetDistance = 2
AerialWaypointTime = 2
AerialWaypointAerialViewMode = "FaceDown"
AerialWaypointTimeBack = 1.5
AerialWaypointStartTime = 0.4
AerialWaypointPauseTime = 0.2
AerialWaypointLookTime = 2
AerialWaypointDistance = 3
AerialWaypointFocusTargetOffsetDistance = 2
AerialRadioTime = 5
AerialRadioAerialViewMode = "FaceDown"
AerialRadioTimeBack = 3.5
AerialRadioStartTime = 1
AerialRadioPauseTime = 2
AerialRadioLookTime = 2
AerialRadioDistance = 8000
AerialRadioFocusTargetOffsetDistance = 2
AerialVisualTime = 5
AerialVisualAerialViewMode = "FaceDownThenOut"
AerialVisualTimeBack = 4
AerialVisualStartTime = 1
AerialVisualPauseTime = 2.5
AerialVisualLookTime = 2
AerialVisualDistance = 2000
AerialVisualFocusTargetOffsetDistance = 2
AerialRoboTime = 4
AerialRoboAerialViewMode = "FaceDownThenFocus"
AerialRoboTimeBack = 2.5
AerialRoboStartTime = 0.5
AerialRoboPauseTime = 1.5
AerialRoboLookTime = 2
AerialRoboDistance = 350
AerialRoboFocusTargetOffsetDistance = 2.5

FreighterOffsetZ = 200

OffsetGUIF = GUIF({true, [[Do you want the character camera centered?  Default = Y.  Press ENTER for default value.]]},10)
if OffsetGUIF then
	CharacterOffsetXLarge = 0
	CharacterOffsetXMedium = 0
	CharacterOffsetXSmall = 0
	MechOffsetXFollow = 0
	MechOffsetXCombat = 0
end
print("OffsetGUIF = "..tostring(OffsetGUIF))

PhotoModeMoveSpeed = GUIF({17, [[How fast do you want the build and photomode cameras to move?  Default = 17, Vanilla = 11, Turbo = 100.  Press ENTER for default value.]]},10)
if PhotoModeMoveSpeed < 11 then
	PhotoModeVelocitySmoothTime = 0.3 --0.5
elseif PhotoModeMoveSpeed == 11 then
	PhotoModeVelocitySmoothTime = 0.5
elseif PhotoModeMoveSpeed > 11 and PhotoModeMoveSpeed < 20 then
	PhotoModeVelocitySmoothTime = 1.0
elseif PhotoModeMoveSpeed >= 20 and PhotoModeMoveSpeed < 50 then
	PhotoModeVelocitySmoothTime = 2.0
elseif PhotoModeMoveSpeed >= 50 and PhotoModeMoveSpeed < 100 then
	PhotoModeVelocitySmoothTime = 3.0
elseif PhotoModeMoveSpeed >= 100 and PhotoModeMoveSpeed < 500 then
	PhotoModeVelocitySmoothTime = 4.0
elseif PhotoModeMoveSpeed > 500 then
	PhotoModeVelocitySmoothTime = 5.0
end
print("PhotoModeMoveSpeed = "..tostring(PhotoModeMoveSpeed))
print("PhotoModeVelocitySmoothTime = "..tostring(PhotoModeVelocitySmoothTime))

EliminateAerialView = GUIF({true, [[Do you want to eliminate aerieal view zoomouts?  Default = Y.  Press ENTER for default value.]]},10)
if EliminateAerialView then
  AerialBeaconTime = 0.0001
  AerialBeaconAerialViewMode = "FaceOut"
  AerialBeaconTimeBack = 0.0001
  AerialBeaconStartTime = 0.0001
  AerialBeaconPauseTime = 0.0001
  AerialBeaconLookTime = 0.0001
  AerialBeaconDistance = 0.0001
  AerialBeaconFocusTargetOffsetDistance = 0.0001
  AerialSignalTime = 0.0001
  AerialSignalAerialViewMode = "FaceOut"
  AerialSignalTimeBack = 0.0001
  AerialSignalStartTime = 0.0001
  AerialSignalPauseTime = 0.0001
  AerialSignalLookTime = 0.0001
  AerialSignalDistance = 0.0001
  AerialSignalFocusTargetOffsetDistance = 0.0001
  AerialWaypointTime = 0.0001
  AerialWaypointAerialViewMode = "FaceOut"
  AerialWaypointTimeBack = 0.0001
  AerialWaypointStartTime = 0.0001
  AerialWaypointPauseTime = 0.0001
  AerialWaypointLookTime = 0.0001
  AerialWaypointDistance = 0.0001
  AerialWaypointFocusTargetOffsetDistance = 0.0001
  AerialRadioTime = 0.0001
  AerialRadioAerialViewMode = "FaceOut"
  AerialRadioTimeBack = 0.0001
  AerialRadioStartTime = 0.0001
  AerialRadioPauseTime = 0.0001
  AerialRadioLookTime = 0.0001
  AerialRadioDistance = 0.0001
  AerialRadioFocusTargetOffsetDistance = 0.0001
  AerialVisualTime = 0.0001
  AerialVisualAerialViewMode = "FaceOut"
  AerialVisualTimeBack = 0.0001
  AerialVisualStartTime = 0.0001
  AerialVisualPauseTime = 0.0001
  AerialVisualLookTime = 0.0001
  AerialVisualDistance = 0.0001
  AerialVisualFocusTargetOffsetDistance = 0.0001
  AerialRoboTime = 0.0001
  AerialRoboAerialViewMode = "FaceOut"
  AerialRoboTimeBack = 0.0001
  AerialRoboStartTime = 0.0001
  AerialRoboPauseTime = 0.0001
  AerialRoboLookTime = 0.0001
  AerialRoboDistance = 0.0001
  AerialRoboFocusTargetOffsetDistance = 0.0001
end
print("EliminateAerialView = "..tostring(EliminateAerialView))

LargeFreighterWarpFix = GUIF({true, [[Do you want to fix the camera for large freighters during warp?  Default = Y.  Press ENTER for default value.]]},10)
if LargeFreighterWarpFix then
	FreighterOffsetZ = 600
end
print("FreighterOffsetZ = "..tostring(FreighterOffsetZ))

NMS_MOD_DEFINITION_CONTAINER = {
MOD_FILENAME	= ModName.." "..ModNameSub.." "..GameVersion..ModVersion..".pak",
MOD_DESCRIPTION	= "Camera modifications",
MOD_AUTHOR		= Author,
LUA_AUTHOR		= "Gumsk",
NMS_VERSION		= GameVersion,
GLOBAL_INTEGER_TO_FLOAT = "FORCE",
MODIFICATIONS	= {
{
	MBIN_CHANGE_TABLE = {
		{
			MBIN_FILE_SOURCE = "GCCAMERAGLOBALS.GLOBAL.MBIN",
			EXML_CHANGE_TABLE = {
				{
					SPECIAL_KEY_WORDS = {"ID","BEACON"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialBeaconTime},
            {"AerialViewMode", AerialBeaconAerialViewMode},
            {"TimeBack", AerialBeaconTimeBack},
            {"StartTime", AerialBeaconStartTime},
            {"PauseTime", AerialBeaconPauseTime},
            {"LookTime", AerialBeaconLookTime},
            {"Distance", AerialBeaconDistance},
            {"FocusTargetOffsetDistance", AerialBeaconFocusTargetOffsetDistance}
					}
				},
				{
					SPECIAL_KEY_WORDS = {"ID","SIGNAL"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialSignalTime},
            {"AerialViewMode", AerialSignalAerialViewMode},
            {"TimeBack", AerialSignalTimeBack},
            {"StartTime", AerialSignalStartTime},
            {"PauseTime", AerialSignalPauseTime},
            {"LookTime", AerialSignalLookTime},
            {"Distance", AerialSignalDistance},
            {"FocusTargetOffsetDistance", AerialSignalFocusTargetOffsetDistance}
					}
				},
				{
					SPECIAL_KEY_WORDS = {"ID","WAYPOINT"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialWaypointTime},
            {"AerialViewMode", AerialWaypointAerialViewMode},
            {"TimeBack", AerialWaypointTimeBack},
            {"StartTime", AerialWaypointStartTime},
            {"PauseTime", AerialWaypointPauseTime},
            {"LookTime", AerialWaypointLookTime},
            {"Distance", AerialWaypointDistance},
            {"FocusTargetOffsetDistance", AerialWaypointFocusTargetOffsetDistance}
					}
				},
				{
					SPECIAL_KEY_WORDS = {"ID","RADIO_TOWER"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialRadioTime},
            {"AerialViewMode", AerialRadioAerialViewMode},
            {"TimeBack", AerialRadioTimeBack},
            {"StartTime", AerialRadioStartTime},
            {"PauseTime", AerialRadioPauseTime},
            {"LookTime", AerialRadioLookTime},
            {"Distance", AerialRadioDistance},
            {"FocusTargetOffsetDistance", AerialRadioFocusTargetOffsetDistance}
					}
				},
				{
					SPECIAL_KEY_WORDS = {"ID","VISUAL_ONLY"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialVisualTime},
            {"AerialViewMode", AerialVisualAerialViewMode},
            {"TimeBack", AerialVisualTimeBack},
            {"StartTime", AerialVisualStartTime},
            {"PauseTime", AerialVisualPauseTime},
            {"LookTime", AerialVisualLookTime},
            {"Distance", AerialVisualDistance},
            {"FocusTargetOffsetDistance", AerialVisualFocusTargetOffsetDistance}
					}
				},
				{
					SPECIAL_KEY_WORDS = {"ID","ROBO_REVEAL"},
					VALUE_CHANGE_TABLE = {
            {"Time", AerialRoboTime},
            {"AerialViewMode", AerialRoboAerialViewMode},
            {"TimeBack", AerialRoboTimeBack},
            {"StartTime", AerialRoboStartTime},
            {"PauseTime", AerialRoboPauseTime},
            {"LookTime", AerialRoboLookTime},
            {"Distance", AerialRoboDistance},
            {"FocusTargetOffsetDistance", AerialRoboFocusTargetOffsetDistance}
					}
				},
        {
					PRECEDING_KEY_WORDS = "",
					VALUE_CHANGE_TABLE = {
						{"PauseThirdPersonCamInPause", "False"}, --False
						{"DistanceForFleetInteraction", 6000}, --3900
						{"DistanceForFrigateInteraction", 2000}, --650
						{"DistanceForFrigatePurchaseInteraction", 2000}, --500
						{"PhotoModeVelocitySmoothTime", PhotoModeVelocitySmoothTime}, --0.5
						{"PhotoModeMoveSpeed", PhotoModeMoveSpeed}, --11
						{"PhotoModeTurnSpeed", 40}, --60
						{"PhotoModeMaxDistance", 99999}, --100
						{"PhotoModeMaxDistanceSpace", 99999}, --200
						{"PhotoModeCollisionRadius", 0.01}, --0.5
						{"PhotoModeRollSpeed", 35}, --45
						{"BuildingModeMaxDistance", 99999}, --60
						{"BinocularFlashTime", 0}, --0.24
						{"BinocularFlashStrength", 0}, --0.9
						{"ModelViewFlashTime", 0}, --0.8
						{"PhotoModeFlashDuration", 0}, --0.5
						{"PhotoModeFlashIntensity", 0}, --0.5
						{"MiniportalFlashTime", 0}, --0.8
						{"MiniportalFlashStrength", 0}, --0.8
						{"VehicleExitFlashTime", 0}, --0.8
						{"VehicleExitFlashStrength", 0}, --0.8
						{"ScreenshotInTime", 0.5}, --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterUnarmedCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 7}, --4
						{"OffsetX", CharacterOffsetXMedium}, --0.8
						{"OffsetY", 0}, --(-0.6)
						{"BackMinDistance", 3.8}, --4
						{"BackMaxDistance", 5.4}, --5.4
						{"PanNear", 0}, --(-1)
						{"PanFar", 0}, --3
						{"HorizRotationAngleMaxPerFrame", 23}, --20
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-65)
						{"VertRotationMax", 85}, --65
						{"SpringSpeed", 0.01}, --0.05
						{"CenterStartTime", 1.5}, --2.2
						{"CenterBlendTime", 1}, --0.8
						{"CenterMaxSpring", 1}, --0.66
						{"CenterMaxSpeed", 0.1}, --0.1
						{"CenterStartSpeed", 1}, --1
						{"UseSpeedBasedSpring", "False"}, --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterRunCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 12}, --8.8
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", 0}, --(-0.85)
						{"BackMinDistance", 3.8}, --4
						{"BackMaxDistance", 5.4}, --6.5
						{"PanNear", 0}, --(-1)
						{"PanFar", 0}, --3
						{"HorizRotationAngleMaxPerFrame", 15}, --3
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"SpringSpeed", 0.01}, --0.03
						{"CenterStartTime", 2.2}, --0.3
						{"CenterBlendTime", 1}, --0.5
						{"CenterMaxSpring", 1}, --1.2
						{"CenterMaxSpeed", 0.1}, --1.2
						{"CenterStartSpeed", 1}, --2.5
						{"LRProbesRange", 13}, --31
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterCombatCam",
					VALUE_CHANGE_TABLE = {
						{"MinSpeed", 4}, --10
						{"OffsetX", CharacterOffsetXMedium}, --0.7
						{"OffsetY", 0}, --(-0.45)
						{"BackMinDistance", 1.7}, --1.5
						{"BackMaxDistance", 5.4}, --5.2
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-75)
						{"VertRotationMax", 85}, --65
						-- {"CenterStartTime", 1.5}, --1.5
						-- {"CenterBlendTime", 1.5}, --1.5
						-- {"CenterMaxSpring", 0}, --0
						-- {"CenterMaxSpeed", 0.5}, --0.5
						-- {"CenterStartSpeed", 0.1}, --0.1
						{"LRProbesRange", 13}, --31
						{"LRProbesRadius", 0.3}, --0.2
						{"NumUDProbes", 5}, --10
						{"UDProbesRange", 2}, --15
						{"ProbeCenterY", -0.65}, --0.5
						{"PushForwardDropoffLR", 1.6}, --0.2
						{"AvoidCollisionLRSpeed", -1}, --(-4)
						{"AvoidCollisionUDSpeed", 1}, --3
						{"AvoidCollisionPushSpeed", 0.01} --0.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterMiningCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXMedium}, --0.65
						{"OffsetY", 0}, --(-0.6)
						{"BackMinDistance", 1.7}, --2
						{"BackMaxDistance", 5.4}, --5.2
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-75)
						{"VertRotationMax", 85}, --65
						-- {"CenterStartTime", 1.5}, --1.5
						-- {"CenterBlendTime", 1.5}, --1.5
						-- {"CenterMaxSpring", 0}, --0
						-- {"CenterMaxSpeed", 0.5}, --0.5
						-- {"CenterStartSpeed", 0.1}, --0.1
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterIndoorCam",
					VALUE_CHANGE_TABLE = {
						{"MinSpeed", 4}, --10
						{"SpeedRange", 20}, --1
						{"OffsetX", CharacterOffsetXSmall}, --0.4
						{"OffsetY", -0.4}, --(-0.8)
						{"BackMinDistance", 2.3}, --2.3
						{"BackMaxDistance", 3.4}, --2.9
						{"PanNear", 0}, --1
						{"PanFar", 0}, --(-1)
						{"HorizRotationAngleMaxPerFrame", 20}, --15
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-65)
						{"VertRotationMax", 85}, --68
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.03
						{"CenterStartTime", 2.2}, --1.5
						{"CenterBlendTime", 1}, --1
						{"CenterMaxSpring", 1}, --1
						{"CenterMaxSpeed", 0.1}, --0.5
						{"CenterStartSpeed", 1}, --3
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterAbandCombatCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXMedium}, --0.65
						{"OffsetY", -0.2}, --(-0.75)
						{"BackMinDistance", 1.6}, --1.6
						{"BackMaxDistance", 3.4}, --1.8
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-75)
						{"VertRotationMax", 85}, --65
						-- {"CenterStartTime", 1.5}, --1.5
						-- {"CenterBlendTime", 1.5}, --1.5
						-- {"CenterMaxSpring", 0}, --0
						-- {"CenterMaxSpeed", 0.5}, --0.5
						-- {"CenterStartSpeed", 0.1}, --0.1
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterAbandCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXMedium}, --0.65
						{"OffsetY", -0.2}, --(-0.75)
						{"BackMinDistance", 1.6}, --2
						{"BackMaxDistance", 3.4}, --4
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-75)
						{"VertRotationMax", 85}, --65
						-- {"CenterStartTime", 1.5}, --1.5
						-- {"CenterBlendTime", 1.5}, --1.5
						-- {"CenterMaxSpring", 0}, --0
						-- {"CenterMaxSpeed", 0.5}, --0.5
						-- {"CenterStartSpeed", 0.1}, --0.1
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterNexusCam",
					VALUE_CHANGE_TABLE = {
						{"MinSpeed", 4}, --6
						{"SpeedRange", 20}, --5
						{"OffsetX", CharacterOffsetXSmall}, --0.4
						{"OffsetY", 0}, --(-0.8)
						{"BackMinDistance", 2.3}, --3.5
						{"BackMaxDistance", 3.4}, --4.2
						{"PanNear", 0}, --1
						{"PanFar", -1.5}, --(-3)
						{"HorizRotationAngleMaxPerFrame", 20}, --15
						{"VertRotationSpeed", 20}, --15
						{"VertRotationMin", -85}, --(-65)
						{"VertRotationMax", 85}, --68
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.03
						{"CenterStartTime", 2.2}, --1.5
						{"CenterBlendTime", 1}, --0.4
						{"CenterMaxSpring", 1}, --1
						{"CenterMaxSpeed", 0.1}, --0.5
						{"CenterStartSpeed", 1}, --3
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterAirborneCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 20}, --10
						{"OffsetX", CharacterOffsetXLarge}, --0.8
						{"PanFar", 0}, --10
						{"HorizRotationAngleMaxPerFrame", 20}, --10
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistSpeed", 5}, --0.9
						{"DistStiffness", 1}, --3
						{"CenterStartTime", 2.2}, --0.4
						{"CenterBlendTime", 1}, --2
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.5}, --2.8
						{"VertMaxSpring", 1}, --3
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13}, --31
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterMeleeBoostCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 20}, --8.8
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", -0.1}, --(-0.85)
						{"BackMinDistance", 2.5}, --2.5
						{"PanNear", 0}, --(-1)
						{"PanFar", 0}, --3
						{"HorizRotationAngleMaxPerFrame", 20}, --3
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"SpringSpeed", 0.01}, --0.08
						{"CenterStartTime", 2.2}, --1.2
						{"CenterMaxSpring", 1}, --1.2
						{"CenterMaxSpeed", 0.1}, --1.2
						{"CenterStartSpeed", 1}, --2.5
						{"LRProbesRange", 13}, --31
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterRocketBootsCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 20}, --10
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", 0}, --(-0.5)
						{"BackMaxDistance", 7}, --7
						{"PanFar", 0}, --10
						{"HorizRotationAngleMaxPerFrame", 20}, --10
						{"VertRotationMin", -85}, --(-30)
						{"VertRotationMax", 85}, --15
						{"VertRotationOffset", 1}, --0
						{"DistSpeed", 5}, --0.9
						{"DistStiffness", 1}, --3
						{"CenterStartTime", 2.2}, --0.4
						{"CenterBlendTime", 1}, --2
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.1}, --2.8
						{"VertMaxSpring", 1}, --3
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13}, --31
						{"UseSpeedBasedSpring", "False"}, --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterRocketBootsChargeCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXLarge}, --0.8
						{"OffsetY", 0}, --(-0.8)
						{"BackMinDistance", 2.5}, --2.5
						{"BackMaxDistance", 3.4}, --3.5
						{"PanNear", 0}, --(-1)
						{"PanFar", 0}, --3
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						-- {"CenterStartTime", 2.2}, --2.2
						-- {"CenterBlendTime", 0.8}, --0.8
						-- {"CenterMaxSpring", 0.66}, --0.66
						-- {"CenterMaxSpeed", 0.1}, --0.1
						-- {"CenterStartSpeed", 1}, --1
						{"UseSpeedBasedSpring", "False"}, --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterFallingCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXLarge}, --0.8
						{"OffsetY", 0}, --(-0.6)
						{"BackMinDistance", 3.8}, --4
						{"BackMaxDistance", 13}, --20
						{"UpMaxDistance", 0}, --(-5)
						{"PanFar", 0}, --3
						{"HorizRotationAngleMaxPerFrame", 20}, --0
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistSpeed", 5}, --0.9
						{"DistSpeedOutsideMainRange", 5}, --15
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.07
						{"CenterStartTime", 2.2}, --2
						{"CenterBlendTime", 1}, --2
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.1}, --2.8
						{"VertMaxSpring", 1}, --3
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13}, --31
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterAirborneCombatCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 20}, --10
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", 0}, --(-0.5)
						{"BackMaxDistance", 5.4}, --7
						{"PanFar", 0}, --10
						{"HorizRotationAngleMaxPerFrame", 20}, --10
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistSpeed", 5}, --0.9
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.065
						{"CenterStartTime", 2.2}, --0.4
						{"CenterBlendTime", 1}, --2
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.1}, --2.8
						{"VertMaxSpring", 1}, --3
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13}, --31
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterSpaceCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 20}, --10
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", 0.1}, --(-0.5)
						{"BackMaxDistance", 5.4}, --7
						{"PanFar", 0}, --10
						{"HorizRotationAngleMaxPerFrame", 20}, --10
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistSpeed", 5}, --0.9
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.065
						{"CenterStartTime", 2.2}, --0.4
						{"CenterBlendTime", 1}, --2
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.1}, --2.8
						{"VertMaxSpring", 1},
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13} --31
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterSteepSlopeCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXSmall}, --0.4
						{"OffsetY", -0.4}, --(-1.2)
						{"BackMaxDistance", 5.4}, --6
						{"PanNear", 0}, --(-1)
						{"PanFar", 0}, --3
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistStiffness", 1}, --3
						-- {"CenterStartTime", 2.2}, --2.2
						-- {"CenterBlendTime", 0.8}, --0.8
						-- {"CenterMaxSpring", 0.66}, --0.66
						-- {"CenterMaxSpeed", 0.1}, --0.1
						-- {"CenterStartSpeed", 1}, --1
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{	
					PRECEDING_KEY_WORDS = "CharacterUnderwaterCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 10}, --3
						{"OffsetX", CharacterOffsetXMedium}, --0.55
						{"OffsetY", 0.1}, --(-0.6)
						{"BackMaxDistance", 5.4}, --5.5
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"SpringSpeed", 0.01}, --0.11
						-- {"CenterStartTime", 2.2}, --2.2
						{"CenterBlendTime", 1}, --0.6
						-- {"CenterMaxSpring", 0.66}, --0.66
						-- {"CenterMaxSpeed", 0.1}, --0.1
						-- {"CenterStartSpeed", 1}, --1
						{"VertMaxSpring", 1}, --0.2
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterUnderwaterCombatCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 16}, --8
						{"OffsetX", CharacterOffsetXLarge}, --0.7
						{"OffsetY", 0.1}, --(-0.6)
						{"VertRotationMin", -85}, --(-75)
						{"VertRotationMax", 85}, --65
						{"SpringSpeed", 0.01}, --0.08
						{"CenterStartTime", 2.2}, --1.5
						{"CenterBlendTime", 1}, --1.5
						{"CenterMaxSpring", 1}, --0.2
						{"CenterMaxSpeed", 0.1}, --0.5
						{"VertMaxSpring", 1}, --0.2
						{"CenterStartSpeed", 1}, --0.3
						{"LRProbesRange", 13}, --31
						{"NumUDProbes", 5}, --10
						{"UDProbesRange", 5}, --15
						{"PushForwardDropoffLR", 1.6}, --0.2
						{"AvoidCollisionLRSpeed", -1}, --4
						{"AvoidCollisionUDSpeed", 1}, --3
						{"AvoidCollisionPushSpeed", 0.01}, --0.5
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterUnderwaterJetpackCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 16}, --8
						{"OffsetX", CharacterOffsetXMedium}, --0.6
						{"OffsetY", 0.1}, --(-0.5)
						{"PanFar", 0}, --10
						{"HorizRotationAngleMaxPerFrame", 20}, --10
						{"VertRotationMin", -85}, --(-60)
						{"VertRotationMax", 85}, --60
						{"DistSpeed", 5}, --0.9
						{"DistStiffness", 1}, --3
						{"SpringSpeed", 0.01}, --0.065
						{"CenterStartTime", 2.2}, --0.4
						--{"CenterBlendTime", 1}, --1
						{"CenterMaxSpring", 1}, --2.2
						{"CenterMaxSpeed", 0.1}, --2.8
						{"VertMaxSpring", 1}, --3
						{"CenterStartSpeed", 1}, --0.17
						{"LRProbesRange", 13}, --31
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterGrabbedCam",
					VALUE_CHANGE_TABLE = {
						{"SpeedRange", 9}, --3
						{"PanFar", 0}, --5
						{"VertRotationMin", -85}, --20
						{"VertRotationMax", 85}, --45
						{"DistStiffness", 1}, --0.2
						{"SpringSpeed", 0.01}, --0.18
						--{"CenterStartTime", 2.2}, --2.2
						--{"CenterBlendTime", 0.8}, --0.8
						--{"CenterMaxSpring", 0.66}, --0.66
						--{"CenterMaxSpeed", 0.1}, --0.1
						--{"CenterStartSpeed", 1}, --1
						{"UseSpeedBasedSpring", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "CharacterSitCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXSmall} --0.4
					}
				},
				-- {
					-- PRECEDING_KEY_WORDS = "CharacterRideCam",
					-- VALUE_CHANGE_TABLE = {
						-- {"OffsetX", "0"}
					-- }
				-- },
				-- {
					-- PRECEDING_KEY_WORDS = "CharacterRideCamMedium",
					-- VALUE_CHANGE_TABLE = {
						-- {"OffsetX", "0"}
					-- }
				-- },
				-- {
					-- PRECEDING_KEY_WORDS = "CharacterRideCamLarge",
					-- VALUE_CHANGE_TABLE = {
						-- {"OffsetX", "0"}
					-- }
				-- },
				-- {
					-- PRECEDING_KEY_WORDS = "CharacterRideCamHuge",
					-- VALUE_CHANGE_TABLE = {
						-- {"OffsetX", "0"}
					-- }
				-- },
				{
					PRECEDING_KEY_WORDS = "BuggyFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "HovercraftFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "SubmarineFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "BikeFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "WheeledBikeFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "TruckFollowCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin",-70}, --(-25)
						{"VertRotationMax",70}, --30
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime",5} --1.5
					}
				},
				{
					PRECEDING_KEY_WORDS = "MechFollowCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", MechOffsetXFollow}, --2.2
						{"OffsetY", 2}, --(-0.5)
						{"OffsetYAlt", 4}, --2.5
						{"OffsetZFlat", -1}, --0
						{"BackMinDistance", 5.8}, --6.5
						{"BackMaxDistance", 12}, --14
						{"VertRotationMin", -80}, --(-45)
						{"VertRotationMax", 80}, --60
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime", 10}, --2.2
					}
				},
				{
					PRECEDING_KEY_WORDS = "MechCombatCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", MechOffsetXCombat}, --5
						{"OffsetY", 10}, --(-1)
						{"OffsetYAlt", 10}, --1.5
						{"OffsetZFlat", 1.45}, --0
						{"VertRotationMin", -80}, --(-45)
						{"VertRotationMax", 80}, --60
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime", 10}, --2.2
					}
				},
				{
					PRECEDING_KEY_WORDS = "MechJetpackCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXLarge}, --1
						{"OffsetY", 4}, --(-0.85)
						{"OffsetYAlt", 6}, --1
						{"OffsetZFlat", 1}, --0
						{"BackMaxDistance", 16}, --20
						{"VertRotationMin", -80}, --(-60)
						{"VertRotationMax", 80}, --60
						{"LockToObjectOnIdle", "False"}, --True
						{"CenterStartTime", 10}, --0.1
					}
				},
				{
					PRECEDING_KEY_WORDS = "SpaceshipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "DropshipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "ShuttleFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "SpaceshipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "RoyalShipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "ScienceShipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "AlienShipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "SailShipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "RobotShipFollowCam",
					VALUE_CHANGE_TABLE = {
						{"LookStickLimitAngle", "90"}
					}
				},
				{
					PRECEDING_KEY_WORDS = "BuildingIndoorsCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXSmall}, --0.4
						{"OffsetY", 0}, --(-0.8)
						{"VertRotationMin", -80}, --(-65)
						{"VertRotationMax", 80}, --68
						{"CenterStartTime", 10}, --1.5
						{"CenterStartSpeed", 1}, --3
						{"EnableCollisionDetection", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "BuildingOutdoorsCam",
					VALUE_CHANGE_TABLE = {
						{"VertRotationMin", -80}, --(-65)
						{"VertRotationMax", 80}, --65
						{"CenterStartTime", 10}, --2.2
						{"EnableCollisionDetection", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "BuildingUnderwaterCam",
					VALUE_CHANGE_TABLE = {
						{"OffsetX", CharacterOffsetXMedium}, --0.55
						{"OffsetY", 0}, --(-0.6)
						{"VertRotationMin", -80}, --(-60)
						{"VertRotationMax", 80}, --60
						{"CenterStartTime", 10}, --2.2
						{"EnableCollisionDetection", "False"} --True
					}
				},
				{
					PRECEDING_KEY_WORDS = "WarpSettings",
					VALUE_CHANGE_TABLE = {
						{"OffsetZRange", -2.0}, --1.5. Camera distance back from ship/freighter
					}
				},
				{
					PRECEDING_KEY_WORDS = "FreighterWarpSettings",
					VALUE_CHANGE_TABLE = {
						{"OffsetZRange",FreighterOffsetZ}, --200. Camera distance back from ship/freighter
					}
				},
			}
		}
	}
}
}}