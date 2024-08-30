--Place MODELS folder from mod .pak into AMUMSS\ModScript\GlobalMEFTI for the ANIM files to be added

NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"]  = "_FlyLikeIronManV1.3HalfPowerLimtedFuel.pak",
["MOD_AUTHOR"]    = "DooDooDevan",
["LUA_AUTHOR"]    = "Babscoole",
["NMS_VERSION"]   = "5.03",
["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "GCPLAYERGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["INTEGER_TO_FLOAT"] = "FORCE",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"TeleportRecentre",                    "True"},
                                {"JetpackUnderwaterDrainRate",          "0"},
                                {"JetpackUnderwaterFillRate",           "99999"},
                                {"UnderwaterMaxJetpackSpeed",           "20"},
                                {"UnderwaterJetpackForce",              "15"},
                                {"UnderwaterMaxJetpackEscapeSpeed",     "40"},
                                {"ShowLowAmmoWarning",                  "False"},
                                {"JetpackJetAnimateOutTime",            "-2"},
                                {"JetpackJetAnimateInTime",             "-2"},
                                {"FreeJetpackRange",                    "3"},
                                {"FreeJetpackRangePrime",               "3"},
                                {"FreeJetpackRangeNonTerrain",          "3"},
                                {"JetpackDrainHorizontalFactor",        "0.25"},
                                {"RocketBootsImpulse",                  "25"},
                                {"RocketBootsMinDesiredHeight",         "10"},
                                {"RocketBootsMaxDesiredHeight",         "10"},
                                {"RocketBootsHeightAdjustUpStrength",   "20"},
                                {"RocketBootsHeightAdjustDownStrength", "-20"},
                                {"RocketBootsBoostTankDrainSpeed",      "0"},
                                {"RocketBootsDriftTankDrainSpeed",      "0"},
                                {"RocketBootsDriftDownwardForce",       "20"},
                                {"JetpackForce",                        "21"},
                                {"JetpackBrake",                        "8"},
                                {"JetpackMaxSpeed",                     "25"},
                                {"JetpackMaxUpSpeed",                   "25"},
                                {"JetpackUpForce",                      "27"},
                                {"JetpackFillRate",                     "0.3"},
                                {"JetpackFillRateMidair",               "0.3"},
                                {"SpaceJetpackForce",                   "9999"},
                                {"SpaceJetpackMaxSpeed",                "99"},
                                {"SpaceJetpackDrainRate",               "0"},
                                {"UpgradeExosuitWithProduct",           "False"},
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] =
                            {
                                {"StickCurve",          "TkCurveType.xml"},
                                {"WeaponBobBlendCurve", "TkCurveType.xml"},
                            },
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"Curve", "SmoothInOut"},
                            }
                        },
                    }
                },
                {
                    ["MBIN_FILE_SOURCE"] = "GCCAMERAGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["SPECIAL_KEY_WORDS"] = {"CharacterAirborneCam", "GcCameraFollowSettings.xml"},
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"BackMaxDistance", "2"},
                            }
                        },
                        {
                            ["SPECIAL_KEY_WORDS"] = {"CharacterFallingCam", "GcCameraFollowSettings.xml"},
                            ["INTEGER_TO_FLOAT"] = "FORCE",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"SpeedRange",                    "10"},
                                {"OffsetX",                       "0"},
                                {"BackMaxDistance",               "2"},
                                {"UpMaxDistance",                 "0"},
                                {"PanNear",                       "0"},
                                {"PanFar",                        "10"},
                                {"HorizRotationAngleMaxPerFrame", "10"},
                                {"DistSpeedOutsideMainRange",     "5"},
                                {"SpringSpeed",                   "0.065"},
                                {"CenterStartTime",               "0"},
                                {"CenterBlendTime",               "0"},
                                {"CenterMaxSpring",               "0"},
                                {"CenterMaxSpeed",                "0"},
                                {"VelocityAnticipate",            "0"},
                                {"VelocityAnticipateSpringSpeed", "0"},
                                {"UseSpeedBasedSpring",           "False"},
                            }
                        },
                    }
                },
            }
        }
    }
}