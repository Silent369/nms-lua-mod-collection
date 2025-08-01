ANY_BONUS_SPEED_MULTI = 4

PLANETARY_CONTROL_SPEED = 160
PLANETARY_CONTROL_BOOST = 210

PLANETARY_CONTROL_LIGHT_SPEED = 160
PLANETARY_CONTROL_LIGHT_BOOST = 210

PLANETARY_CONTROL_HEAVY_SPEED = 180
PLANETARY_CONTROL_HEAVY_BOOST = 250

PLANETARY_CONTROL_HOVER_SPEED = 180
PLANETARY_CONTROL_HOVER_BOOST = 250


NMS_MOD_DEFINITION_CONTAINER = {
    ["MOD_FILENAME"]  = "_DeadlyFlying.pak",
    ["MOD_AUTHOR"]    = "gh0stwizard",
    ["NMS_VERSION"]   = "5.63",
    ["MODIFICATIONS"] = {
        {
            ["MBIN_CHANGE_TABLE"] = {
                { -- GCGAMEPLAYGLOBALS.GLOBAL.MBIN
                    ["MBIN_FILE_SOURCE"]  = "GCGAMEPLAYGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["VALUE_CHANGE_TABLE"] = {
                                -- This affects overall speed on your space ship display, as well as AI ship speed.
                                -- Basically, these are global ship's speed multipliers.
                                --{ "SpeedReadoutMultiplier",  1.0 }, -- 1
                                { "SpaceSpeedReadoutMultiplier",  1.0 }, -- 2
                                { "CombatSpeedReadoutMultiplier", 1.0 }, -- 1.5
                            }
                        },
                    }
                },
                { -- GCSPACESHIPGLOBALS.GLOBAL.MBIN
                    ["MBIN_FILE_SOURCE"]  = "GCSPACESHIPGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["VALUE_CHANGE_TABLE"] = {
                                --{ "SpaceCombatFollowModeUseBoost",       "True" }, -- False
                                --{ "SpaceCombatFollowModeMaxTorque",      0.1 },    -- 0.8
                                { "SpaceCombatFollowModeTargetDistance", 1000.0 }, -- 240.0
                                --{ "SpaceCombatFollowModeEvadeTime",      0.0 },      -- 0.2
                                --{ "SpaceCombatFollowModeEvadeThrust",    0.0 },      -- 0.6
                                { "LockTargetRange",                     5000.0 }, -- 2000.0
                                --{ "LockTargetMinDistance",               1 },    -- 100
                            }
                        },
                    }
                },
                { -- GCSPACESHIPGLOBALS.GLOBAL.MBIN
                    ["MBIN_FILE_SOURCE"]  = "GCSPACESHIPGLOBALS.GLOBAL.MBIN",
                    ["EXML_CHANGE_TABLE"] = {
                        {
                            ["VALUE_CHANGE_TABLE"] = {
                                -- looks like affects only planetary flying
                                { "MaxOverspeedBrake",                        0.0 },   -- 1000.0
                                -- make same as ThrustDecaySpring
                                { "ThrustDecaySpringCombat",                  20.0 },  -- 30.0
                                -- freighter! stop slowing my speed!
                                { "FreighterApproachSpeedDamper",             1.0 },   -- 0.5
                                -- tune a bit orientation limits on terrain
                                { "PitchCorrectMaxDownAngle",                 60.0 },  -- 50.0
                                { "PitchCorrectSoftDownAngle",                30.0 },  -- 25.0
                                --
                                { "BoostNoAsteroidRadius ",                   0.0 },   -- 1000.0
                                { "MiniWarpNoAsteroidRadius ",                500.0 }, -- 1500.0
                                -- Looks like that default (out of combat) BoostMultiplier is eq to 2.
                                { "CombatBoostMultiplier",                    2.0 },   -- 5.0
                                { "CombatBoostTurnDamp",                      1.0 },   -- 0.9
                                { "FreighterCombatSpeedMul",                  1.0 },   -- 1.45
                                { "FreighterCombatBoostMul",                  1.0 },   -- 0.5
                                --
                                { "NoBoostCombatEventMinBattleTime",          60.0 },  -- 35.0
                                { "NoBoostCombatEventMinFreighterBattleTime", 60.0 },  -- 55.0
                                { "NoBoostCombatEventTime",                   60.0 },  -- 25.0
                                --
                                { "AvoidancePower",                           0.0 },   -- 3.0
                                { "AvoidanceDistancePower",                   0.0 },   -- 1.5
                                { "3rdPersonAvoidanceAdjustPitchFactor",      0.0 },   -- 0.08
                                { "3rdPersonAvoidanceAdjustRollFactor",       0.0 },   -- -0.018
                                { "3rdPersonAvoidanceAdjustYawFactor",        0.0 },   -- -0.1
                                -- this affects exit station speed too
                                { "MiniWarpExitSpeed ",                       500.0 }, -- 1000.0
                                -- this does not work
                                --{ "MiniWarpExitSpeedStation ",                500.0 }, -- 500.0
                                -- ???
                                -- { "FreighterApproachCombatMinSpeedFactor", 0.0 },  -- 0.2
                            }
                        },
                        --Disables Auto Avoid + most importantly, additional combat speed bonus
                        {
                            ["FOREACH_SKW_GROUP"]  = {
                                { "Avoidance",            "GcSpaceshipAvoidanceData" },
                                { "AvoidanceLowAltitude", "GcSpaceshipAvoidanceData" },
                            },
                            ["VALUE_CHANGE_TABLE"] = {
                                { "NumRays",               0 },   -- 12
                                { "RayMinRange",           0.0 }, -- 40.0
                                { "RaySpeedTime",          0.0 }, -- 6.0
                                { "Force",                 0.0 }, -- 400.0
                                { "StartRadiusMultiplier", 0.0 }, -- 2.0/1.25
                                { "EndRadiusMultiplier",   0.0 }, -- 3.0/2.0
                                { "SpeedInterp",           0.0 }, -- 0.6
                                { "SpeedInterpMinSpeed",   0.0 }, -- 40.0/30.0
                                { "SpeedInterpRange",      0.0 }, -- 30.0
                            }
                        },
                        {
                            ["FOREACH_SKW_GROUP"]  = {
                                { "ControlBonusC", "GcPlayerSpaceshipClassBonuses" },
                                { "ControlBonusB", "GcPlayerSpaceshipClassBonuses" },
                                { "ControlBonusA", "GcPlayerSpaceshipClassBonuses" },
                                { "ControlBonusS", "GcPlayerSpaceshipClassBonuses" },
                            },
                            ["MATH_OPERATION"]     = "*",
                            ["VALUE_CHANGE_TABLE"] = {
                                { "MaxSpeedMax",      ANY_BONUS_SPEED_MULTI },
                                { "MaxSpeedMin",      ANY_BONUS_SPEED_MULTI },
                                { "BoostMaxSpeedMax", ANY_BONUS_SPEED_MULTI },
                                { "BoostMaxSpeedMin", ANY_BONUS_SPEED_MULTI },
                            },
                        },
                        -- space flying
                        {
                            ["FOREACH_SKW_GROUP"]  = {
                                { "Control",      "GcPlayerSpaceshipControlData", "SpaceEngine",  "GcPlayerSpaceshipEngineData" },
                                { "ControlLight", "GcPlayerSpaceshipControlData", "SpaceEngine",  "GcPlayerSpaceshipEngineData" },
                                { "ControlHeavy", "GcPlayerSpaceshipControlData", "SpaceEngine",  "GcPlayerSpaceshipEngineData" },
                                { "ControlHover", "GcPlayerSpaceshipControlData", "SpaceEngine",  "GcPlayerSpaceshipEngineData" },
                                { "Control",      "GcPlayerSpaceshipControlData", "CombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlLight", "GcPlayerSpaceshipControlData", "CombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlHeavy", "GcPlayerSpaceshipControlData", "CombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlHover", "GcPlayerSpaceshipControlData", "CombatEngine", "GcPlayerSpaceshipEngineData" },
                            },
                            ["VALUE_CHANGE_TABLE"] = {
                                { "MaxSpeed",       1000.0 }, -- 180.0
                                { "OverspeedBrake", 0.0 },    -- 3.0
                                { "ReverseBrake",   1.0 },    -- 0.5
                                { "MinSpeed",       0.0 },    -- 1.0
                                { "MinSpeedForce",  0.0 },    -- 5.0
                            },
                        },
                        -- {
                        --     ["FOREACH_SKW_GROUP"]  = {
                        --         { "Control", "GcPlayerSpaceshipControlData.xml", "SpaceEngine",  "GcPlayerSpaceshipEngineData.xml" },
                        --         { "Control", "GcPlayerSpaceshipControlData.xml", "CombatEngine", "GcPlayerSpaceshipEngineData.xml" },
                        --     },
                        --     ["VALUE_CHANGE_TABLE"] = {
                        --         { "BoostMaxSpeed", 1200 }, -- 1200
                        --     }
                        -- },
                        -- {
                        --     ["FOREACH_SKW_GROUP"]  = {
                        --         { "ControlLight", "GcPlayerSpaceshipControlData.xml", "SpaceEngine",  "GcPlayerSpaceshipEngineData.xml" },
                        --         { "ControlLight", "GcPlayerSpaceshipControlData.xml", "CombatEngine", "GcPlayerSpaceshipEngineData.xml" },
                        --     },
                        --     ["VALUE_CHANGE_TABLE"] = {
                        --         { "BoostMaxSpeed", 1300 }, -- 1300
                        --     }
                        -- },
                        -- {
                        --     ["FOREACH_SKW_GROUP"]  = {
                        --         { "ControlHeavy", "GcPlayerSpaceshipControlData.xml", "SpaceEngine",  "GcPlayerSpaceshipEngineData.xml" },
                        --         { "ControlHeavy", "GcPlayerSpaceshipControlData.xml", "CombatEngine", "GcPlayerSpaceshipEngineData.xml" },
                        --         { "ControlHover", "GcPlayerSpaceshipControlData.xml", "SpaceEngine",  "GcPlayerSpaceshipEngineData.xml" },
                        --         { "ControlHover", "GcPlayerSpaceshipControlData.xml", "CombatEngine", "GcPlayerSpaceshipEngineData.xml" },
                        --     },
                        --     ["VALUE_CHANGE_TABLE"] = {
                        --         { "BoostMaxSpeed", 1100 }, -- 1100
                        --     }
                        -- },
                        -- planetary flying
                        {
                            ["FOREACH_SKW_GROUP"]  = {
                                { "Control",      "GcPlayerSpaceshipControlData", "PlanetEngine",      "GcPlayerSpaceshipEngineData" },
                                { "ControlLight", "GcPlayerSpaceshipControlData", "PlanetEngine",      "GcPlayerSpaceshipEngineData" },
                                { "ControlHeavy", "GcPlayerSpaceshipControlData", "PlanetEngine",      "GcPlayerSpaceshipEngineData" },
                                { "ControlHover", "GcPlayerSpaceshipControlData", "PlanetEngine",      "GcPlayerSpaceshipEngineData" },
                                { "Control",      "GcPlayerSpaceshipControlData", "AtmosCombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlLight", "GcPlayerSpaceshipControlData", "AtmosCombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlHeavy", "GcPlayerSpaceshipControlData", "AtmosCombatEngine", "GcPlayerSpaceshipEngineData" },
                                { "ControlHover", "GcPlayerSpaceshipControlData", "AtmosCombatEngine", "GcPlayerSpaceshipEngineData" },
                            },
                            ["VALUE_CHANGE_TABLE"] = {
                                { "OverspeedBrake", 0.0 }, -- 3.0
                            },
                        },
                        -- Control
                        {
                            ["PRECEDING_KEY_WORDS"] = { "Control", "PlanetEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "MaxSpeed",      PLANETARY_CONTROL_SPEED }, -- 125
                                { "BoostMaxSpeed", PLANETARY_CONTROL_BOOST }, -- 155
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "Control", "AtmosCombatEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "MaxSpeed",      PLANETARY_CONTROL_SPEED }, -- 80
                                { "ThrustForce",   20 },                      -- 40
                                { "BoostMaxSpeed", PLANETARY_CONTROL_BOOST }, -- 155
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "Control" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ShipPlanetBrakeMaxSpeed", PLANETARY_CONTROL_SPEED }, -- 90
                            }
                        },
                        -- ControlLight
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlLight", "PlanetEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "MaxSpeed",      PLANETARY_CONTROL_LIGHT_SPEED }, -- 125
                                { "BoostMaxSpeed", PLANETARY_CONTROL_LIGHT_BOOST }, -- 150
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlLight", "AtmosCombatEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ThrustForce",      40 },                            -- 80
                                { "MaxSpeed",         PLANETARY_CONTROL_LIGHT_SPEED }, -- 80
                                { "BoostThrustForce", 200 },                           -- 100
                                { "BoostMaxSpeed",    PLANETARY_CONTROL_LIGHT_BOOST }, -- 155
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlLight" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ShipPlanetBrakeMaxSpeed", PLANETARY_CONTROL_LIGHT_SPEED }, -- 90
                            }
                        },
                        -- ControlHeavy
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHeavy", "PlanetEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "MaxSpeed",      PLANETARY_CONTROL_HEAVY_SPEED }, -- 130
                                { "BoostMaxSpeed", PLANETARY_CONTROL_HEAVY_BOOST }, -- 185
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHeavy", "AtmosCombatEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ThrustForce",      20 },                            -- 40
                                { "MaxSpeed",         PLANETARY_CONTROL_HEAVY_SPEED }, -- 80
                                { "BoostThrustForce", 20 },                            -- 50
                                { "BoostMaxSpeed",    PLANETARY_CONTROL_HEAVY_BOOST }, -- 120
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHeavy" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ShipPlanetBrakeMaxSpeed", PLANETARY_CONTROL_HEAVY_SPEED }, -- 90
                            }
                        },
                        -- ControlHover
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHover", "PlanetEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "MaxSpeed",         PLANETARY_CONTROL_HOVER_SPEED }, -- 130
                                { "BoostMaxSpeed",    PLANETARY_CONTROL_HOVER_BOOST }, -- 185
                                { "BoostThrustForce", 400 },                           -- 400
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHover", "AtmosCombatEngine" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ThrustForce",      20 },                            -- 40
                                { "MaxSpeed",         PLANETARY_CONTROL_HOVER_SPEED }, -- 80
                                { "BoostThrustForce", 400 },                           -- 50
                                { "BoostMaxSpeed",    PLANETARY_CONTROL_HOVER_BOOST }, -- 120
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = { "ControlHover" },
                            ["VALUE_CHANGE_TABLE"]  = {
                                { "ShipPlanetBrakeMaxSpeed", PLANETARY_CONTROL_HOVER_SPEED }, -- 90
                            }
                        },
                    }
                },
            }
        }
    }
}
