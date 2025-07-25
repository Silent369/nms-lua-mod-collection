local Types =
{
    PRODUCT = "Product",
    SUBSTANCE = "Substance"
}

local NewRequirementsArray =
{
    {
        PRODUCTID = "TECH_COMP",
        REQUIREMENTS =
        {
            {REQUIREMENTID = "CAVE1", REQUIREDAMOUNT = "100", REQUIREDTYPE = Types.SUBSTANCE},
            {REQUIREMENTID = "ROBOT2", REQUIREDAMOUNT = "100", REQUIREDTYPE = Types.SUBSTANCE},
            {REQUIREMENTID = "MICROCHIP", REQUIREDAMOUNT = "2", REQUIREDTYPE = Types.PRODUCT}
        }
    }
}

NMS_MOD_DEFINITION_CONTAINER =
{
    MOD_FILENAME = "CraftableWiringLoom",
    MOD_DESCRIPTION = "Craft WiringLoom",
    MOD_AUTHOR = "Jackty89",
    MODIFICATIONS =
    {
        {
            MBIN_CHANGE_TABLE =
            {
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/TABLES/NMS_REALITY_GCPRODUCTTABLE.MBIN",
                    MXML_CHANGE_TABLE = {}
                },
                {
                    MBIN_FILE_SOURCE = "METADATA/REALITY/TABLES/UNLOCKABLEITEMTREES.MBIN",
                    MXML_CHANGE_TABLE = {}
                }
            }
        }
    }
}

local Changes_To_Product_Table = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE[1].MXML_CHANGE_TABLE
local Changes_To_Unlockable_Item_Trees = NMS_MOD_DEFINITION_CONTAINER.MODIFICATIONS[1].MBIN_CHANGE_TABLE[2].MXML_CHANGE_TABLE

function Create_Requirement(Requirement)
    local RequirementID = Requirement.REQUIREMENTID
    local RequirementAmount = Requirement.REQUIREDAMOUNT
    local RequirementInventoryType = Requirement.REQUIREDTYPE

    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SPECIAL_KEY_WORDS = {"ID", "CASING", "Requirements", "GcTechnologyRequirement"},
        SEC_SAVE_TO = "SINGLE_REQ"
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = "SINGLE_REQ",
        VALUE_CHANGE_TABLE =
        {
            {"ID", RequirementID},
            {"InventoryType", RequirementInventoryType},
            {"Amount", RequirementAmount}
        }
    }
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EDIT = "PRODUCT_REQ_MASTER",
        ADD_OPTION = "ADDafterSECTION",
        SEC_ADD_NAMED = "SINGLE_REQ"
    }
end

function Create_Requirement_Sections(Requirements)
    Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
    {
        SEC_EMPTY = "PRODUCT_REQ_MASTER"
    }

    for i = 1, #Requirements do
        Create_Requirement(Requirements[i])
    end
end

function Add_Product_To_Unlockable_Item_Tree(ProductId)
    Changes_To_Unlockable_Item_Trees[#Changes_To_Unlockable_Item_Trees + 1] =
    {
        SPECIAL_KEY_WORDS = {'Unlockable', 'T_WALL_Q_H'},
        SEC_SAVE_TO = "ITEM_TREE_SEC"
    }
    Changes_To_Unlockable_Item_Trees[#Changes_To_Unlockable_Item_Trees + 1] =
    {
        SEC_EDIT = "ITEM_TREE_SEC",
        VALUE_CHANGE_TABLE =
        {
            {"Unlockable", ProductId}
        }
    }
    Changes_To_Unlockable_Item_Trees[#Changes_To_Unlockable_Item_Trees + 1] =
    {
        SPECIAL_KEY_WORDS = {"Unlockable", "PRODFUEL2"},
        PRECEDING_KEY_WORDS = {"Children"},
        SEC_ADD_NAMED = "ITEM_TREE_SEC"
    }
end

function Change_Product_Requirement_And_Set_Craftable()
    for i = 1, #NewRequirementsArray do
        local ProductId = NewRequirementsArray[i].PRODUCTID
        local Requirements = NewRequirementsArray[i].REQUIREMENTS
        Create_Requirement_Sections(Requirements)
        Add_Product_To_Unlockable_Item_Tree(ProductId)

        Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
        {
            SPECIAL_KEY_WORDS = {"Id", ProductId},
            VALUE_CHANGE_TABLE =
            {
                {"IsCraftable", "True"}
            }
        }
        Changes_To_Product_Table[#Changes_To_Product_Table + 1] =
        {
            SPECIAL_KEY_WORDS = {"Id", ProductId, "CraftAmountMultiplier", "1"},
            PRECEDING_KEY_WORDS = {"Requirements"},
            CREATE_HOS = "TRUE",
            SEC_ADD_NAMED = "PRODUCT_REQ_MASTER"
        }
    end
end

Change_Product_Requirement_And_Set_Craftable()