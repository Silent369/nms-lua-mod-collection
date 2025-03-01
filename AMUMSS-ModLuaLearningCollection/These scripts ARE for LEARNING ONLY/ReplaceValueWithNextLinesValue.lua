NMS_MOD_DEFINITION_CONTAINER =
{
["MOD_FILENAME"]            = "Always-SClass-MaxStats.pak",
["MOD_AUTHOR"]              = "dvkkha converted by Mjjstral",
["NMS_VERSION"]             = "1.77",
["MODIFICATIONS"]           =
    {
        {
            ["MBIN_CHANGE_TABLE"]   =
            {
                {
                    ["MBIN_FILE_SOURCE"]    = "METADATA\REALITY\TABLES\INVENTORYTABLE.MBIN",
                    ["EXML_CHANGE_TABLE"]   =
                    {                                             --MaxSlots value used can be any number of line below MinSlots
                        {                                           --"F:..." says look "forward"(below the ... line), "B:..." would mean look "backward" (before the ... line)
                            ["MATH_OPERATION"]      = "*F:MaxSlots",    --find MaxSlots value that comes after MinSlots and multiply by "1", (one means just replace MinSlots value with MaxSlots value)
                            ["REPLACE_TYPE"]        = "ALL",                    --ALL matching are replaced
                            ["VALUE_CHANGE_TABLE"]  =
                            {
                                {"MinSlots",        "1"},                                 --due to the "F:..." above, we do not replace MinSlots with "1" but do the MATH_OPERATION on its value
                            }
                        },
                        {
                            ["MATH_OPERATION"]      = "*F:MaxTechSlots",
                            ["REPLACE_TYPE"]        = "ALL",
                            ["VALUE_CHANGE_TABLE"]  =                 --"" lets the TOOL decide based on the type of the Value entered in the ["VALUE_CHANGE_TABLE"] = {{"Property", "Value"}
                            {
                                {"MinTechSlots",    "1"},
                            }
                        },
                        {
                            ["PRECEDING_KEY_WORDS"] = "ClassMultiplier",
                            ["REPLACE_TYPE"]        = "ALL",                    --"ALL" forces the tool to continue looking down the file for all instances found
                            ["VALUE_MATCH_TYPE"]    = "number",         --"number" explicitely forces the tool to replace only when the value type matches a "number" (so no "string" are replaced here)
                            ["VALUE_CHANGE_TABLE"]  =                 --if you would specify "string", a bunch of "string" would be wrongly replaced because
                            {                                         --there are lines in the EXML file that look like this
                                {"C",   "0"},                             --      <Property name="B" value="GcInventoryGenerationBaseStatClassData.xml">
                                {"B",   "0"},                             --and NMS would not work anymore if the "string" was changed to "0"
                                {"A",   "0"},
                                {"S",   "100"},                                           --BUT the TOOL will make an educated guest based on the value type entered here, like "100" is of type "number"
                            }                                         --so it will define ["VALUE_MATCH_TYPE"] to be "number"
                        },
                    }
                },
            }
        },
    }
}
--NOTE: ANYTHING NOT referenced in table NMS_MOD_DEFINITION_CONTAINER IS IGNORED AFTER THE SCRIPT IS LOADED
