---------------------------------------------------------------------------------------
local mod_desc = [[
  Utilizes the SCENE files' descriptive name and path to match 'tags'
  from solar_modifiers table to each scene, then multiples the tags' values
  with the properties in spawn_data table.

  Multiple modifiers in the same scene path are averaged:
  - Example:
   ROCKS/LARGE/LARGEROCK.SCENE.MBIN   >> LARGE & ROCK
   ROCKS/MEDIUM/MEDIUMROCK.SCENE.MBIN >> MEDIUM & ROCK
   FOLIAGE/MEDIUMPLANT.SCENE.MBIN     >> FOLIAGE & MEDIUM & PLANT

  - A well-chosen tag can match anything from any scene file across all
   biomes (MODEL), to a single instance of one scene (VOLCANO).
  - solar_modifiers.biomes are modifiers for specific source files.
   They can match more than one source: LUSH will be applied to ALL lush biomes,
   and LUSHBUBBLE applied to the one source with the matching name, overwriting LUSH.
  - The biome-specific modifiers are added to -or replace solar_modifiers.global_flora
   table and are averaged with it.
  - Adding {ov=true} to a tag make it an override - Other matches will be discarded,
   unless the the tag is overwritten by a biome tag.
  - Adding {ul=true} to a tag adds an ULTRA section to QualityVariants and performs
   the mod's changes only in the new section.
  - A tag with the single modifier {ig=true} causes the scene to be ignored.
  - Other properties of GcObjectSpawnData.xml can be modded by adding a property's
   name to spawn_data with a unique key, then adding tag modifiers for it.
]]-------------------------------------------------------------------------------------

--	Properties of [GcObjectSpawnData.xml] being modified
local spawn_data = {
	calcs = {
		ns	= 'MinScale',				-- [*] multiplier modifier
		xs	= 'MaxScale',				-- [*]
		an	= 'MaxAngle',				-- [+] additive modifier
		sw	= 'ShearWindStrength',		-- [*]
		cr	= 'Coverage',				-- [*]
		ld	= 'LodDistances',			-- [*]
		dn	= 'FlatDensity',			-- [*] affects SlopeDensity
		fo	= 'FadeOutStartDistance',	-- [*] affects FadeOutEndDistance
		rr	= 'MaxRegionRadius',		-- [+]
		pr	= 'MaxImposterRadius',		-- [+] *10 multiplier
	},
	flags = {
        cp	= 'CollideWithPlayer',
        cv	= 'CollideWithPlayerVehicle',
        dv	= 'DestroyedByPlayerVehicle',
		ds	= 'DestroyedByPlayerShip'
	}
}

