---------------------------------------------------------------------------------
local mod_desc = [[
  Generate cTkProceduralTextureList files for the procedural decals
  diff/normal/masks	= true >> include dds in the layer

  * source is used for importing the files and must be updated to a local path
  * ADD_FILES will skipped SILENTLY if new files are not found!
]]-------------------------------------------------------------------------------
---	LUA 2 MXML (VERSION: 0.88.03) ... by lMonk
---	A tool for converting mxml to an equivalent lua table and back again.
--- The full version can be found at: https://github.com/roie-r/mxml_2_lua
--------------------------------------------------------------------------------
local function ToMxml(class)
	--	replace a boolean with its text equivalent (ignore otherwise)
	--	@param b: any value
	local function bool(b)
		return type(b) == 'boolean' and (b == true and 'true' or 'false') or b
	end
	local function mxml_r(tlua)
		local out = {}
		function out:add(t)
			for _,v in ipairs(t) do self[#self+1] = v end
		end
		for attr, cls in pairs(tlua) do
			if attr ~= 'meta' then
				out[#out+1] = '<Property '
				if type(cls) == 'table' and cls.meta then
				-- add and recurs for an inner table
					for k, v in pairs(cls.meta) do
						if k:sub(-1) ~= '_' then out:add({k, '="', bool(v), '"', ' '}) end
					end
					table.remove(out) -- trim last space
					out:add({'>', mxml_r(cls), '</Property>'})
				else
					local att, val = nil, nil
					if tonumber(attr) then
						if type(cls) == 'table' then
							att, val = next(cls)
						else
							att = tlua.meta.name
							val = cls
						end
					else
						att = attr
						val = cls
					end
					if att == 'name' or att == 'value' then
						out:add({att, '="', bool(val), '"/>'})
					else
						out:add({'name="', att, '" value="', bool(val), '"/>'})
					end
				end
			end
		end
		return table.concat(out)
	end
	-------------------------------------------------------------------------
	-- check the table level structure and meta placement
	-- add parent table for the recursion and handle multiple tables
	if type(class) ~= 'table' then return nil end
	local klen=0; for _ in pairs(class) do klen=klen+1 end

	if klen == 1 and class[1].meta then
		return mxml_r(class)
	elseif class.meta and klen > 1 then
		return mxml_r( {class} )
	-- concatenate unrelated (instead of nested) mxml sections
	elseif type(class[1]) == 'table' and klen > 1 then
		local T = {}
		for _, tb in pairs(class) do
			T[#T+1] = mxml_r((tb.meta and klen > 1) and {tb} or tb)
		end
		return table.concat(T)
	end
	return nil
end


local function FileWrapping(tlua, ext_tmpl)
	local wrapper = '<?xml version="1.0" encoding="utf-8"?><Data template="%s">%s</Data>'
	if type(tlua) == 'string' then
		return string.format(wrapper, ext_tmpl, tlua)
	end
	-- replace existing or add template layer if needed
	if ext_tmpl then
		if tlua.meta.template then
			tlua.meta.template = ext_tmpl
		else
			tlua = {
				meta = {template=ext_tmpl},
				tlua
			}
		end
	end
	-- strip mock template
	local txt_data = ToMxml(tlua):sub(#tlua.meta.template + 23, -12)
	return string.format(wrapper, tlua.meta.template, txt_data)
end
---------------------------------------------------------------------------------

local proc_texture_files = {
	{--	ship decals : logo
		label	= 'LOGO',
		group	= 'DECALLOGO',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/logo/',
		nmspath	= 'TEXTURES/COMMON/DECALS/LOGO/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'L15', 'L14', 'L13', 'L12', 'L11', 'L10', 'L9', 'L8', 'L7', 'L6', 'L5', 'L4', 'L3', 'L2', 'L1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : rectangle
		label	= 'RECTANGLE',
		group	= 'DECALRECTANGLE',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/rectangle/',
		nmspath	= 'TEXTURES/COMMON/DECALS/RECTANGLE/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'R15', 'R14', 'R13', 'R12', 'R11', 'R10', 'R9', 'R8', 'R7', 'R6', 'R5', 'R4', 'R3', 'R2', 'R1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : smallsign
		label	= 'SMALLSIGN',
		group	= 'DECALSMALLSIGN',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/smallsign/',
		nmspath	= 'TEXTURES/COMMON/DECALS/SMALLSIGN/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative3',
				texture	= {'S6', 'S5', 'S4', 'S3', 'S2', 'S1'},
				dds		= 1
			}
		}
	},
	{--	ship decals : number
		label	= 'NUMBER',
		group	= 'DECALNUMBER',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/number/',
		nmspath	= 'TEXTURES/COMMON/DECALS/NUMBER/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative1',
				texture	= {'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9'},
				dds		= 1
			}
		}
	},
	{--	ship decals : lettering
		label	= 'LETTERING',
		group	= 'DECALLET',
		source	= 'D:/MODZ_stuff/NoMansSky/Sources/_Textures/Decals/ship/lettering/',
		nmspath	= 'TEXTURES/COMMON/DECALS/LETTERING/',
		layers	= {
			{
				name	= 'BASE',
				palette = 'Paint',
				color	= 'Alternative2',
				texture	= {'LT1', 'LT2', 'LT3', 'LT4', 'LT5', 'LT6', 'LT7', 'LT8', 'LT9'},
				dds		= 1
			}
		}
	}
}

