NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"]  = "_Barren Booster",
["MOD_AUTHOR"]    = "Exosolar",
["LUA_AUTHOR"]    = "Babscoole",
["NMS_VERSION"]   = "5.73",
["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "METADATA\SIMULATION\SOLARSYSTEM\BIOMES\BIOMELISTPERSTARTYPE.MBIN",
                    ["MXML_CHANGE_TABLE"] =
                    {
                        {
                            ["REPLACE_TYPE"] = "ALL",
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"Barren", "1000001"},
                            }
                        }
                    }
                }
            }
        }
    }
}