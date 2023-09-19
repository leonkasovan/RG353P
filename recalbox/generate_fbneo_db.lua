-- Lua Script for generating rom driver database in csv format.
-- Input: source code game driver in directory src\burn\drv : d_*.cpp
function load_file(filename)
	local fi, content = nil

	fi = io.open(filename, "r")
	if fi == nil then
		print("[error] Load file "..filename)
		return nil
	end
	content = fi:read("*a")
	fi:close()
	return content
end

-- local target = "src/burn/drv/"
-- for file in lfs.dir(target) do
	-- if file ~= "." and file ~= ".." then
		-- local attr, err = lfs.attributes(target..file)
		-- if attr ~= nil then		
			-- if attr.mode == "file" then
				-- print("file: "..file)
			-- elseif attr.mode == "directory" then
				-- print("directory: "..file)
			-- end
		-- else
			-- print("File: "..file.." is nil attr")
			-- print(err)
		-- end
	-- end
-- end

function extract_from_source_code(file)
	local content = load_file(file)
	
	if content == nil then
		return nil
	end
	
	for v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14 in pcre.gmatch(content,'\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0),\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL)\\s*,\\s*(\\d|[^,]*)') do 
		-- print(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14)
		if (v14 ~= "NULL") then print(v1,v14) end
	end
	
	-- v1_ShortName
	-- v2_Parent
	-- v3_BIOS
	-- v4
	-- v5_Year
	-- v6_FullName
	-- v7_Remarks
	-- v8_Company
	-- v9_Hardware
	-- v10_FullNameinUnicode
	-- v11
	-- v12
	-- v13
	-- v14_GameStatus
	
	
	return {}
end
extract_from_source_code('src/burn/drv/taito/d_bublbobl.cpp')
extract_from_source_code('src/burn/drv/capcom/d_cps2.cpp')
extract_from_source_code('src/burn/drv/pgm/d_pgm.cpp')