local solar_modifiers = {
	biomes = {
		{
			biotg = 'LUSH',
			flora = {-- applied to all LUSH sources
				TREE		= {ns=1.15,	xs=2.4,		cr=0.9,	ld=1.25},
				BUBBLELUSH	= {ns=1.15,	xs=1.65,	fo=2.6}
			}
		},
		{
			biotg = 'LUSHBIGPROPS',
			flora = {
				TREE		= {ns=1.05,	xs=2.2,		cr=0.86},
				CROSS		= {an=-5}
			}
		},
		{
			biotg = 'LUSHBUBBLE',
			flora = {
				TREE		= {xs=2.25,	cr=0.86},
				FERN		= {ns=1.4,	xs=2.6}
			}
		},
		{
			biotg = 'LUSHOBJECTSFULL',
			flora = {
				FERN		= {ns=1.3,	xs=1.9},
				FLOWER		= {ns=1.4,	xs=1.8}
			}
		},
		{
			biotg = 'LUSHHQTENTACLE',
			flora = {
				TENTACLE	= {ns=1.2,	xs=1.78,	cr=0.94}
			}
		},
		{
			biotg = 'LUSHROOMB',
			flora = {
				SHROOMSINGL	= {ns=1.8,	xs=2.85,	ov=true}
			}
		},
		{
			biotg = 'FROZEN',
			flora = {-- applied to all FROZEN sources
				TREE 		= {ns=1.15,	xs=2.45,	cr=0.8,	ld=1.25},
				LIVINGSHIP	= {rr=-1,	ld=1.02}
			}
		},
		{
			biotg = 'RADIOBIG',
			flora = {
				ROCK		= {ns=1.1,	xs=1.3,		cr=0.95}
			}
		},
		{
			biotg = 'RADIOSPIKEPOTATO',
			flora = {
				WEIRD		= {xs=1.4,	cr=1.2} -- potato
			}
		},
		{
			biotg = 'SCORCHED',
			flora = {
				HUGESPIRE	= {ns=0.9,	xs=0.95,	cr=0.8}
			},
			flags = {
				MEDIUMSPIRE	= {dv=true}
			}
		},
		{
			biotg = 'TOXIC',
			flora = {
				HUGETOXIC	= {ns=0.7,	xs=0.96,	cr=0.78}
			}
		},
		{
			biotg = 'TOXICOBJECTSFULL',
			flora = {
				LARGEBLOB	= {ns=0.4,	xs=0.8},
				FUNGALTREE	= {ns=1.15,	xs=1.75,	cr=0.86}
			}
		},
		{
			biotg = 'ROCKY',
			flora = {-- less -and smaller rocks on rocky biomes
				FACEBLEND	= {ns=0.8,	xs=0.84,	cr=0.76,	ov=true},
				TOXICGRASS	= {xs=1.9,				cr=1.05},
			}
		},
		{
			biotg = 'SWAMP',
			flora = {
				GROVELARGEF	= {ns=1.05,	xs=1.55,	cr=1.02,	ul=true,	ov=true},
				GROVELARGE	= {ns=0.8,	xs=-0.7, 	cr=0.82,	ul=true},
				HQTREE		= {ns=1.15,	xs=2.5,		cr=0.9},
				FERN		= {ns=1.5,	xs=2.1},
				FLOWER		= {ns=1.4,	xs=1.8, 	sw=0.94}
			}
		},
		{
			biotg = 'HUGERING',
			flora = {
				ROCKRING	= {cr=0.7}
			}
		},
		{
			biotg = 'ALIEN',
			flora = {
				LARGE		= {ns=0.95,	xs=1.02,	cr=0.92},
				MEDIUM		= {ns=0.9,	xs=1.05,	cr=0.82},
				SMALL		= {ns=0.95,	xs=1.05},
			}
		},
		{
			biotg = 'WEIRD',
			flora = {
				WEIRD		= {ld=2.6,	rr=6,		ul=true},
				BONESPIRE	= {pr=7},
				CONTOUR		= {pr=7},
				SHELLSAIL	= {pr=8},
				SHELLSHARD	= {pr=8},
				HYDROGARDEN	= {pr=7},
				MSTRUCTURE	= {pr=7},
			}
		},
		{
			biotg = 'LEVELONE',
			flora = {
				DEBRIS		= {cr=0, 	ov=true},
				CRATE		= {cr=0, 	ov=true},
				UNDERGROUND	= {cr=0.1, 	ov=true},
				WORDSTONE	= {cr=0.33}
			}
		},
		{
			biotg = 'STORMCRYSTAL',
			flags = {
				STORMCRYST	= {cv=true,	dv=false}
			}
		},
		{
			biotg = 'FIENDEGG',
			flora = {
				FIENDEGG	= {cr=0.4}
			}
		},
		{
			biotg = 'PLANT',
			flora = {
				INTERACTIVE	= {ns=0.48,	xs=0.01,	cr=1.1},
				TENTACLEP	= {cr=0.5},
				SPOREVENT	= {cr=0.5},
				FLYTRAP		= {cr=0.5}
			}
		},
		{
			biotg = 'UNDERWATER',
			flora = {
				CRYSTAL		= {xs=0.95,	cr=0.5,	dn=0.8, 	ov=true},
				GASBAG		= {xs=0.85,	cr=0.5,	dn=0.9}
			}
		}
	},
	global_flora = {
		SHARD		= {ns=1.05,	xs=1.4},
		SPIRE		= {ns=1.15,	xs=1.3},
		ROCK		= {ns=1.2,	xs=1.75},
		CACTUS		= {ns=1.1,	xs=1.55},
		TREE		= {ns=1.15,	xs=2.4,	ld=1.8},
		SHROOM		= {ns=1.05,	xs=2.5},
		FOLIAGE		= {ns=1.1,	xs=1.3},
		FLOWERS		= {xs=1.2,			fo=1.4},
		CROSS		= {ns=0.95,	xs=1.1,	fo=2.0,	dn=0.88,	ld=1.5},	-- grass
		LBOARD		= {ns=0.95,	xs=1.1,	fo=1.8,	dn=0.88,	ld=1.5},	-- grass
		LUSHGRASS	= {xs=1.4,			fo=1.6,	dn=0.88,	ld=1.5},	-- grass
		BUBBLELUSH	= {xs=1.15,			fo=2.2,				ld=1.5},	-- grass
		TOXICGRASS	= {ns=1.2,	xs=1.6,	fo=1.4,	sw=0},					-- shrooms!
		PLANT		= {ns=0.94,	xs=1.5},
		TENDRIL		= {ns=1.1,	xs=1.55,		fo=1.4},
		BOULDER		= {ns=1.1,	xs=1.4},
		CURVED		= {xs=1.5},
		DROPLET		= {ns=1.05,	xs=1.55},
		SPORE		= {xs=1.2},
		LARGE		= {ns=1.2,	xs=1.6,	cr=0.92},
		MEDIUM		= {ns=1.05,	xs=0.95},
		SMALL		= {ns=0.95,	xs=0.8},

	--- global lod multiplier
		SCENE		= {ld=1.24},

	---	ignored
		LAVA		= {ig=true},
		FRAGMENT	= {ig=true},
		GRAVEL		= {ig=true},
		HUGEPROPS	= {ig=true},
		FARM		= {ig=true}
	},
	global_flags = {}
}

