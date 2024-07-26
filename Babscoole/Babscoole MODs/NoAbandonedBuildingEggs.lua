NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"]    = "NoAbandonedBuildingEggs.pak",
["MOD_AUTHOR"]      = "Babscoole",
["NMS_VERSION"]     = "4.15",
["MOD_DESCRIPTION"] = "Removes fiend egg nests from the abandoned building scene",
["MODIFICATIONS"]   =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] =
                    {
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\SCIENTIFICPARTS\LAYOUTS\EXTLAYOUT_ABANDONED1.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\SCIENTIFICPARTS\LAYOUTS\EXTLAYOUT_ABANDONED2.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\SCIENTIFICPARTS\LAYOUTS\EXTLAYOUT_ABANDONED3.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\SCIENTIFICPARTS\LAYOUTS\EXTLAYOUT_ABANDONED4.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\TRADERPARTS\LAYOUTS\EXTLAYOUT_ABANDONED1.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\TRADERPARTS\LAYOUTS\EXTLAYOUT_ABANDONED2.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\TRADERPARTS\LAYOUTS\EXTLAYOUT_ABANDONED3.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\TRADERPARTS\LAYOUTS\EXTLAYOUT_ABANDONED4.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\WARRIORPARTS\LAYOUTS\EXTLAYOUT_ABANDONED1.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\WARRIORPARTS\LAYOUTS\EXTLAYOUT_ABANDONED2.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\WARRIORPARTS\LAYOUTS\EXTLAYOUT_ABANDONED3.SCENE.MBIN",
                        "MODELS\PLANETS\BIOMES\COMMON\BUILDINGS\PARTS\WARRIORPARTS\LAYOUTS\EXTLAYOUT_ABANDONED4.SCENE.MBIN",
                    },
                    ["EXML_CHANGE_TABLE"] =
                    {
                        {
                            ["SPECIAL_KEY_WORDS"] = {"Value", "MODELS\PLANETS\BIOMES\COMMON\RARERESOURCE\GROUND\FIENDEGG.SCENE.MBIN"},
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"Value", ""},
                            }
                        }
                    }
                },
            }
        }
    }
}