NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"]  = "StationLandingFix.pak",
["MOD_AUTHOR"]    = "JasonDude & Gumsk",
["LUA_AUTHOR"]    = "Babscoole",
["NMS_VERSION"]   = "5.58",
["MODIFICATIONS"] =
    {
        {
            ["MBIN_CHANGE_TABLE"] =
            {
                {
                    ["MBIN_FILE_SOURCE"] = "MODELS\SPACE\SPACESTATION\SPACESTATION\ENTITIES\STATION.ENTITY.MBIN",
                    ["MXML_CHANGE_TABLE"] =
                    {
                        {
                            ["VALUE_CHANGE_TABLE"] =
                            {
                                {"HasOwnGravity",   "True"},
                            }
                        },
                    }
                },
            }
        },
    }
}