local source_mbins = {
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENCORALOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHIVESOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENHQOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENINFESTEDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENPEACOCKOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BARREN/BARRENROCKYWEIRDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/BURNT/BURNTOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/DEADBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DEAD/FROZENDEADWEIRDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/DESOLATE/DESOLATEOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FLORAL/FLORALOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FLORAL/FLORALOBJECTSGRASS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENALIENOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENPILLAROBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/FROZEN/FROZENROCKYWEIRDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGELUSH/HUGELUSHOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGERING/HUGERINGOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEROCK/HUGEROCKOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGESCORCHED/HUGESCORCHOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGETOXIC/HUGETOXICOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/HUGEPROPS/HUGEUWPLANT/HUGEUWPLANTOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/IRRADIATED/IRRADIATEDOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LAVA/LAVAOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHBUBBLEOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHHQTENTACLEOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHINFESTEDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROCKYWEIRDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMAOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/LUSH/LUSHROOMBOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/NOXIOUS/NOXIOUSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARREN.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/BARRENINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZEN.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/FROZENINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSH.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/LUSHINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVE.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/RADIOACTIVEINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/SCORCHEDINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXIC.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/OBJECTS/PLANT/TOXICINFESTED.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEALIENOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEGLOWOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOACTIVEOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOBIGPROPSOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKECRYSTALSOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/RADIOACTIVE/RADIOSPIKEPOTATOOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/ROCKY/ROCKOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHCORALOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDALIENOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SCORCHED/SCORCHEDSHIELDTREEOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SUBZERO/SUBZEROOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/SWAMP/SWAMPOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICBIGPROPSOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSMOONOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICEGGSOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICINFESTEDOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICOBJECTSFULL.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICSPORESOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/TOXIC/TOXICTENTACLESOBJECTS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/UNDERWATER/UNDERWATERCRYSTALS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/UNDERWATER/UNDERWATERGASBAGS.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BEAMSTONE/BEAMSOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/BONESPIRE/BONESPIREOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/CONTOUR/CONTOUROBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/ELBUBBLE/ELBUBBLEOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/FRACTALCUBE/FRACTCUBEOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HEXAGON/HEXAGONOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/HYDROGARDEN/HYDROGARDENOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/IRRISHELLS/IRRISHELLSOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/MSTRUCTURES/MSTRUCTOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/SHARDS/SHARDSOBJECTSDEAD.MBIN',
	'METADATA/SIMULATION/SOLARSYSTEM/BIOMES/WEIRD/WIRECELLS/WIRECELLSOBJECTSDEAD.MBIN',
}

