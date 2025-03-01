----------------------------------------------------------------------------------------
dofile('LIB/_lua_2_exml.lua')
dofile('LIB/shared_lists.lua')
----------------------------------------------------------------------------------------
local mod_desc = [[
  Add a new language file.
  - Generates a separate mbin for each language. If an additional language has missing
   texts, the assigned default is inserted instead.
  - color tag syntax: <RED>my red text<>
   Tags are defined in: METADATA/UI/SPECIALSTYLESDATA.MBIN

  ** The new file's locale name must be added to GCDEBUGOPTIONS.GLOBAL > LocTableList
]]--------------------------------------------------------------------------------------

local text_lines = {
	locale	= 'NMS_88',
	default	= 'EN',
	entries	= {
	---	New text ---
		[new_tech.ROCEKT_ALIEN.name] = {
			EN = [[EMISSIVE SEEDS POD]],
		},
		[new_tech.ROCEKT_ALIEN.namelower] = {
			EN = [[Emissive Seeds Pod]],
		},
		[new_tech.ROCEKT_ALIEN.description] = {
			EN = [[A <TECHNOLOGY>long range<> starship weapon, capable of delivering a targeted seed across great distances.|N|Note: explosive damage is <STELLAR>highly effective<> against <STELLAR>unshielded<> targets, but <TITLE>ineffective<> against <TITLE>shielded<> targets.|N|Use <IMG>CYCLEWEAPON<> to change weapon mode. Press <IMG>SHIPFIRE<> to fire.]],
		},
		[new_tech.ROCEKT_U_ALIEN.name] = {
			EN = [[EXTENDED SEEDS POD]],
		},
		[new_tech.ROCEKT_U_ALIEN.namelower] = {
			EN = [[Extended Seeds Pod]],
		},
		[new_tech.ROCEKT_U_ALIEN.description] = {
			EN = [[A significant extension to emissive seeds pod's capacity, enabling enduring performance, improving exhaust performance and allowing for significantly faster <STELLAR>heat recovery<>.]],
		},
		[new_tech.JUMP_U_ALIEN.name] = {
			EN = [[ENLARGED HEART]],
		},
		[new_tech.JUMP_U_ALIEN.namelower] = {
			EN = [[Enlarged Heart]],
		},
		[new_tech.JUMP_U_ALIEN.description] = {
			EN = [[A significant reinforcement to the vital organ's fibrous metallic superstructure, allowing greater performance and more subtle movement control.]],
		},
		[new_tech.SHIELD_U_ALIEN.name] = {
			EN = [[HORROR NULLIFIER]]
		},
		[new_tech.SHIELD_U_ALIEN.namelower] = {
			EN = [[Horror Nullifier]]
		},
		[new_tech.SHIELD_U_ALIEN.description] = {
			EN = [[Envelops the neurological array and erects a barrier around it against all emotional trauma.]],
		},
		[new_product.SUPERFOOD.name] = {
			EN = [[GLOWING PELLETS]],
		},
		[new_product.SUPERFOOD.namelower] = {
			EN = [[Glowing Pellets]],
		},
		[new_product.SUPERFOOD.description] = {
			EN = [[This odd collection of pellets pulses with a faint, curiously organic phosphorescence. It seems to remember the whole from which it was parted...|N|Consuming a sample seems to be a good for you.]],
		},
		UI_STARCHART_BUILDER_NAME = {
			EN = [[ROAMING BUILDER LOCATOR]],
		},
		UI_STARCHART_BUILDER_NAME_L = {
			EN = [[Roaming Builder Locator]],
		},
		UI_STARCHART_BUILDER_DESC = {
			EN = [[A curious mesh of old and new technology, a hybrid between two entirely separate methods of creation. Nonetheless, this <STELLAR>location tracing device<> appears fully functional.]],
		},
		UI_STARCHART_BUILDER_SUB = {
			EN = [[Harmonious Synthetics Tracker]],
		},
		[new_tech.VEHICLESTUN.name] = {
			EN = [[PARALYSIS GUN]]
		},
		[new_tech.VEHICLESTUN.namelower] = {
			EN = [[Paralysis Gun]]
		},
		[new_tech.VEHICLESTUN.description] = {
			EN = [[Non-violent projectile weapon. Launched projectiles will incapacitate nearby targets with a burst of electrical energy. Effective against both biological and electronic entities.|N|Charged with <FUEL>Unstable Plasma<>.]],
		},
		[new_tech.VEHICLESTUN.subtitle] = {
			EN = [[Stun Weapons]]
		},
		[new_product.RAMMOULD5.name] = {
			EN = [[RAMPANT MOLD]]
		},
		[new_product.RAMMOULD5.namelower] = {
			EN = [[Rampant Mold]]
		},
		[new_product.RAMMOULD5.description] = {
			EN = [[A highly <>EARTH<> concentrated form, up to 1:5 ratio, of the runaway mold. Extremely volatile outside of its seal container! Use of <TECHNOLOGY>power gloves<> recommended.]]
		},
		[new_product.ULTRAPRODX40.name] = {
			EN = [[FUSED STASIS ENABLER]],
			FR = [[ACTIVATEUR DE STASE FUSIBLE]],
		},
		[new_product.ULTRAPRODX40.namelower] = {
			EN = [[Fused Stasis Enabler]],
			FR = [[Activateur De Stase Fusible]],
		},
		[new_product.ULTRAPRODX40.description] = {
			EN = [[This plain-looking custom-made device is so vanishingly rare as to be practically extinct. It's <IMG>UNITSMALL<><RED>value<>, for the right collector, is so outrageous the technology itself is considered worthless.]],
			FR = [[Cet appareil sur mesure d'apparence simple est si rare qu'il est pratiquement éteint. Sa <IMG>UNITSMALL<><RED>valeur<>, pour le bon collectionneur, est si scandaleuse que la technologie elle-même est considérée comme sans valeur.]]
		},
		UI_TECH_EXPLORE_SUB = {
			EN = [[Craftable Exploratory Blueprints]],
		},
		UI_TECH_OFFENSE_SUB = {
			EN = [[Craftable Offensive Blueprints]],
		},
		UI_TECH_ALIEN_SUB = {
			EN = [[Craftable Sentient Vessel Blueprints]],
		},
		RECIPE_MEGASHIELD = {
			EN = [[Requested Operation: Illegal <FUEL>Improbable<> Shielding]],
		},
		BODYSHIELD_NAME = {
			EN = [[PERSONAL SHIELD]],
			FR = [[BOUCLIER PERSONNEL]]
		},
		BODYSHIELD_NAME_L =	{
			EN = [[Personal Shield]],
			FR = [[Bouclier personnel]]
		},
		BODYSHIELD_SUBTITLE = {
			EN = [[Cheating anti-cheat protection]],
			FR = [[Protection anti-triche anti-triche]]
		},
		BODYSHIELD_DESCRIPTION = {
			EN = [[Protects your person from <RED>Malevolent<> travelers, Atlas <STELLAR>glitches<> and various annoyances]],
		},
		UI_GEODE_NAME_CAVE = {
			EN = [[CAVE GEODE]],
		},
		UI_GEODE_NAME_CAVE_L = {
			EN = [[Cave Geode]],
		},
		UI_GREEN_CRYSTAL_NAME = {
			EN = [[Ionised Cobalt Crystals]],
			FR = [[Cristaux de cobalt ionisés]],
		},
		UI_EMOTE_CHAT_FEED_CREATURE_ALT = {
			EN = [[Offer %PRODUCT%]],
		},
		UI_CD_EX_SYM	= { EN = [[Cd+]] },
		UI_EM_EX_SYM	= { EN = [[Em+]] },
		UI_IN_EX_SYM	= { EN = [[In+]] },
		UI_CU_EX_SYM	= { EN = [[Cu+]] },
		UI_SGUNK1_SYM	= { EN = [[Ю]]	},
		UI_SGUNK2_SYM	= { EN = [[Ψ]]	},
		UI_SGUNK3_SYM	= { EN = [[FeO]]},
		UI_SGUNK4_SYM	= { EN = [[Щ]]	},
		UI_SGUNK5_SYM	= { EN = [[œ]]	},
		UI_TIMEDUST_SYM	= { EN = [[Љ]]	},
		UI_TIMEMILK_SYM	= { EN = [[Ҩ]]	},
		UI_ROBOT2_SYM	= { EN = [[An]]	},

	---	Existing text overwritten ---

		UI_EXOHAZ_RAD_NAME = {
			EN = [[ENVIRONMENTAL SHIELD]],
		},
		UI_EXOHAZ_RAD_NAME_L = {
			EN = [[Environmental Shield]],
		},
		UI_EXOHAZ_RAD_DESC = {
			EN = [[This environmental neutralising protection is plugged directly into the pilot as they enter the cockpit. The system is powered via the main engine and requires no additional input. Some minor pain may be noticed around the insertion site.|N|Bolsters the pilot's resistence to <STELLAR>all environmental hazards<>.]],
		},
		INTRCT_EMPTY = {
			EN = [[.]],
		},
		UI_FREIGHTER_FUEL_1_NAME = {
			EN = [[FRIGATE FUEL]],
		},
		UI_FREIGHTER_FUEL_1_NAME_L = {
			EN = [[Frigate Fuel]],
		},
		UI_FREIGHTER_FUEL_2_NAME = {
			EN = [[FRIGATE FUEL x2]],
		},
		UI_FREIGHTER_FUEL_2_NAME_L = {
			EN = [[Frigate Fuel x2]],
		},
		UI_FREIGHTER_FUEL_3_NAME = {
			EN = [[FRIGATE FUEL x4]],
		},
		UI_FREIGHTER_FUEL_3_NAME_L = {
			EN = [[Frigate Fuel x4]],
		},

		UI_SENT_LASER_NAME = {
			EN = [[MULTIPLEX LASER]],
		},
		UI_SENT_LASER_NAME_L = {
			EN = [[Multiplex Laser]],
		},
		UI_SHIPGUN_ROBO_NAME = {
			EN = [[PREVALENCE GUN]],
		},
		UI_SHIPGUN_ROBO_NAME_L = {
			EN = [[Prevalence Gun]],
		},
		UI_SHIPJUMP_ROBO_NAME = {
			EN = [[OSCILLATION GENERATOR]],
		},
		UI_SHIPJUMP_ROBO_NAME_L = {
			EN = [[Oscillation Generator]],
		},
		UI_HYPERDRIVE_ROBO_NAME = {
			EN = [[SANGUINE CORE]],
		},
		UI_HYPERDRIVE_ROBO_NAME_L = {
			EN = [[Sanguine Core]],
		},
		UI_LIFESUP_ROBO_NAME = {
			EN = [[GLASS/BOUNDARY TERMINAL]],
		},
		UI_LIFESUP_ROBO_NAME_L = {
			EN = [[Glass/Boundary Terminal]],
		},
		UI_LIFESUP_ROBO_SUB = {
			EN = [[Pilot Interface]],
		},
		MECH_SCAN_FACT = {
			EN = [[Industrial Facilities]],
		},
		VEHICLE_BUILDING_NPC = {
			EN = [[Racial Monuments]],
		},
		SIGNAL_PLAQUE = {
			EN = [[Racial Plaque Detected]],
		},
		SIGNAL_MONOLITH = {
			EN = [[Racial Monolith Detected]],
		},
		UI_SALVAGE_TECH_10_NAME = {
			EN = [[STARSHIP AI KERNEL]],
		},
		UI_SALVAGE_TECH_10_NAME_L = {
			EN = [[starship AI Kernel]],
		},
		UI_GEODE_NAME = {
			EN = [[ROCK GEODE]],
		},
		UI_GEODE_NAME_L = {
			EN = [[Rock Geode]],
		},
		QUICK_MENU_TIP_THIRDPERSONSHIP = {
			EN = [[Toggle Camera View]],
		},
		UT_SHOT_NAME = {
			EN = [[SHELL IGNITER]],
		},
		UT_SHOT_NAME_L = {
			EN = [[Shell Igniter]],
		},
		UT_SHOT_DESC = {
			EN = [[A combat upgrade for the <TECHNOLOGY>Scatter Blaster<>. This module installs series of delicately calibrated fuel-injection nozzles within the firing chamber, which are used to initiate a controlled burn within its shells, while still offering improved <STELLAR>reload times<>.|N||N|Causes targets to <RED>burn<> for a short while, causing additional damage]],
		},
		UI_LAUNCHSUB2_SYM	= { EN = [[H2]]	},
		UI_HEXITE_SYM		= { EN = [[Ӂ]]	},
		UI_SUNGOLD_SYM		= { EN = [[ζ]]	},
		UI_SOULFRAG_SYM		= { EN = [[§]]	},
		UI_WORMDUST_SYM		= { EN = [[∂]]	},

		NOTIFY_BINOCULARS			= { EN = ' ' },
		NOTIFY_BOOST				= { EN = ' ' },
		NOTIFY_SHIPBOOST			= { EN = ' ' },
		NOTIFY_SHIPJUMP				= { EN = ' ' },
		NOTIFY_SCANNER				= { EN = ' ' },
		NOTIFY_JETPACK				= { EN = ' ' },
		NOTIFY_NOJETPACK			= { EN = ' ' },
		NOTIFY_SHIPJUMP_PC			= { EN = ' ' },
		NOTIFY_TORCH				= { EN = ' ' },
		NOTIFY_TAKEOFF				= { EN = ' ' },
		UI_CREATURE_MOUNT_TITLE		= { EN = ' ' },
		UI_CREATURE_MOUNT_MSG		= { EN = ' ' },
		UI_NEXUS_SALVAGE_TITLE		= { EN = ' ' },
		UI_NEXUS_TECHFRAG_TITLE		= { EN = ' ' },
		UI_NOTIFY_SHIP_SUMMON		= { EN = ' ' },
		UI_NOTIFY_TAKEOFF			= { EN = ' ' },
		UI_NOTIFY_LASER_SUB			= { EN = ' ' },
		UI_NOTIFY_LASER_MSG3		= { EN = ' ' },
		UI_NOTIFY_EXOCRAFT_TIP_TITLE= { EN = ' ' },
		UI_NOTIFY_SHIP_TIP_TITLE	= { EN = ' ' },
		UI_NOTIFY_TIP_TITLE			= { EN = ' ' },
	}
}

------------------------------------------------------------------------------

local languages = {
	EN = 'English',
	FR = 'French',
	IT = 'Italian',
	DE = 'German',
	ES = 'Spanish',
	RU = 'Russian',
	PL = 'Polish',
	NL = 'Dutch',
	PT = 'Portuguese',
	LA = 'LatinAmericanSpanish',
	BR = 'BrazilianPortuguese',
	Z1 = 'SimplifiedChinese',
	ZH = 'TraditionalChinese',
	Z2 = 'TencentChinese',
	KO = 'Korean',
	JA = 'Japanese',
	US = 'USEnglish'
}

local function InsertCharEntities(s)
	local entity = {
		{'&',	'&amp;'}, -- must be first
		{'<',	'&lt;'},
		{'>',	'&gt;'},
		{'"',	'&quot;'},
		{'|N|',	'&#xA;'}
	}
	for _,e in ipairs(entity) do
		s = s:gsub(e[1], e[2])
	end
	return s
end

-- return a complete TkLocalisationTable exml
local function BuildLocaleText(lang_code)
	local T = {meta = {'name', 'Table'}}
	for id, text in pairs(text_lines.entries) do
		-- if a locale text is missing, insert default locale text
		local code = text[lang_code] and lang_code or text_lines.default
		T[#T+1] = {
			meta	= {'value', 'TkLocalisationEntry.xml'},
			Id		= id,
			[languages[lang_code]] = InsertCharEntities(text[code])
		}
	end
	return FileWrapping(T, 'TkLocalisationTable')
end

local function AddLanguageFiles()
	local lang_codes = {}
	-- collect all language codes from entries
	for _,e in pairs(text_lines.entries) do
		for k,_ in pairs(e) do
			lang_codes[k] = true
		end
	end
	local T = {}
	for code,_ in pairs(lang_codes) do
		T[#T+1] = {
			FILE_CONTENT	 = BuildLocaleText(code),
			FILE_DESTINATION = string.format(
				'LANGUAGE/%s_%s.EXML',
				text_lines.locale,
				languages[code]
			):upper()
		}
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= string.format('_LANG %s_Personal.pak', text_lines.locale),
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= AddLanguageFiles(),
	-- MODIFICATIONS		= {{
		-- MBIN_CHANGE_TABLE	= {
		-- {
			-- MBIN_FILE_SOURCE	= 'GCDEBUGOPTIONS.GLOBAL.MBIN',
			-- EXML_CHANGE_TABLE	= {
				-- {
					-- PRECEDING_KEY_WORDS	= 'LocTableList',
					-- ADD					= ToExml({
						-- meta	= {'value', 'NMSString0x20.xml'},
						-- Value	= text_lines.locale
					-- })
				-- }
			-- }
		-- }
	-- }}}
}
