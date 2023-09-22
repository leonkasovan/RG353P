-- Lua Script for generating rom driver database in csv format.
-- Input: source code game driver in directory src\burn\drv : d_*.cpp

-- Reference:
-- D:\Projects\FBNeo\src\burn\burn.h
-- D:\Projects\FBNeo\src\burner\qt\qutil.cpp
-- D:\Projects\FBNeo\src\burner\sdl\sdl2_gui.cpp

local FILENAME = "fbneo_db1.csv"
local SEP = "|"

local GAME_GENRE = {
GBF_HORSHOOT = "Shooter / Horizontal / Sh'mup",
GBF_VERSHOOT = "Shooter / Vertical / Sh'mup",
GBF_SCRFIGHT = "Fighting / Beat 'em Up",
GBF_VSFIGHT = "Fighting / Versus",
GBF_BIOS = "BIOS",
GBF_BREAKOUT = "Breakout",
GBF_CASINO = "Casino",
GBF_BALLPADDLE = "Ball & Paddle",
GBF_MAZE = "Maze",
GBF_MINIGAMES = "Mini-Games",
GBF_PINBALL = "Pinball",
GBF_PLATFORM = "Platformer",
GBF_PUZZLE = "Puzzle",
GBF_QUIZ = "Quiz",
GBF_SPORTSMISC = "Sports",
GBF_SPORTSFOOTBALL = "Sports / Football",
GBF_MISC = "Misc",
GBF_MAHJONG = "Mahjong",
GBF_RACING = "Racing",
GBF_SHOOT = "Shooter",
GBF_ACTION = "Action (Classic)",
GBF_RUNGUN = "Run 'n Gun (Shooter)",
GBF_STRATEGY = "Strategy",
GBF_RPG = "RPG",
GBF_SIM = "Simulator",
GBF_ADV = "Adventure"
}

local slash
if os.info() == "Linux" then
	slash = "/"
else
	slash = "\\"
end

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

function extract_from_directory(path)
	for file in lfs.dir(path) do
		if file ~= "." and file ~= ".." then
			local source_full_path = path..slash..file
			local attr, err = lfs.attributes(source_full_path)
			if attr ~= nil then		
				if attr.mode == "file" then
					-- print("file: "..file)
					extract_from_source_code(source_full_path)
				elseif attr.mode == "directory" then
					print("directory: "..file)
					extract_from_directory(source_full_path)
				end
			else
				print("File: "..source_full_path.." is nil attr")
			end
		end
	end
end

function save_file(content, filename)
	local fo
	
	fo = io.open(filename, "w")
	if fo == nil then
		print('Error open a file '..filename)
		return false
	end
	fo:write(content)
	fo:close()
	return true
end

function strip_quote(str)
	if str == "NULL" then
		return "NULL"
	else
		return str:sub(2,-2)
	end
end

function extract_from_source_code(file)
	local fo
	local content = load_file(file)
	
	if content == nil then
		return nil
	end
	
	fo = io.open(FILENAME, "a+")
	if fo == nil then
		print('Error open a file '..FILENAME)
		return false
	end

	-- v1_ShortName
	-- v2_Parent
	-- v3_BIOS
	-- v4_Parent2
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
	-- v15_NumPlayer
	-- v16_Hardware_ID
	-- v17_Genre	
	for v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14,v15,v16,v17 in pcre.gmatch(content,'\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0)\\s*,\\s*(".*"|NULL|0),\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL|0)\\s*,\\s*(L".*"|NULL)\\s*,\\s*(\\d|[^,]*),\\s*(\\d+),\\s*(\\d|[^,]*),\\s*(\\d|[^,]*)') do 
		-- print(v1,v2,v3,v4,v5,v6,v7,v8,v9,v10,v11,v12,v13,v14)
		-- if (v3 ~= "NULL") then print(v1,v2,v3,v15,v16,v17) end
		print(v1, v17, GAME_GENRE[v17])
		fo:write(
			strip_quote(v1)..SEP..
			strip_quote(v2)..SEP..
			strip_quote(v3)..SEP..
			strip_quote(v4)..SEP..
			strip_quote(v5)..SEP..
			strip_quote2(v6)..SEP..
			strip_quote(v7)..SEP..
			strip_quote(v8)..SEP..
			strip_quote(v9)..SEP..
			strip_quote(v10)..SEP..
			strip_quote(v14)..SEP..
			strip_quote(v15)..SEP..
			strip_quote(v16)..SEP..
			GAME_GENRE[v17]..SEP.."\n"
		)
		-- fo:write(
			-- v1..SEP..
			-- v2..SEP..
			-- v3..SEP..
			-- v4..SEP..
			-- v5..SEP..
			-- v6..SEP..
			-- v7..SEP..
			-- v8..SEP..
			-- v9..SEP..
			-- v10..SEP..
			-- v14..SEP..
			-- v15..SEP..
			-- v16..SEP..
			-- GAME_GENRE[v17]..SEP.."\n"
		-- )
	end
	fo:close()
	return true
end

-- extract_from_source_code('src/burn/drv/taito/d_bublbobl.cpp')
-- extract_from_source_code('src/burn/drv/capcom/d_cps2.cpp')
-- extract_from_source_code('src/burn/drv/pgm/d_pgm.cpp')

if os.info() == "Linux" then
	os.execute("rm "..FILENAME)
	extract_from_directory("src/burn/drv/pgm")
else
	os.execute("del "..FILENAME)
	extract_from_directory("src\\burn\\drv\\pgm")
end