local function GetProcTextures(path, layer)
	local T = { meta = {name='Textures'} }
	--	handles 3 options:
	--	* An array of names
	--	* An array of tables of the following - non-essential - properties:
	--	  {n='name', pr=0.3, u=GU_.DNM,	pt='palette', ca='colouralt'} >> u=TextureGameplayUseEnum
	--	* nil, in which case all default values apply
	for _,ptex in ipairs(layer.texture or {{n=''}}) do
		if type(ptex) == 'string' then ptex = {n=ptex} end
		T[#T+1] = {
			meta = {name='Textures', value='TkProceduralTexture'},
			Name				= ptex.n,
			Probability			= ptex.pr or 1,
			TextureGameplayUse	= ptex.u,
			TextureName			= table.concat({
				path,
				'.',
				layer.dds ~= 0 and layer.name..'.' or '',
				ptex.n ~= '' and ptex.n..'.' or '',
				'DDS'
			}),
			Palette				= {
				meta = {name='Palette', value='TkPaletteTexture'},
				Palette		= ptex.pt or (layer.palette	or 'Rock'),
				ColourAlt	= ptex.ca or (layer.color	or 'None'),
				Index		= -1
			}
		}
	end
	return T
end

local function BuildProcTexListMbin(proc_tex_list)
	local T = { meta = {name='Layers'} }
	for _,layr in ipairs(proc_tex_list.layers) do
		T[#T+1] = {
			meta = {name='value', value='TkProceduralTextureLayer'},
			Name				= layr.name,
			Probability			= proc_tex_list.ly_prob	or 1,
			Group				= proc_tex_list.group,
			SelectToMatchBase	= layr.matchbase,
			Textures			= GetProcTextures(proc_tex_list.nmspath..proc_tex_list.label, layr)
		}
	end
	-- complete to the fixed length (8) array
	for _=1, (8 - #proc_tex_list.layers) do
		T[#T+1] = {value = 'TkProceduralTextureLayer'}
	end
	-- new mbin
	return FileWrapping(T, 'cTkProceduralTextureList')
end

NMS_MOD_DEFINITION_CONTAINER = {
	MOD_FILENAME 		= '_MOD.lMonk.Alt Ship Decals.pak',
	MOD_AUTHOR			= 'lMonk',
	NMS_VERSION			= '5.58',
	AMUMSS_SUPPRESS_MSG	= 'MULTIPLE_STATEMENTS,MIXED_TABLE',
	MOD_DESCRIPTION		= mod_desc,
	ADD_FILES			= (
		function()
			local T = {}
			for _,ptf in ipairs(proc_texture_files) do
				T[#T+1] = {
					FILE_CONTENT	 = BuildProcTexListMbin(ptf),
					FILE_DESTINATION = ptf.nmspath..ptf.label..'.TEXTURE.MXML'
				}
				if ptf.source and lfs.attributes(ptf.source) then
					T[#T+1] = {
						EXTERNAL_FILE_SOURCE = ptf.source..ptf.label..'*.DDS',
						FILE_DESTINATION	 = ptf.nmspath..'*.DDS'
					}
				end
			end
			return T
		end
	)()
}