-------------------------------------------------------------------------------
---- CODING
-------------------------------------------------------------------------------
---	EXML 2 LUA (VERSION: 0.83.6) ... by lMonk
---	A tool for converting exml to an equivalent lua table and back again.
---	Functions for converting an exml file, or sections of one, to
---	 a lua table during run-time, or printing the exml as a lua script.
--- The complete tool can be found at: https://github.com/roie-r/exml_2_lua
-------------------------------------------------------------------------------

--	Strip the XML header and data template if found
--	The template is re-added as a property
--	@param exml: exml-formatted string
local function UnWrap(exml)
	if exml:sub(1, 5) == '<?xml' then
		local template = exml:match('<Data template="([%w_]+)">')
		return '<Property name="template" value="'..template..'">\n'..
				exml:sub(exml:find('<Property'), -8)..'</Property>'
	else
		return exml
	end
end

--	Returns a table representation of EXML sections
--	When parsing a full file, the header is stripped and a mock template is added
--	@param exml: requires complete EXML sections in the nomral format
--	* Does not handle commented lines!
local function ToLua(exml)
	local function eval(val)
		if val == 'True' then
			return true
		elseif val == 'False' then
			return false
		else
			return val
		end
	end
	local tag	= [[<[/]?Property[ ]?(.-[/]?)>]]
	local tag1	= [[([%w_]+)="(.+)"[ ]?([/]?)]]
	local tag2	= [[name="([%w_]+)" value="(.*)"[ ]?([/]?)]]
	local tlua, st_node, is_ord = {}, {}, {false}
	local parent= tlua
	local node	= nil
	for prop in UnWrap(exml):gmatch(tag) do
		_,eql = prop:gsub('=', '')
		if eql > 0 then
			-- choose tag by the count of [=] in a property
			local att, val, close = prop:match(eql > 1 and tag2 or tag1)
			if close == '' then
				-- open new property table
				table.insert(st_node, parent)
				node = {meta = {att , val}}

				-- is_ord[#is_ord] == true when parent is an ordered (name) section
				if is_ord[#is_ord] == true or att == 'value' then
					parent[#parent+1] = node
				elseif att == 'name' then
					parent[val] = node
				else
					parent[att] = node
				end
				parent = node
				-- keep meta if classes are ordered
				is_ord[#is_ord+1] = att == 'name'
			else
				-- add property to parent table
				if is_ord[#is_ord] == true or att == 'value' then
					node[#node+1] = {[att] = eval(val)}
				-- regular property (skips stubs)
				elseif att ~= 'name' then
					node[att] = eval(val)
				end
			end
		else
			-- go back to parent node
			parent = table.remove(st_node)
			table.remove(is_ord)
			node = parent
		end
	end
	return tlua
end

-- A Union All function for an ordered array of tables
-- Returns a copy by-value. Repeating keys's values are overwritten.
--	@param arr: A table of tables.
local function UnionTables(arr)
	local merged = {}
	for _, tbl in ipairs(arr) do
		for k, val in pairs(tbl) do
			if type(val) == 'table' then
				merged[k] = merged[k] or {}
				merged[k] = UnionTables({merged[k], val})
			else
				merged[k] = val
			end
		end
	end
	return merged
end
--	Generate an EXML-tagged text from a lua table representation of exml class
--	@param class: a lua2exml formatted table
local function ToExml(class)
	--	replace a boolean with its text equivalent (ignore otherwise)
	--	@param b: any value
	function bool(b)
		return (type(b) == 'boolean') and ((b == true) and 'True' or 'False') or b
	end
	--	get the count of ALL objects in a table (non-recursive)
	--	@param t: any table
	function len2(t)
		i=0; for _ in pairs(t) do i=i+1 end; return i
	end
	local function exml_r(tlua)
		local exml = {}
		function exml:add(t)
			for _,v in ipairs(t) do self[#self+1] = v end
		end
		for key, cls in pairs(tlua) do
			if key ~= 'meta' then
				exml[#exml+1] = '<Property '
				if type(cls) == 'table' and cls.meta then
					local att, val = cls['meta'][1], cls['meta'][2]
					-- add and recurs for an inner table
					if att == 'name' or att == 'value' then
						exml:add({att, '="', val, '">'})
					else
						exml:add({'name="', att, '" value="', val, '">'})
					end
					exml:add({exml_r(cls), '</Property>'})
				else
					-- add normal property
					if type(cls) == 'table' then
						key, cls = next(cls)
					end
					if key == 'name' or key == 'value' then
						exml:add({key, '="', bool(cls), '"/>'})
					else
						exml:add({'name="', key, '" value="', bool(cls), '"/>'})
					end
				end
			end
		end
		return table.concat(exml)
	end
	-------------------------------------------------------------------------
	-- check the table level structure and meta placement
	-- add the needed layer for the recursion and handle multiple tables
	local klen = len2(class)
	if klen == 1 and class[1].meta then
		return exml_r(class)
	elseif class.meta and klen > 1 then
		return exml_r( {class} )
	-- concatenate unrelated exml sections, instead of nested inside each other
	elseif type(class[1]) == 'table' and klen > 1 then
		local T = {}
		for _, tb in pairs(class) do
			T[#T+1] = exml_r((tb.meta and klen > 1) and {tb} or tb)
		end
		return table.concat(T)
	end
end

--	Adds the xml header and data template
--	Uses the contained template meta if found (instead of the received variable)
--	@param data: a lua2exml formatted table
--	@param template: an nms file template string
local function FileWrapping(data, template)
	local wrapper = '<Data template="%s">%s</Data>'
	if type(data) == 'string' then
		return string.format(wrapper, template, data)
	end
	-- remove the extra table added by ToLua
	if data.template then data = data.template end
	-- table loaded from file
	if data.meta[1] == 'template' then
		-- strip mock template
		local txt_data = ToExml(data):sub(#data.meta[2] + 36, -12)
		return string.format(wrapper, data.meta[2], txt_data)
	else
		return string.format(wrapper, template, ToExml(data))
	end
end
-------------------------------------------------------------------------------

--	sum scale values and counters for averaging
function spawn_data:addValues(tag)
	for k, val in pairs(tag) do
		if val ~= 1 and k ~= 'ul' then
			self.mods[k].v = self.mods[k].v + val
			self.mods[k].i = self.mods[k].i + 1
		end
	end
end
--	calculate scale averages into results
function spawn_data:averages()
	for k, d in pairs(self.mods) do
		if d.i > 0 then self.res[k] = d.v / d.i end
	end
end
--	copy scales to results in order to bypass averaging
function spawn_data:copyRes(tag)
	for k, d in pairs(tag) do
		self.res[k] = d
	end
end

--	find all tags for a single spawn and return their average
--	ov=true tag marks an override, values will not to be averaged with others
--	ig=true tag marks ignored. results are deleted and the spawn will be unchanged
function spawn_data:averageScales(spawn, worktags)
	-- Generate/reset the modifiers and counters tables for each spawn
	self.mods	= {}
	self.res	= {} -- will store the calculated result
	self.ultra	= nil
	for k,_ in pairs(self.calcs) do
		self.mods[k] = {v=0, i=0}
		self.res[k]  = -1 -- (-1 == empty)
	end
	for key, tag in pairs(worktags) do
		if spawn:find(key) then
			-- process special flags first
			if tag.ig then
				self.res = nil
				return
			end
			if tag.ul then
				self.ultra = true
			end
			if tag.ov then
				self:copyRes(tag)
				return
			end
			self:addValues(tag)
		end
	end
	self:averages()
end

--	update flag modifiers for a specific biome
function spawn_data:getFlags(spawn, workflags)
	self.modflags = {}
	for tag, flags in pairs(workflags) do
		if spawn:find(tag) then
			for k, f in pairs(flags) do
				self.modflags[k] = f
			end
		end
	end
end

--	True if result exists for a given property key
function spawn_data:HasMod(k)
	return self.res and self.res[k] ~= -1
end

--	return biome-specific flora and flags modifiers
function solar_modifiers:getModifiers(mbin)
	local scales, flags = {}, {}
	for _,biome in ipairs(self.biomes) do
		if mbin:find(biome.biotg) then
			scales = UnionTables({scales, biome.flora})
			if biome.flags then
				flags = UnionTables({flags, biome.flags})
			end
		end
	end
	return scales, flags
end

--	main work process.
--	Receives the exml file from amumss
local function ProcessBiome(exml, mbin)
	local function getHighVariant(qvars)
	--	Select the highest GcObjectSpawnDataVariant (between LOW STANDARD ULTRA)
	--	Add ULTRA section if flagged and return it for editing
		for _,qv in ipairs(qvars) do
			qvars.meta[qv.ID] = qv
		end
		if qvars.meta.ULTRA then
			return qvars.meta.ULTRA
		elseif spawn_data.ultra then -- add ultra section
			local qhigh		= UnionTables({qvars.meta.STANDARD})
			qhigh.ID		= 'ULTRA'
			qvars[#qvars+1] = qhigh
			return qhigh
		else
			return qvars.meta.STANDARD
		end
	end
	local solar_biome = ToLua(exml)

	local biomeflora, biomeflags = solar_modifiers:getModifiers(mbin)
	-- merged, biome-specific modifiers table
	local workflora	= UnionTables({solar_modifiers.global_flora, biomeflora})
	-- merged, biome-specific flags table
	local workflags	= UnionTables({solar_modifiers.global_flags, biomeflags})
	for key, objs in pairs(solar_biome.template.Objects) do
		if key ~= 'SelectableObjects' and key ~= 'Creatures' and key ~= 'meta' then
			for _, spn in ipairs(objs) do
				spawn_data:averageScales(spn.Resource.Filename, workflora)
				if spawn_data:HasMod('ns') then spn.MinScale		  = spn.MinScale * spawn_data.res.ns end
				if spawn_data:HasMod('xs') then spn.MaxScale		  = spn.MaxScale * spawn_data.res.xs end
				if spawn_data:HasMod('an') then spn.MaxAngle		  = spn.MaxAngle + spawn_data.res.an end
				if spawn_data:HasMod('sw') then spn.ShearWindStrength = spn.ShearWindStrength * spawn_data.res.sw end

				-- edit GcObjectSpawnDataVariant
				local qvr = getHighVariant(spn.QualityVariants)
				if spawn_data:HasMod('dn') then
					qvr.FlatDensity  = qvr.FlatDensity * spawn_data.res.dn
					qvr.SlopeDensity = qvr.FlatDensity * 1.1
				end
				if spawn_data:HasMod('fo') and tonumber(qvr.FadeOutStartDistance) < 9000 then
					qvr.FadeOutStartDistance = qvr.FadeOutStartDistance * spawn_data.res.fo
					qvr.FadeOutEndDistance	 = qvr.FadeOutStartDistance + 20
				end
				if spawn_data:HasMod('cr') then qvr.Coverage = qvr.Coverage * spawn_data.res.cr end

				lod = spawn_data:HasMod('ld') and spawn_data.res.ld or 1.22 -- default overwritten by SCENE global
				for i=2, #qvr.LodDistances do
					qvr.LodDistances[i].value = qvr.LodDistances[i].value * lod
				end
				local rr = tonumber(qvr.MaxRegionRadius)
				if spawn_data:HasMod('rr') then
					qvr.MaxRegionRadius = math.floor(rr + spawn_data.res.rr)
				elseif rr < 90 then
					qvr.MaxRegionRadius = rr + ((rr < 15 and rr > 6) and 1 or 4)
				end
				if spawn_data:HasMod('pr') and tonumber(qvr.MaxImposterRadius) < 90 and rr < 90 then
					qvr.MaxImposterRadius = math.floor(qvr.MaxImposterRadius + spawn_data.res.pr * 10)
				end
				--	loop through boolean flags
				spawn_data:getFlags(spn.Resource.Filename, workflags)
				for k, prp in pairs(spawn_data.flags) do
					if spawn_data.modflags[k] ~= nil then spn[prp] = spawn_data.modflags[k] end
				end
			end
		end
	end
	return FileWrapping(solar_biome)
end

-----------------------------------------------------------------------------------------
ProcessRawExml = nil -- to silence unused_variable
function ProcessRawExml(the_index) -- called by AMUMSS
	local T = {}
	for _,mbin in ipairs(source_mbins) do
		local norm_path	= NormalizePath(mbin, true)
		T[norm_path]	= ProcessBiome(table.concat(the_index.ModdedEXMLs[norm_path]), mbin)
	end
	return T
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.large flora.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.29',
	MOD_DESCRIPTION		= mod_desc,
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS',
	MODIFICATIONS 		= {{
	MBIN_CHANGE_TABLE	= {
	{
		MBIN_FILE_SOURCE = source_mbins,
		EXT_FUNC		 = { 'ProcessRawExml' }
	}
}}}}