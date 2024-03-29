local ffi = require 'ffi'
ffi.cdef [[
    typedef struct {
        unsigned short wYear;
        unsigned short wMonth;
        unsigned short wDayOfWeek;
        unsigned short wDay;
        unsigned short wHour;
        unsigned short wMinute;
        unsigned short wSecond;
        unsigned short wMilliseconds;
    } SYSTEMTIME, *LPSYSTEMTIME;
    void GetSystemTime(LPSYSTEMTIME lpSystemTime);
    void GetLocalTime(LPSYSTEMTIME lpSystemTime);
	int ShellExecuteA(void* hwnd, const char* lpOperation, const char* lpFile, const char* lpParameters, const char* lpDirectory, int nShowCmd);
	bool PathFileExistsA(const char* pszPath);
	bool CreateDirectoryA(const char* lpPathName, void* lpSecurityAttributes);
    bool DeleteUrlCacheEntryA(const char* lpszUrlName);
	void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);
	struct c_Color { unsigned char clr[4]; };
]]
local GetIP = Http.Get("https://ipapi.co/ip/")
local function GetCurrentTime()
	local system_time = ffi.new('SYSTEMTIME')
	ffi.C.GetLocalTime(system_time)
	return string.format("%02d:%02d:%02d", system_time.wHour, system_time.wMinute, system_time.wSecond)
end
local script_info_1 = "Version: 1.5/Last Updated: 3rd Of September 2022"
local WINApi = ffi.load("SHLWApi")
local utils = {
    PrintColor = function(Color, text)
        console_Color = ffi.new("struct c_Color")
        engine_cvar = ffi.cast("void***", Utils.CreateInterface("vstdlib.dll", "VEngineCvar007"))
        console_print = ffi.cast("void(__cdecl*)(void*, const struct c_Color&, const char*, ...)", engine_cvar[0][25])
 
        local Color_to_print_r = Color.r *255
        local Color_to_print_g = Color.g *255
        local Color_to_print_b = Color.b *255
        local Color_to_print_a = Color.a *255
 
        console_Color.clr[0] = Color_to_print_r
        console_Color.clr[1] = Color_to_print_g
        console_Color.clr[2] = Color_to_print_b
        console_Color.clr[3] = Color_to_print_a
        console_print(engine_cvar, console_Color, text)
    end,
    CreateDirectory = function(path)
        ffi.C.CreateDirectoryA(path, nil)
    end,
}
utils.DownloadFile = function(path, link)
    local UrlMon = ffi.load("UrlMon")
    local WinInet = ffi.load("WinInet")
 
    if not WINApi.PathFileExistsA("spirt/WPCoord") then
        utils.CreateDirectory("spirt/WPCoord")
    end
 
    if not WINApi.PathFileExistsA("spirt/WPCoord/fonts") then
        utils.CreateDirectory("spirt/WPCoord/fonts")
    end
 
	if not WINApi.PathFileExistsA("spirt/WPCoord/picture") then
        utils.CreateDirectory("spirt/WPCoord/picture")
    end
	if not WINApi.PathFileExistsA("spirt/WPCoord/sound") then
        utils.CreateDirectory("spirt/WPCoord/sound")
    end
    WinInet.DeleteUrlCacheEntryA(link)
    UrlMon.URLDownloadToFileA(nil, link, path, 0, 0)
end
if not WINApi.PathFileExistsA("spirt/WPCoord/fonts/icons.ttf") then
    utils.DownloadFile("spirt/WPCoord/fonts/icons.ttf", "https://cdn.discordapp.com/attachments/987332606326636584/988101353077370980/icons.ttf")
end
 
if not WINApi.PathFileExistsA("spirt/WPCoord/fonts/pixel.ttf") then
    utils.DownloadFile("spirt/WPCoord/fonts/pixel.ttf", "https://cdn.discordapp.com/attachments/987332606326636584/988101353240936488/pixel.ttf")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/fonts/MuseoSansCyrl700.ttf") then
    utils.DownloadFile("spirt/WPCoord/fonts/MuseoSansCyrl700.ttf", "https://cdn.discordapp.com/attachments/987332606326636584/1001360700528132256/MuseoSansCyrl700.ttf")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/1.png") then
    utils.DownloadFile("spirt/WPCoord/picture/1.png", "Https://steamuserimages-a.akamaihd.net/ugc/780728056600893177/5D12C67046AC71F22CB243D79569008D49602AD9/?imw=512&amp;imh=828&amp;ima=fit&amp;impolicy=Letterbox&amp;imcolor=%23000000&amp;letterbox=true")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/2.png") then
    utils.DownloadFile("spirt/WPCoord/picture/2.png", "Https://cdn.discordapp.com/attachments/798169474716925962/798337585495539732/ecchi-drawing-human-4.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/3.png") then
    utils.DownloadFile("spirt/WPCoord/picture/3.png", "Https://i.pinimg.com/originals/33/fb/7b/33fb7b953c5f533229067491a1f67715.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/4.png") then
    utils.DownloadFile("spirt/WPCoord/picture/4.png", "https://cs05.spac.me/p/081089198247008048143120073133158026017225101009061067232122/1662474734/198776164/1024x768/ddd6c12777177810b4a989cad4176643/c8882b449a379471632484e85e856ccd/0/painkiller762/Anime-Eromanga-Sensei-Izumi-Sagiri-greem-bang-4228127.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/5.png") then
    utils.DownloadFile("spirt/WPCoord/picture/5.png", "Https://avatanplus.com/files/resources/original/56fba3574e923153c6f60d1a.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/6.png") then
    utils.DownloadFile("spirt/WPCoord/picture/6.png", "Https://cdn.discordapp.com/attachments/797865975311237140/797912124919382056/pngwing.com.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/7.png") then
    utils.DownloadFile("spirt/WPCoord/picture/7.png", "Https://cdn.discordapp.com/attachments/797865975311237140/797942053925290004/57af84db1c119156859ef7eb.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/8.png") then
    utils.DownloadFile("spirt/WPCoord/picture/8.png", "Https://cdn.discordapp.com/attachments/798169474716925962/798374483617644564/kawaii_anime_girl_tie_hair__3_by_alyssaholt13_dchkvxy-fullview.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/9.png") then
    utils.DownloadFile("spirt/WPCoord/picture/9.png", "Https://cdn.discordapp.com/attachments/798169474716925962/798365000300363806/blonde_anime_girl_render_by_snowinwinter_d92r0fy-pre.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/10.png") then
    utils.DownloadFile("spirt/WPCoord/picture/10.png", "Https://cdn.discordapp.com/attachments/798169474716925962/798372062300733440/xQhcstKMZYg.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/11.png") then
    utils.DownloadFile("spirt/WPCoord/picture/11.png", "Https://cdn.discordapp.com/attachments/798169474716925962/798664916071481355/DxD_-_Contest_III_Akeno_Himejima_13.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/12.png") then
    utils.DownloadFile("spirt/WPCoord/picture/12.png", "Https://s02.yapfiles.ru/files/392204/213201_animal_ears11.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/picture/13.png") then
    utils.DownloadFile("spirt/WPCoord/picture/13.png", "Https://www.pngkit.com/png/full/287-2870510_disappointed-anime-face-png-disappointed-anime-face-anime.png")
end
if not WINApi.PathFileExistsA("spirt/WPCoord/sound/nlsound.wav") then
    utils.DownloadFile("spirt/WPCoord/sound/nlsound.wav", "https://cdn.discordapp.com/attachments/1016672527260598302/1017111244769075283/nlsound.wav")
end
if not WINApi.PathFileExistsA("csgo/sound/buttons/nlsound.wav") then
    utils.DownloadFile("csgo/sound/buttons/nlsound.wav", "https://cdn.discordapp.com/attachments/1016672527260598302/1017111244769075283/nlsound.wav")
end
--Credits/info
Color.RGBA = function(r, g, b, a)
    if a == nil then a = 255 end
    return Color.new(r / 255, g / 255, b / 255, a / 255)
end
Utils.PrintColor = function(Color, text)
		console_Color = ffi.new("struct c_Color")
		engine_cvar = ffi.cast("void***", Utils.CreateInterface("vstdlib.dll", "VEngineCvar007"))
		console_print = ffi.cast("void(__cdecl*)(void*, const struct c_Color&, const char*, ...)", engine_cvar[0][25])

		local Color_to_print_r = Color.r *255
		local Color_to_print_g = Color.g *255
		local Color_to_print_b = Color.b *255
		local Color_to_print_a = Color.a *255

		console_Color.clr[0] = Color_to_print_r
		console_Color.clr[1] = Color_to_print_g
		console_Color.clr[2] = Color_to_print_b
		console_Color.clr[3] = Color_to_print_a
		console_print(engine_cvar, console_Color, text)
	end
local logo = string.format([[
	
	
                                                                                                                                                        dddddddd
                                                                                                                                                        d::::::d
                                                                                                                                                        d::::::d
                                                                                                                                                        d::::::d
                                                                                                                                                        d:::::d 
wwwwwww           wwwww           wwwwwwwppppp   ppppppppp            cccccccccccccccc   ooooooooooo      ooooooooooo   rrrrr   rrrrrrrrr       ddddddddd:::::d 
 w:::::w         w:::::w         w:::::w p::::ppp:::::::::p         cc:::::::::::::::c oo:::::::::::oo  oo:::::::::::oo r::::rrr:::::::::r    dd::::::::::::::d 
  w:::::w       w:::::::w       w:::::w  p:::::::::::::::::p       c:::::::::::::::::co:::::::::::::::oo:::::::::::::::or:::::::::::::::::r  d::::::::::::::::d 
   w:::::w     w:::::::::w     w:::::w   pp::::::ppppp::::::p     c:::::::cccccc:::::co:::::ooooo:::::oo:::::ooooo:::::orr::::::rrrrr::::::rd:::::::ddddd:::::d 
    w:::::w   w:::::w:::::w   w:::::w     p:::::p     p:::::p     c::::::c     ccccccco::::o     o::::oo::::o     o::::o r:::::r     r:::::rd::::::d    d:::::d 
     w:::::w w:::::w w:::::w w:::::w      p:::::p     p:::::p     c:::::c             o::::o     o::::oo::::o     o::::o r:::::r     rrrrrrrd:::::d     d:::::d 
      w:::::w:::::w   w:::::w:::::w       p:::::p     p:::::p     c:::::c             o::::o     o::::oo::::o     o::::o r:::::r            d:::::d     d:::::d 
       w:::::::::w     w:::::::::w        p:::::p    p::::::p     c::::::c     ccccccco::::o     o::::oo::::o     o::::o r:::::r            d:::::d     d:::::d 
        w:::::::w       w:::::::w         p:::::ppppp:::::::p     c:::::::cccccc:::::co:::::ooooo:::::oo:::::ooooo:::::o r:::::r            d::::::ddddd::::::dd
         w:::::w         w:::::w          p::::::::::::::::p       c:::::::::::::::::co:::::::::::::::oo:::::::::::::::o r:::::r             d:::::::::::::::::d
          w:::w           w:::w           p::::::::::::::pp         cc:::::::::::::::c oo:::::::::::oo  oo:::::::::::oo  r:::::r              d:::::::::ddd::::d
           www             www            p::::::pppppppp             cccccccccccccccc   ooooooooooo      ooooooooooo    rrrrrrr               ddddddddd   ddddd
                                          p:::::p                                                                                                               
                                          p:::::p                                                                                                               
                                         p:::::::p                                                                                                              
                                         p:::::::p                                                                                                              
                                         p:::::::p                                                                                                              
                                         ppppppppp                                                                                                              
                                                                                                                                                                
	
									888                   
									888                   
									888 888  888  8888b.  
									888 888  888     "88b 
									888 888  888 .d888888 
									888 Y88b 888 888  888 
									888  "Y88888 "Y888888

					=======================================================================================

							 Welcome back, %s! We happy to see you again!

									 by [W.P] Game Room
									  Have a nice game!
							  %s
								      Status: Stable / Alpha
]], Cheat.GetCheatUserName(), script_info_1)
EngineClient.ExecuteClientCmd("clear")
Utils.PrintColor(Color.RGBA(132, 195, 16, 255), logo)
local update = [[Changelog:

   [0.7]:
    
    [!] Renamed lua
    [!] $$$ Full recoded $$$
    [!] Added new aa condition

    [+] Removed lags B)
    
    [~] Reworked indicators $$$

   [0.6]:

    [+] Add HitLogs
    [+] Add Solus UI

    [~] Reworked clantag
    [~] Reworked aa preset
    [~] Reworked Backward legs

   [0.5]:

    [+] Added hit sound
    [+] Added nade warning (without prediction rn)
    [+] Added slow down indicator

   [0.4]:

    [+] Fixed bugs with aa tab
    [+] Added export aa config

   [0.3]:

    [+] Added clantag

    [~] Improved optimization

]]
Utils.PrintColor(Color.RGBA(142, 165, 229), update)
-- Menu
EngineClient.ExecuteClientCmd("play buttons/nlsound.wav")
local select = Menu.Combo("[W.P] Game Room Coord / Main","Select",{"Ragebot", "AntiAim", "Misc", "UI Changer", "Info & Credits"}, 4)
local info = Menu.Text("[W.P].coord / Info", script_info_1)
local logs_1 = Menu.Text("[W.P].coord / Logs", "Added: New clantags, anime menu, watermark, trashtalk(Alpha), NadeHelper(Alpha)")
local logs_2 = Menu.Text("[W.P].coord / Logs", "Fixed: Watermark(console), bugs")
--local button = Menu.Button("[W.P].coord / Info", "Have a nice game!")
local credits = Menu.Text("[W.P].coord / Credits", "Maded by: EvGeN")
local yougame = Menu.Text("[W.P].coord / Credits", "YG: yougame.biz/members/147749/")
local vk = Menu.Text("[W.P].coord / Credits", "VK: vk.com/e1vg3n")
local warning = Menu.Text("[W.P].coord / Dev", "Soon")
local alpha = Menu.Text("[W.P].coord / Dev", "In Alpha Version")
local animegirls = Menu.Combo( "[W.P].coord / VisualMenu","Up", {"Off" ,"#1", "#2", "#3", "#4", "#5"}, 0)
local animegirls_left = Menu.Combo( "[W.P].coord / VisualMenu","Left", {"Off" ,"#1", "#2", "#3", "#4", "Hentai #1"}, 0)
local animegirls_right = Menu.Combo( "[W.P].coord / VisualMenu","Right", {"Off", "#1", "#2", "#3", "#4", "Hentai #1"}, 0)
local Enabled = Menu.Switch("[W.P].coord / Clantags", "Enabled", false)
local TagType = Menu.Combo("[W.P].coord / Clantags", "Tag Type", { "Time", "Custom Animated", "Static", "NeverLose", "Gamesense", "Spirthack (new)", "onetap v2", "onetap v3", "KILLAURA.UNO", "NeverDie", "RaweTrip", "millionware", "AimWare old", "fanta", "2k17.club", "PPHUD", "INTERWEBZ", "Extrim Hack", "Aurora FREE", "Avira", "Avira2", "gayware", "samoware old", "Putin.cc", "fatality old", "fatality", "PRIMORDIAL.DEV", "Tenza", "LambdaHack", "INTERIUM", "legendware old", "Pandora", "Nemesis.technology", "rifk7", "REBOOTHACK", "eexomi", "ev0lve (custom)", "ev0lve (orig old)", "LuckyCharms", "nixware.cc (old)", "bebrahook", "boosters"}, 2)
local TagText = Menu.TextBox("[W.P].coord / Clantags", "Tag Text", 16, "[W.P]")
local TagSpeed = Menu.SliderInt("[W.P].coord / Clantags", "Animation Slowness", 15, 1, 25)
local trashtalk = Menu.Switch("[W.P].coord / Trashtalk", "Dont use this fucking toxic ;)", false)
local spamchat = Menu.Switch("[W.P].coord / Spam Chat", "Dont use if u not want take reports", false)
local ConsoleCustom = Menu.SwitchColor("[W.P].coord / Console Color", "Change Color", false, Color.new(1.0, 1.0, 1.0))
local watermarks = Menu.Combo("[W.P].coord / Watermarks", "Type", {"None", "Neverlose", "Gamesense"}, 0)
local water_clr = Menu.ColorEdit("[W.P].coord / Watermarks", "Watermark Color", Color.new(102/255,118/255,202/255))
local background_menu = Menu.Combo("[W.P].coord / VisualMenu", "Type", {"None", "Custom", "Neverlose", "Gamesense"}, 0)
local thickness_bcg = Menu.SliderInt("[W.P].coord / VisualMenu", "Thickness", 1, 1, 15)
local FirstAngle = Menu.ColorEdit("[W.P].coord / VisualMenu", "Left UP", Color.new(0.0, 0.0, 0.0))
local SecondAngle = Menu.ColorEdit("[W.P].coord / VisualMenu", "Right UP", Color.new(0.0, 0.0, 0.0))
local ThirdAngle = Menu.ColorEdit("[W.P].coord / VisualMenu", "Left Down", Color.new(0.0, 0.0, 0.0))
local FourthAngle = Menu.ColorEdit("[W.P].coord / VisualMenu", "Right Down", Color.new(0.0, 0.0, 0.0))
--local antiafk = Menu.Switch("[W.P].coord / AntiAFK", "Turn me", false)
local phrases = {
    "[W.P].coord / Best lua coord for SpirtHack",
    "[W.P].coord | 1 month --> 1$",
    "[W.P].coord / Our discord --> discord.gg/2HC4NMQPqH"
}
local nextuse, idx = 0, 1
local function on_paint()
	if spamchat:Get() == true then
		if GlobalVars.tickcount > nextuse then
			EngineClient.ExecuteClientCmd("say \"" .. phrases[idx % #phrases + 1] .. "\"")
			idx = idx + 1
			nextuse = GlobalVars.tickcount + 3
		end
	end
end

local engineClient = Utils.CreateInterface("engine.dll", "VEngineClient014")
local engineClientClass = ffi.cast(ffi.typeof("void***"), engineClient)
local isConsoleVisible = ffi.cast("bool(__thiscall*)(void*)", engineClientClass[0][11])

local consoleMaterials = {"vgui_white", "vgui/hud/800corner1", "vgui/hud/800corner2", "vgui/hud/800corner3", "vgui/hud/800corner4"}
local materialList = {}

local oldColor = Color.new(1.0, 1.0, 1.0, 1.0)
local oldConsoleIsVisible = false

local function isColorEquals(clr1, clr2)
    return (clr1.r == clr2.r and clr1.g == clr2.g and clr1.b == clr2.b and clr1.a == clr2.a)
end

local function copyColor(src, dest)
    dest.r, dest.g, dest.b, dest.a = src.r, src.g, src.b, src.a
end

local function updateConsoleColor(r, g, b, a)
    for i = 1, #materialList do
        local mat = materialList[i]
        mat:ColorModulate(r, g, b)
        mat:AlphaModulate(a)
    end
end

local function findConsoleMaterials()
    if materialList[1] then return end

    local material = MatSystem.FirstMaterial()
    local foundCount = 0

    while(foundCount < 5)
    do
        local mat = MatSystem.GetMaterial(material)
        local name = mat:GetName()

        for i = 1, #consoleMaterials do
            if name == consoleMaterials[i] then
                materialList[i] = mat
                foundCount = foundCount + 1
                break
            end
        end

        material = MatSystem.NextMaterial(material)
    end
end

local function main_console_custom()
    if ConsoleCustom:Get() then
        findConsoleMaterials()
        local color = ConsoleCustom:GetColor()
        local consoleVisible = isConsoleVisible(engineClientClass)

        if consoleVisible and not isColorEquals(oldColor, color) then
            updateConsoleColor(color.r, color.g, color.b, color.a)
            copyColor(color, oldColor)
        end
        if consoleVisible ~= oldConsoleIsVisible then
			if not consoleVisible then
				updateConsoleColor(1, 1, 1, 1)
			else
				updateConsoleColor(color.r, color.g, color.b, color.a)
			end
			oldConsoleIsVisible = consoleVisible
		end
    end
end
local function cfgConsoleCallback()
    local color = ConsoleCustom:GetColor()
    
    if not ConsoleCustom:Get() then
        updateConsoleColor(1, 1, 1, 1)
    elseif isConsoleVisible(engineClientClass) then
        updateConsoleColor(color.r, color.g, color.b, color.a)
        copyColor(color, oldColor)
    end
end
-- Core
local _set_clantag = ffi.cast('int(__fastcall*)(const char*, const char*)', Utils.PatternScan('engine.dll', '53 56 57 8B DA 8B F9 FF 15'))
local _last_clantag = nil
local set_clantag = function(v)
  if v == _last_clantag then return end
  _set_clantag(v, v)
  _last_clantag = v
end

-- Optimized build_tag so it uses one loop instead of two
local animatedTag = function(tag, animation)
	if animation == 0 then -- in-out
		local tagTable = {}
		for i = 1, #tag do
			table.insert(tagTable, i, tag:sub(1, i));
			table.insert(tagTable, i*2, tag:sub(1, #tag-i));
		end
		return tagTable
	end
	if animation == 1 then
		local tagTable = {}
		return tagTable
	end	
end

local tag = ""
local usedTag = ""

local imagesize = {
Vector2.new(754 / 3.8, 1220 / 3.8),
Vector2.new(663 / 4, 1458 / 4),
Vector2.new(1138 / 5, 1614 / 5),
Vector2.new(581 / 3, 966 / 3),
Vector2.new(1211 / 3, 804 / 3),
Vector2.new(850 / 3, 1201 / 3),
Vector2.new(1357 / 5, 1925 / 5),
Vector2.new(368 / 1.5, 581 / 1.5),
Vector2.new(749 / 2.9, 1200 / 2.9),
Vector2.new(1024 / 5, 1571 / 5),
Vector2.new(999 / 2, 800 / 2),
Vector2.new(436 / 1.5, 604 / 1.5),
Vector2.new(462 / 2, 689 / 2),
Vector2.new(1600 / 4, 1127 / 4),
Vector2.new(999 / 3, 799 / 3),
Vector2.new(1600 / 4, 1221 / 4),
Vector2.new(1497 / 4, 1771 / 4),
Vector2.new(560 / 2, 947 / 2),
[99]=Vector2.new(809 / 15, 844 / 15) -- killcount
}

local function test_1()
    if select:Get() == 0 then
		alpha:SetVisible(true)
    else
		alpha:SetVisible(false)
    end
end
local function test_2()
    if select:Get() == 1 then
        warning:SetVisible(true)
    else
        warning:SetVisible(false)
    end
end
local Shell32 = ffi.load("Shell32")
local sources = Menu.Button("[W.P].coord / Link", "Discord", function()
    Shell32.ShellExecuteA(nil, "open", "https://discord.gg/2HC4NMQPqH", nil, nil, 0)
end)
local function misc_tab()
    if select:Get() == 2 then
        Enabled:SetVisible(true)
		TagType:SetVisible(true)
		trashtalk:SetVisible(true)
		spamchat:SetVisible(true)
    else
        Enabled:SetVisible(false)
		TagType:SetVisible(false)
		trashtalk:SetVisible(false)
		spamchat:SetVisible(false)
    end
end
local function ui_tab()
    if select:Get() == 3 then
		if watermarks:Get() == 1 then
			water_clr:SetVisible(true)
		else
			water_clr:SetVisible(false)
		end
		if background_menu:Get() == 1 then
			thickness_bcg:SetVisible(true) 
			FirstAngle:SetVisible(true)
			SecondAngle:SetVisible(true)
			ThirdAngle:SetVisible(true)
			FourthAngle:SetVisible(true)
		else
			thickness_bcg:SetVisible(false)
			FirstAngle:SetVisible(false)
			SecondAngle:SetVisible(false)
			ThirdAngle:SetVisible(false)
			FourthAngle:SetVisible(false)
		end
		animegirls:SetVisible(true)
		animegirls_left:SetVisible(true)
		animegirls_right:SetVisible(true)
		ConsoleCustom:SetVisible(true)
		watermarks:SetVisible(true)
		background_menu:SetVisible(true)
		--bloom:SetVisible(true)
		--antiafk:SetVisible(true)
    else
		animegirls:SetVisible(false)
		animegirls_left:SetVisible(false)
		animegirls_right:SetVisible(false)
		water_clr:SetVisible(false)
		ConsoleCustom:SetVisible(false)
		watermarks:SetVisible(false)
		background_menu:SetVisible(false)
		thickness_bcg:SetVisible(false)
		FirstAngle:SetVisible(false)
		SecondAngle:SetVisible(false)
		ThirdAngle:SetVisible(false)
		FourthAngle:SetVisible(false)
		--bloom:SetVisible(false)
		--antiafk:SetVisible(false)
    end
end
local function creditsAndInfo()
    if select:Get() == 4 then
        info:SetVisible(true)
		logs_1:SetVisible(true)
		logs_2:SetVisible(true)
		credits:SetVisible(true)
		sources:SetVisible(true)
		yougame:SetVisible(true)
		vk:SetVisible(true)
    else
        info:SetVisible(false)
		logs_1:SetVisible(false)
		logs_2:SetVisible(false)
		credits:SetVisible(false)
		sources:SetVisible(false)
		yougame:SetVisible(false)
		vk:SetVisible(false)
    end
end
local function animateSync()
    local netchann_info = EngineClient.GetNetChannelInfo()
    if netchann_info == nil then return end
    local latency = netchann_info:GetLatency(0) / GlobalVars.interval_per_tick
    local tickcount_pred = GlobalVars.tickcount + latency
    local iter = math.floor(math.fmod(tickcount_pred / TagSpeed:Get(), #tag))+1
    set_clantag(tag[iter])
end
-- Something that most of scripts don't ever do: return the original tag back
local function undo()
	if not EngineClient.IsConnected() then return end
	set_clantag("")
end
local function changeTag()
	if select:Get() == 2 then
		TagText:SetVisible((TagType:Get() == 1) or (TagType:Get() == 2))
		TagSpeed:SetVisible((TagType:Get() ~= 2 and TagType:Get() ~= 0))
	else
		TagText:SetVisible(false)
		TagSpeed:SetVisible(false)
	end
	if not Enabled:Get() then undo() return end
	if not EngineClient.IsConnected() then return end
	if TagType:Get() == 1 then
		if (TagText:Get() ~= usedtag) then
			tag = animatedTag(TagText:Get(), 0)
			usedtag = TagText:Get()
		end
		if (type(tag)~="table") then
			tag = animatedTag(TagText:Get(), 0)
		end
		animateSync()
		return
	end
	if TagType:Get() == 2 then
		if (TagText:Get() ~= usedtag) then
			tag = TagText:Get()
			usedtag = TagText:Get()
		end
		if type(tag) == "table" then
			tag = TagText:Get()
		end
		set_clantag(tag)
		return
	end
		if TagType:Get() == 0 then
		--local thing = Utils.UnixTime() / 1000;
		--local seconds = math.floor(thing)%60;
		--local minutes = math.floor(thing / 60)%60;
		--local hours = math.floor(thing / 60 / 60)%24;
		
		--if seconds < 10 then seconds = "0"..seconds end
		--if minutes < 10 then minutes = "0"..minutes end
		--if hours < 10 then hours = "0"..hours end
		local ctcurrenttime = GetCurrentTime()
		tag = ctcurrenttime
		usedTag = tag
		set_clantag(tag)
		return
	end
	if TagType:Get() == 3 then
		usedTag = "NeverLose"
		tag = {
		" ",
				" | ",
				" |\\ ",
				" |\\| ",
				" N ",
				" N3 ",
				" Ne ",
				" Ne\\ ",
				" Ne\\/ ",
				" Nev ",
				" Nev3 ",
				" Neve ",
				" Neve| ",
				" Neve|2 ",
				" Never|_ ",
				" Neverl ",
				" Neverl0 ",
				" Neverlo ",
				" Neverlo5 ",
				" Neverlos ",
				" Neverlos3 ",
				" Neverlose ",
				" Neverlose. ",
				" Neverlose.< ",
				" Neverlose.c< ",
				" Neverlose.cc ",
				" Neverlose.cc ",
				" Neverlose.c< ",
				" Neverlose.< ",
				" Neverlose. ",
				" Neverlose ",
				" Neverlos3 ",
				" Neverlos ",
				" Neverlo5 ",
				" Neverlo ",
				" Neverl0 ",
				" Neverl ",
				" Never|_ ",
				" Never|2 ",
				" Neve|2 ",
				" Neve| ",
				" Neve ",
				" Nev3 ",
				" Nev ",
				" Ne\\/ ",
				" Ne\\ ",
				" Ne ",
				" N3 ",
				" N ",
				" |\\| ",
				" |\\ ",
				" | ",
				" ",
		}
	  animateSync()
	  return
	end
	if TagType:Get() == 4 then
		usedTag = "gamesense"
		tag = {
			"g",
			"ga",
			"game",
			"games",
			"gamese",
			"gamesen",
			"gamesens",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesense",
			"gamesens",
			"gamesen",
			"gamese",
			"games",
			"game",
			"ga",
			"g",
			""
		}
		animateSync()
	end
	
if TagType:Get() == 5 then
		usedTag = "Spirthack (new)"
		tag = {
			"",
			"5",
			"s",
			"sb",
			"sp",
			"sp1",
			"spi",
			"spi|>",
			"spir",
			"spir7",
			"spirt",
			"spirt/-/",
			"spirth ",
			"spirthv ",
			"spirtha ",
			"spirtha< ",
			"spirthac ",
			"spirthac|< ",
			"spirthack ",
			"spirthack ",
			"spirthac|< ",
			"spirthac ",
			"spirtha< ",
			"spirtha ",
			"spirthv ",
			"spirth ",
			"spirt/-/",
			"spirt",
			"spir7",
			"spir",
			"spi|>",
			"spi",
			"sp1",
			"sp",
			"sb",
			"s",
			"5"
		}
		animateSync()
	end	

	if TagType:Get() == 6 then
		usedTag = "onetap v2"
		tag = {
		"onetap.su ",
		"netap.su o",
		"etap.su on",
		"tap.su one",
		"ap.su onet",
		"p.su oneta",
		".su onetap",
		"su onetap.",
		"u onetap.s",
		"onetap.su "

		   }
		   animateSync()
	end
		if TagType:Get() == 7 then
		usedTag = "onetap v3"
		tag = {
		"onetap"

		   }
		   animateSync()
	end
	if TagType:Get() == 8 then
		usedTag = "KILLAURA.UNO"
			tag = {
				"[> K <]",
				"[> KI <]",
				"[> KIL <]",
				"[> KILL <]",
				"[> KILLA <]",
				"[> KILLAU <]",
				"[> KILLAUR <]",
				"[> KILLAURA <]",
				"[> KILLAURA. <]",
				"[> KILLAURA.U <]",
				"[> KILLAURA.UN <]",
				"[> KILLAURA.UNO <]",
				"[> KILLAURA.UNO <]",
				"[> KILLAURA.UNO <]",
				"[> KILLAURA.UNO <]",
				"[> ILLAURA.UN <]",
				"[> LLAURA.U <]",
				"[> LAURA. <]",
				"[> AURA <]",
				"[> UR <]",
				"[>  <]",
				"[> <]"
			}
		   animateSync()
	end	

	if TagType:Get() == 9 then
		usedTag = "NeverDie"
			tag = {
		" ",
		"N ",
		"N3 ",
		"Ne|/ ",
		"Nev ",
		"Nev3 ",
		"Neve| ",
		"Never ",
		"Neverd ",
		"Neverd| ",
		"Neverdi ",
		"Neverdi3  ",
		"Neverdie ",
		"Neverdi3 ",
		"Neverdi ",
		"Neverd| ",
		"Neverd ",
		"Never ",
		"Neve| ",
		"Nev3 ",
		"Nev ",
		"Ne|/ ",
		"N3 ",
		"N ",
		" "
			}
		   animateSync()
	end	


	if TagType:Get() == 10 then
		usedTag = "RaweTrip"
			tag = {
		" 〄 " ,
		" R>|〄 " ,
		" RA>|〄 " ,
		" R4W>|〄 " ,
		" RAWЭ>|〄 " ,
		" R4W3T>|〄 " ,
		" RAWΣTR>|〄 " ,
		" Я4WETRI>|〄 " ,
		" RAWETRIP>|〄 " ,
		" RAWETRIP<|〄 " ,
		" R4WETRI<|〄 " ,
		" RAWΣTR<|〄 " ,
		" R4W3T<|〄 " ,
		" RAWЭ<|〄 " ,
		" R4W<|〄 " ,
		" RA<|〄 " ,
		" R<|〄 " ,
		" 〄 " 
			}
		   animateSync()
	end	


	if TagType:Get() == 11 then
		usedTag = "millionware"
			tag = {
		"$            ",
		"$          mi",
		"$         mil",
		"$        mill",
		"$       milli",
		"$      millio",
		"$     million",
		"$    millionw",
		"$   millionwa",
		"$  millionwar",
		"$ millionware",
		"$ millionware",
		"$ illionware ",
		"$ llionware  ",
		"$ lionware   ",
		"$ ionware    ",
		"$ onware     ",
		"$ nware      ",
		"$ ware       ",
		"$ are        ",
		"$ re         ",
		"$ e          ",
		"$            "
			}
		   animateSync()
	end	


	if TagType:Get() == 12 then
		usedTag = "AimWare old"
			tag = {
		"           ",
		"          A",
		"         AI",
		"        AIM",
		"       AIMW",
		"      AIMWA",
		"     AIMWAR",
		"    AIMWARE",
		"   AIMWARE.",
		"  AIMWARE.N",
		" AIMWARE.NE",
		"AIMWARE.NET",
		"IMWARE.NET ",
		"MWARE.NET  ",
		"WARE.NET   ",
		"ARE.NET    ",
		"RE.NET     ",
		"E.NET       ",
		".NET       ",
		"NET        ",
		"ET         ",
		"T          "
			}
		   animateSync()
	end	


	if TagType:Get() == 13 then
		usedTag = "fanta"
			tag = {
		"               s",
		"              si",
		"             sip",
		"            sipp",
		"           sippi",
		"          sippin",
		"         sippin'",
		"        sippin' ",
		"       sippin' f",
		"      sippin' fa",
		"     sippin' fan",
		"    sippin' fant",
		"   sippin' fanta",
		"  sippin' fanta ",
		" sippin' fanta  ",
		"sippin' fanta   ",
		"ippin' fanta    ",
		"ppin' fanta     ",
		"pin' fanta      ",
		"in' fanta       ",
		"n' fanta        ",
		"' fanta         ",
		" fanta          ",
		"fanta           ",
		"anta            ",
		"nta             ",
		"ta              ",
		"a               ",
		"                "
			}
		   animateSync()
	end

	if TagType:Get() == 14 then
			usedTag = "2k17.club"
			tag = {
		"2k17.club",
		"2k17.club",
		"2k17.club",
		"2k17.club",
		" k17.clu ",
		"  17.cl  ",
		"   7.c   ",
		"    .    ",
		"         ",
		"    .    ",
		"   7.c   ",
		"  17.cl  ",
		" k17.clu ",
		"2k17.club"
			}
		   animateSync()
	end


	if TagType:Get() == 15 then
			usedTag = "PPHUD"
			tag = {
				"  ",
				" P| ",
				" PP| ",
				" PPH| ",
				" PPHU| ",
				" PPHUD| ",
				" PPHUD B| ",
				" PPHUD Be| ",
				" PPHUD Bet| ",
				" PPHUD Beta| ",
				" PPHUD Beta ",
				" PPHUD Beta ",
				" PPHUD Bet/ ",
				" PPHUD Be/ ",
				" PPHUD B/ ",
				" PPHUD/ ",
				" PPHU/ ",
				" PPH/ ",
				" PP/ ",
				" P/ ",
				"  "
			}
		   animateSync()
	end


	if TagType:Get() == 16 then
			usedTag = "INTERWEBZ"
			tag = {
		" ----------- ",
		"-I---------",
		"-IN--------",
		"-INT-------",
		"-INTE------",
		"-INTER-----",
		"-INTERW----",
		"-INTERWE---",
		"-INTERWEB--",
		"-INTERWEBZ-",
		"--NTERWEBZ-",
		"---TERWEBZ-",
		"----ERWEBZ-",
		"-----RWEBZ-",
		"------WEBZ-",
		"-------EBZ-",
		"--------BZ-",
		"---------Z-",
		"-----------"
			}
		   animateSync()
	end


	if TagType:Get() == 17 then
			usedTag = "Extrim Hack"
			tag = {
		" <> ",
		"<3>",
		"<E>",
		"XXX",
		"<Ex>",
		".exe",
		"<Ex|>",
		"<ExT>",
		"<Ext>",
		"<Extr>",
		"<Extri>",
		"<Extrim>",
		"<3xtrim3>",
		"<ExtrimH>",
		"<ExtrimHax>",
		"<3Haxyu>",
		"<Extrim-Haxyu?>",
		"<ExtrimHack>",
		"<ExtrimHack>",
		"<ExtrimHack>",
		"<Extrim-Haxyu?>",
		"<3Haxyu>",
		"<ExtrimHax>",
		"<ExtrimH>",
		"<3xtrim3>",
		"<Extrim>",
		"<Extri>",
		"<Extr>",
		"<Ext>",
		"<ExT>",
		"<Ex|>",
		".exe",
		"<Ex>",
		"XXX",
		"<E>",
		"<3>",
		" <> "
			}
		   animateSync()
	end


	if TagType:Get() == 18 then
			usedTag = "Aurora FREE"
			tag = {
		"",
		" ",
		"  @  ",
		"@@",
		"@ @",
		"@  @",
		"@   @",
		"@ A @",
		"@ AY @",
		"@ Au @",
		"@ AYP @",
		"@ Aur @",
		"@ AYP0 @",
		"@ Auro @",
		"@ AYP0P @",
		"@ Auror @",
		"@ AYP0PA @",
		"@ Aurora @",
		"@- AYP0PA@",
		"@- Aurora@",
		"@-- AYP0P@",
		"@-- Auror@",
		"@--- AYP0@",
		"@--- Auro@",
		"@---- AYP@",
		"@---- Aur@",
		"@----- A@",
		"@----A A@",
		"@----a A@",
		"@---ta A@",
		"@--tta A@",
		"@-etta A@",
		"@betta A@",
		"@betta Aurora@",
		"@betta Aurora@",
		"@betta Aurora@",
		"@betta Aurora@",
		"@betta Aurora@",
		"@betta A@",
		"@-etta A@",
		"@--tta A@",
		"@---ta A@",
		"@----a A@",
		"@----A A@",
		"@----- A@",
		"@---- Aur@",
		"@---- AYP@",
		"@--- Auro@",
		"@--- AYP0@",
		"@-- Auror@",
		"@-- AYP0P@",
		"@- Aurora@",
		"@- AYP0PA@",
		"@ Aurora @",
		"@ AYP0PA @",
		"@ Auror @",
		"@ AYP0P @",
		"@ Auro @",
		"@ AYP0 @",
		"@ Aur @",
		"@ AYP @",
		"@ Au @",
		"@ AY @",
		"@ A @",
		"@   @",
		"@  @",
		"@ @",
		"@@",
		"  @  ",
		"B3ST FR33 HACK",
		"B3ST FR33 HACK",
		"B3ST FR33 HACK",
		"B3ST FR33 HACK",
		"B3ST FR33 HACK",
		" ",
		""
			}
		   animateSync()
	end

	if TagType:Get() == 19 then
			usedTag = "Avira"
			tag = {
		"c====3",
		"A====3",
		"Av===3",
		"Avi==3",
		"Avir=3",
		"Avira3",
		"AviraHack",
		"Avira3",
		"Avir=3",
		"Avi==3",
		"Av===3",
		"A====3",
		"c====3"
			}
		   animateSync()
	end


	if TagType:Get() == 20 then
			usedTag = "Avira2"
			tag = {
		"     c",
		"    c=",
		"   c==",
		"  c===",
		" c====",
		"c====3",
		" c====",
		"  c===",
		"   c==",
		"    c=",
		"     c"
			}
		   animateSync()
	end


	if TagType:Get() == 21 then
			usedTag = "gayware"
			tag = {
		"G ",
		"Ga ",
		"Gay ",
		"Gayw ",
		"Gaywa ",
		"Gaywar ",
		"Gayware ",
		"Gayware. ",
		"Gayware.c ",
		"Gayware.cc",
		" ayware.cc",
		" yware.cc",
		" ware.cc",
		" are.cc",
		" re.cc",
		" e.cc",
		" .cc",
		" cc",
		" c"
			}
		   animateSync()
	end


	if TagType:Get() == 22 then
			usedTag = "samoware old"
			tag = {
		"S",
		"SA",
		"SAM",
		"SAMO",
		"SAMOW",
		"SAMOWA",
		"SAMOWAR",
		"SAMOWARE",
		"SAMOWARE",
		"SAMOWARE",
		"AMOWARE",
		"MOWARE",
		"OWARE",
		"WARE",
		"ARE",
		"RE",
		"E",
		""
			}
		   animateSync()
	end


	if TagType:Get() == 23 then
			usedTag = "Putin.cc"
			tag = {
		"P",
		"Pu",
		"Put",
		"Puti",
		"Putin",
		"Putin.",
		"Putin.c",
		"Putin.cc",
		"Putin.cc",
		"Putin.cc",
		"utin.cc",
		"tin.cc",
		"in.cc",
		"n.cc",
		".cc",
		"c",
		"c"
			}
		   animateSync()
	end


	if TagType:Get() == 24 then
			usedTag = "fatality old"
			tag = {
		" f " ,
		" fa " ,
		" fat " ,
		" fatali " ,
		" fatalit " ,
		" fatality.w ",
		" fatality.wi ",
		" fatality.win",
		" fatality.win",
		" fatality.win",
		" fatality.wi ",
		" fatality.w ",
		" fatalit ",
		" fatali ",
		" fat" ,
		" fa" ,
		" f "
			}
		   animateSync()
	end
	if TagType:Get() == 25 then
			usedTag = "fatality"
			tag = {
		"  " ,
		" | " ,
		"  " ,
		" | " ,
		"  " ,
		" | " ,
		"  ",
		" f| ",
		" fa| ",
		" fat| ",
		" fata| ",
		" fatal| " ,
		" fatali| " ,
		" fatalit| " ,
		" fatality| " ,
		" fatality " ,
		" fatality| " ,
		" fatality " ,
		" fatality " ,
		" fatality| " ,
		" fatality " ,
		" fatalit| " ,
		" fatali| " ,
		" fatal| " ,
		" fata| " ,
		" fat| " ,
		" fa| " ,
		" f| " ,
		"  " ,
		" | " ,
		"  " ,
		" | " ,
		"  ",
		" | "
			}
		   animateSync()
	end

	if TagType:Get() == 26 then
			usedTag = "PRIMORDIAL.DEV"
			tag = {
		" ",
		"p",
		"pr",
		"pri",
		"prim",
		"primo",
		"el>primo",
		"primor",
		"primord",
		"primordi",
		"primordia",
		"primordial",
		"primordial",
		"primordial",
		"primordia",
		"primordi",
		"primord",
		"primor",
		"el>primo",
		"primo",
		"prim",
		"pri",
		"pr",
		"p",
		" "
			}
		   animateSync()
	end


	if TagType:Get() == 27 then
			usedTag = "Tenza"
			tag = {
		" ",
		"T",
		"T3",
		"Te",
		"T3M",
		"Ten",
		"T3M7",
		"Tenz",
		"T3M70",
		"Tenza",
		"TenzaHack",
		"TenzaHack",
		"TenzaHack",
		"Tenza",
		"T3M70",
		"Tenz",
		"T3M7",
		"Ten",
		"T3M",
		"Te",
		"T3",
		"T",
		" "
			}
		   animateSync()
	end


	if TagType:Get() == 28 then
			usedTag = "LambdaHack"
			tag = {
		"<>",
		"><",
		"<>",
		"><",
		"<>",
		"<L>",
		">L",
		">>La",
		">>>Lam",
		">>>>Lamb",
		">>>>>Lambd",
		">>>>>>Lambda",
		">>>>>LambdaHack",
		">>>>>LambdaHack",
		">>>>>LambdaHack",
		">>>>>LambdaHack",
		">>>>>LambdaHack",
		">>>>>LambdaHac<",
		">>>>>Lambd<<",
		">>>>>Lamb<<<",
		">>>>>Lam<<<<",
		">>>>>La<<<<<",
		">>>>>>>L<<<<<<",
		">>>>>>><<<<<<<",
		">>>>>><<<<<<<<",
		">>>>><<<<<<<<<",
		">>>><<<<<<<<<<",
		">>><<<<<<<<<<<",
		">><<<<<<<<<<<<",
		"><<<<<<<<<<<<<",
		"><",
		"<L>",
		"<>",
		"><",
		"<>",
		"><",
		"<>"
			}
		   animateSync()
	end

	if TagType:Get() == 29 then
			usedTag = "INTERIUM"
			tag = {
		" ",
		"I",
		"IN",
		"INT",
		"INTE",
		"INTER",
		"INTERI",
		"INTERIU",
		"INTERIUM",
		"INTERIU",
		"INTERI",
		"INTER",
		"INTE",
		"INT",
		"IN",
		"I",
		" "
			}
		   animateSync()
	end

	if TagType:Get() == 30 then
			usedTag = "legendware old"
			tag = {
		" ",
		"l",
		"le",
		"leg",
		"legen",
		"legend",
		"legendw",
		"legendwa",
		"legendwar",
		"legendware",
		"legendwar",
		"legendwa",
		"legendw",
		"legend",
		"legen",
		"lege",
		"leg",
		"le",
		"l",
		" "
			}
		   animateSync()
	end


	if TagType:Get() == 31 then
			usedTag = "Pandora"
			tag = {
		"pandora",
				" andor ",
				"  ndo  ",
				"   d   ",
				"       ",
				"p     a",
				"pa   ra",
				"pan ora",
				"pandora"
			}
		   animateSync()
	end


	if TagType:Get() == 32 then
			usedTag = "Nemesis.technology"
			tag = {
		"n",
		"ne",
		"nem",
		"neme",
		"nemes",
		"nemesi",
		"nemesis",
		"n3m3sis",
		"nemesis",
		"n3m3sis",
		"nemesis",
		"nemesi",
		"nemes",
		"neme",
		"nem",
		"ne",
		"n",
		" "
			}
		   animateSync()
	end

	if TagType:Get() == 33 then
			usedTag = "rifk7"
			tag = {
		"<>",
		"<R>",
		"<Ri>",
		"<Rif>",
		"<Rifk7>",
		"<Rifk7>",
		"<Rifk7>",
		"<Rifk>",
		"<Rif>",
		"<Ri>",
		"<R>",
		"<>"
			}
		   animateSync()
	end

	if TagType:Get() == 34 then
			usedTag = "REBOOTHACK"
			tag = {
		"R",
		"R3",
		"RE",
		"R36",
		"REB00",
		"REBOO",
		"REBOO.",
		"REBOOT",
		"reboot> ",
		"reboot >",
		"reboot H>",
		"reboot HA>",
		"reboot HAx>",
		"reboot HACK",
		"REBOOT HACK",
		"REBOOT HACK",
		"REBOOT HACK",
		"REBOOT HACK",
		"REBOOT HACK",
		"reboot HACK",
		"reboot HAx<",
		"reboot HA<",
		"reboot H<",
		"reboot <",
		"reboot< ",
		"REBOOT",
		"REBOO.",
		"REBOO",
		"REB00",
		"R36",
		"RE",
		"R3",
		"R"
			}
		   animateSync()
	end

	if TagType:Get() == 35 then
			usedTag = "eexomi"
			tag = {
		" eexomi.host ",
		"exomi.host  e",
		"xomi.host  ee",
		"omi.host  eex",
		"mi.host  eexo",
		"i.host  eexom",
		".host  eexomi",
		"host  eexomi.",
		"ost  eexomi.h",
		"st  eexomi.ho",
		"t  eexomi.hos",
		" eexomi.host ",
		" eexomi.host "
			}
		   animateSync()
	end

	if TagType:Get() == 36 then
			usedTag = "ev0lve (custom)"
			tag = {
		"E",
		"eV",
		"ev0",
		"evoL",
		"eVolV",
		"3v0lv3",
		"3v0lv3",
		"3v0lv3",
		"eVolV",
		"evoL",
		"ev0",
		"eV",
		"E"
			}
		   animateSync()
	end


	if TagType:Get() == 37 then
			usedTag = "ev0lve (orig old)"
			tag = {
		"  ",
		" ev ",
		" ev0 ",
		" ev0l ",
		" ev0lve ",
		" ev0lve. ",
		" ev0lve.x ",
		" ev0lve.xy ",
		" ev0lve.xyz ",
		" ev0lve.xyz ",
		" v0lve.xyz ",
		" 0lve.xyz ",
		" lve.xyz ",
		" ve.xyz ",
		" e.xyz ",
		" .xyz ",
		" xyz ",
		" yz ",
		" z ",
		"  "
			}
		   animateSync()
	end


	if TagType:Get() == 38 then
			usedTag = "LuckyCharms"
			tag = {
		"Luck",
		"Lucky",
		"LuckyC",
		"LuckyCh",
		"LuckyCh4",
		"LuckyCh4r",
		"LuckyCh4rm",
		"LuckyCh4rm$",
		"LuckyCh4rm$",
		"LuckyCh4rm$",
		"LuckyCh4rm$",
		"uckyCh4rm$",
		"ckyCh4rm$",
		"kyCh4rm$",
		"yCh4rm$",
		"Ch4rm$",
		"h4rm$",
		"4rm$",
		"rm$ L",
		"m$ Lu",
		"$ Luc",
		"Luck",
		"Lucky",
		"LuckyC",
		"LuckyCh",
		"LuckyCha",
		"LuckyChar",
		"LuckyCharm",
		"LuckyCharms",
		"LuckyCharms",
		"LuckyCharms",
		"LuckyCharms",
		"uckyCharms",
		"ckyCharms",
		"kyCharms",
		"yCharms",
		"Charms",
		"harms",
		"arms",
		"rms L",
		"ms Lu",
		"s Luc"
			}
		   animateSync()
	end


	if TagType:Get() == 39 then
			usedTag = "nixware.cc (old)"
			tag = {
		"nixware.cc",
		"ixware.cc",
		"xware.cc",
		"ware.cc",
		"are.cc",
		"re.cc",
		"e.cc",
		".cc",
		"cc",
		"c",
		"",
		"n",
		"ni",
		"nix",
		"nixw",
		"nixwa",
		"nixwar",
		"nixware",
		"nixware.",
		"nixware.c",
		"nixware.cc",
		"nixware.cc"
			}
		   animateSync()
	end


	if TagType:Get() == 40 then
			usedTag = "bebrahook"
			tag = {
		"         ",
		"        b",
		"       be",
		"      beb",
		"     bebr",
		"    bebra",
		"   bebrah",
		"  bebraho",
		" bebrahoo",
		"bebrahook",
		"bebrahoo ",
		"bebraho  ",
		"bebrah   ",
		"bebra    ",
		"bebr     ",
		"beb      ",
		"be       ",
		"b        ",
		"         "
			}
		   animateSync()
	end

	if TagType:Get() == 41 then
		usedTag = "boosters"
		tag = {
		" ",
				" | ",
				" |\\ ",
				" |\\| ",
				" b ",
				" b3 ",
				" bo ",
				" bo\\ ",
				" bo\\/ ",
				" boo ",
				" boo3 ",
				" boos ",
				" boos| ",
				" boos|2 ",
				" boost|_ ",
				" booste ",
				" booste0 ",
				" booster ",
				" booster5 ",
				" boosters ",
				" boosters. ",
				" boosters.< ",
				" boosters.g< ",
				" boosters.gg ",
				" boosters.gg ",
				" boosters.g< ",
				" boosters.< ",
				" boosters. ",
				" boosters ",
				" booster5 ",
				" booster ",
				" booste0 ",
				" booste ",
				" boost|_ ",
				" boos|2 ",
				" boos| ",
				" boos ",
				" boo3 ",
				" boo ",
				" bo\\/ ",
				" bo\\ ",
				" bo ",
				" b3 ",
				" b ",
				" |\\| ",
				" |\\ ",
				" | ",
				" ",
		}
	  animateSync()
	end
end
local imagesize = {
Vector2.new(754 / 3.8, 1220 / 3.8),
Vector2.new(663 / 4, 1458 / 4),
Vector2.new(1138 / 5, 1614 / 5),
Vector2.new(581 / 3, 966 / 3),
Vector2.new(1211 / 3, 804 / 3),
Vector2.new(850 / 3, 1201 / 3),
Vector2.new(1357 / 5, 1925 / 5),
Vector2.new(368 / 1.5, 581 / 1.5),
Vector2.new(749 / 2.9, 1200 / 2.9),
Vector2.new(1024 / 5, 1571 / 5),
Vector2.new(999 / 2, 800 / 2),
Vector2.new(436 / 1.5, 604 / 1.5),
Vector2.new(462 / 2, 689 / 2),
Vector2.new(1600 / 4, 1127 / 4),
Vector2.new(999 / 3, 799 / 3),
Vector2.new(1600 / 4, 1221 / 4),
Vector2.new(1497 / 4, 1771 / 4),
Vector2.new(560 / 2, 947 / 2),
[99]=Vector2.new(809 / 15, 844 / 15) -- killcount
}
local ImageChace = {
  Render.LoadImageFromFile("spirt/WPCoord/picture/1.png", imagesize[1]),
  Render.LoadImageFromFile("spirt/WPCoord/picture/2.png", imagesize[2]),
  Render.LoadImageFromFile("spirt/WPCoord/picture/3.png", imagesize[3]),
  Render.LoadImageFromFile("spirt/WPCoord/picture/8.png", imagesize[10]),
  Render.LoadImageFromFile("spirt/WPCoord/picture/11.png", imagesize[13]),
}
local function animemenu()
	if (Cheat.IsMenuVisible()) then
    local menu_pos = Render.GetMenuPos()
		if animegirls:Get() == 1 then
			Render.Image(ImageChace[1], Vector2.new(menu_pos.x, menu_pos.y-315), imagesize[1])
			else if animegirls:Get() == 2 then
				Render.Image(ImageChace[2], Vector2.new(menu_pos.x+300, menu_pos.y-330), imagesize[2])
				else if animegirls:Get() == 3 then
					Render.Image(ImageChace[3], Vector2.new(menu_pos.x+540, menu_pos.y-315), imagesize[3])
					else if animegirls:Get() == 4 then
						Render.Image(ImageChace[4], Vector2.new(menu_pos.x, menu_pos.y-304), imagesize[10])
						else if animegirls:Get() == 5 then
							Render.Image(ImageChace[5], Vector2.new(menu_pos.x, menu_pos.y-304), imagesize[13])
						end
					end
				end
			end
		end
	end
end
local r, g, b

local font = Render.InitFont("Verdana",12)

local frame_rate = 0.0
local function get_abs_fps()
frame_rate = 0.9 * frame_rate + (1.0 - 0.9) * GlobalVars.absoluteframetime
return math.floor((1.0 / frame_rate) + 0.5)
end

local function get_latency()
	local netchann_info = EngineClient:GetNetChannelInfo()
	if netchann_info == nil then return "0" end
	local latency = netchann_info:GetLatency(0)
	return string.format("%1.f", math.max(0.0, latency) * 1000.0)
end
local textSize = 0
local function watermark()
	if watermarks:Get() == 1 then
		r = (math.floor(math.sin(GlobalVars.realtime) * 127 + 128)) / 1000 * 3.92
		g = (math.floor(math.sin(GlobalVars.realtime) * 127 + 128)) / 1000 * 3.92
		b = (math.floor(math.sin(GlobalVars.realtime) * 127 + 128)) / 1000 * 3.92

		local screen = EngineClient:GetScreenSize()
		local fps = get_abs_fps()
		local ping = get_latency()
		local currenttimepc = GetCurrentTime()
		local ticks = math.floor(1.0 / GlobalVars.interval_per_tick)
		local rightPadding = 20
		local var = screen.x - textSize - rightPadding
		local x = var - 10
		local y = 9
		local w =  textSize + 20
		local h = 17

		Render.BoxFilled(Vector2.new(x,y+2),Vector2.new(x+textSize+20,h * 1.5 + 2), Color.new(17/255,17/255,17/255,100/255))

		Render.BoxFilled(Vector2.new(x,y),Vector2.new(x+textSize+20,h-6), water_clr:GetColor())

		local nexttext = "[W.P]"
		Render.Text(nexttext, Vector2.new(var, 12), Color.new(255,255,255), 12, font)
		local wide = Render.CalcTextSize(nexttext, 12, font)
		var = var + wide.x

		localtext = " coord"
		Render.Text(localtext, Vector2.new(var,12), Color.RGBA(31, 119, 153, 255), 12, font)
		wide = Render.CalcTextSize(nexttext, 12,font)
		var = var + wide.x

		current_user = Cheat.GetCheatUserName()
		nexttext = " | user: " .. current_user .. ""

		Render.Text(nexttext, Vector2.new(var,12), Color.new(255,255,255), 12,font)

		wide = Render.CalcTextSize(nexttext, 12,font)
		var = var + wide.x

		nexttext = " | ping: ".. ping .."ms"

		Render.Text(nexttext, Vector2.new(var,12), Color.new(255,255,255), 12,font)

		wide = Render.CalcTextSize(nexttext, 12,font)
		var = var + wide.x

		--nexttext = " | " .. ticks .. " rate"

		--Render.Text(nexttext, Vector2.new(var,12), Color.new(255,255,255), 12,font)

		--wide = Render.CalcTextSize(nexttext, 12,font)
		--var = var + wide.x
		nexttext = " | " .. currenttimepc .. " time"

		Render.Text(nexttext, Vector2.new(var,12), Color.new(255,255,255), 12,font)

		wide = Render.CalcTextSize(nexttext, 12,font)
		var = var + wide.x
		textSize = var - (screen.x - textSize - rightPadding)
	end
	if watermarks:Get() == 2 then
		local text = "game" .. "           "
		local fps = get_abs_fps()
		local ticks = math.floor(1.0 / GlobalVars.interval_per_tick)
		local ping = get_latency()
		local currenttimepc = GetCurrentTime()
		local current_user = Cheat.GetCheatUserName()
		--if fps then
		--    text = text .. " | " .. fps .. " fps"
		--end
		if ping then
		text = text .. " | " .. ping .. " ms"    
		end
		if current_user then
		text = text .. " | " .. current_user   
		end
		if ticks then
		text = text .. " | " .. ticks .. " tick"
		end
		if currenttimepc then
		text = text .. " | " .. currenttimepc
		end
		local text_size = Render.CalcTextSize(text , 13)
		local x = EngineClient.GetScreenSize().x - 10
		local y = 10

		Render.BoxFilled(Vector2.new(x - text_size.x - 22, y), Vector2.new(x, y + 32), Color.RGBA(4, 4, 4, 255))
		Render.BoxFilled(Vector2.new(x - text_size.x - 21, y + 1), Vector2.new(x - 1, y + 31), Color.RGBA(54, 54, 54, 255))
		Render.BoxFilled(Vector2.new(x - text_size.x - 20, y + 2), Vector2.new(x - 2, y + 30), Color.RGBA(34, 34, 34, 255))
		Render.BoxFilled(Vector2.new(x - text_size.x - 17, y + 5), Vector2.new(x - 5, y + 27), Color.RGBA(54, 54, 54, 255))
		Render.BoxFilled(Vector2.new(x - text_size.x - 16, y + 6), Vector2.new(x - 6, y + 26), Color.RGBA(4, 4, 4, 255))

		local blue = Color.RGBA(100, 150, 200, 255)
		local lime = Color.RGBA(180, 230, 100, 255)
		local pink = Color.RGBA(180, 100, 160, 255)
		local bluet = Color.RGBA(100, 150, 200, 150)
		local limet = Color.RGBA(180, 230, 100, 150)
		local pinkt = Color.RGBA(180, 100, 160, 150)

		--left part
		Render.GradientBoxFilled(Vector2.new(x - 14 - text_size.x, y + 8), Vector2.new(x - 14 - text_size.x / 2, y + 9), blue, pink, blue, pink);
		Render.GradientBoxFilled(Vector2.new(x - 14 - text_size.x, y + 9), Vector2.new(x - 14 - text_size.x / 2, y + 10), bluet, pinkt, bluet, pinkt);

		--right part
		Render.GradientBoxFilled(Vector2.new(x - 14 - text_size.x / 2, y + 8), Vector2.new(x - 8, y + 9), pink, lime, pink, lime);
		Render.GradientBoxFilled(Vector2.new(x - 14 - text_size.x / 2, y + 9), Vector2.new(x - 8, y + 10), pinkt, limet, pinkt, limet);

		Render.Text("          sense", Vector2.new(x - text_size.x - 11, y + 10), Color.RGBA(160, 200, 80, 255), 13)
		Render.Text(text, Vector2.new(x - text_size.x - 12, y + 10), Color.RGBA(255, 255, 255, 255), 13)
	end
end
local alpha = 0
local function background()
	if background_menu:Get() == 1 then
        if Cheat.IsMenuVisible() then
            alpha = math.min(1, alpha + 0.1)
        else
            alpha = math.max(0, alpha - 0.1)
        end
        local menu_pos = Render.GetMenuPos()
        local menu_sz = Render.GetMenuSize()
        local rectpos1 = Vector2.new(menu_pos.x-thickness_bcg:Get(), menu_pos.y-thickness_bcg:Get())
        local rectpos2 = Vector2.new(menu_pos.x+menu_sz.x+thickness_bcg:Get(), menu_pos.y+menu_sz.y+thickness_bcg:Get())
        local firstColor = FirstAngle:Get()
        local secondColor = SecondAngle:Get()
        local thirdColor = ThirdAngle:Get()
        local fourthColor = FourthAngle:Get()
        Render.GradientBoxFilled(rectpos1, rectpos2, Color.new(firstColor.r, firstColor.g, firstColor.b, alpha), Color.new(secondColor.r, secondColor.g, secondColor.b, alpha), Color.new(thirdColor.r, thirdColor.g, thirdColor.b, alpha), Color.new(fourthColor.r, fourthColor.g, fourthColor.b, alpha))
	end
    if background_menu:Get() == 3 then
        if Cheat.IsMenuVisible() then
           alpha = math.min(1, alpha + 0.1)
        else
            alpha = math.max(0, alpha - 0.1)
        end
        local menu_pos = Render.GetMenuPos()
        local menu_sz = Render.GetMenuSize()
        local rectpos1 = Vector2.new(menu_pos.x-4, menu_pos.y-4)
        local rectpos2 = Vector2.new(menu_pos.x+menu_sz.x+4, menu_pos.y+menu_sz.y+4)
		local firstColor = Color.RGBA(100, 150, 200)
        local secondColor = Color.RGBA(180, 100, 160)
        local thirdColor = Color.RGBA(180, 100, 160)
        local fourthColor = Color.RGBA(180, 230, 100)
        --Render.GradientBoxFilled(rectpos1, rectpos2, Color.new(firstColor.r, firstColor.g, firstColor.b, alpha), Color.new(secondColor.r, secondColor.g, secondColor.b, alpha), Color.new(thirdColor.r, thirdColor.g, thirdColor.b, alpha), Color.new(fourthColor.r, fourthColor.g, fourthColor.b, alpha))
		Render.GradientBoxFilled(rectpos1, rectpos2, Color.new(firstColor.r, firstColor.g, firstColor.b, alpha), Color.new(secondColor.r, secondColor.g, secondColor.b, alpha), Color.new(thirdColor.r, thirdColor.g, thirdColor.b, alpha), Color.new(fourthColor.r, fourthColor.g, fourthColor.b, alpha))
	end
end
Cheat.RegisterCallback("events", function(event)
	if event:GetName() ~= "player_hurt" then return end
    local me = EntityList.GetLocalPlayer()
    local attacker = EntityList.GetPlayerForUserID(event:GetInt("attacker"))
    if attacker ~= me then return end
          EngineClient.ExecuteClientCmd("play buttons/nlsound.wav")
	local phrases = {
     "ez 1 dog ypal bot.",
        "1",
        "123",
        "cacat.",
        "owned",
        "bot 1",
        "h$",
        "nice bot ",
	"OWNED BY PPHUD",
        "ez",
        "1 nn dog",
        "2",
        "Youre the human equivalent of a participation award.",
        "nice miss",
        "you losser ",
	"PPHUD.BETA USER",
        "1 i am legenda",
        "you proluzaesh me 1x1 ",
        "hahaah 1",
        "1111111111111111111111111",
        "spupid 1",
	"U SUCKED DICK PPHUD user",
        "please fix iq ",
        "please fix cheat bot",
		"Ot PPHUD'a upa1 xuesos",
	}
	if trashtalk:Get() == true then
		local function get_phrase()
			return phrases[Utils.RandomInt(1, #phrases)]:gsub('\"', '')
		end
		local victim = EntityList.GetPlayerForUserID(event:GetInt("userid"))
		if victim == attacker or attacker ~= me then return end
		EngineClient.ExecuteClientCmd("say " .. get_phrase() .. "")
	end
end)
Cheat.RegisterCallback("draw", function()
    test_1()
	test_2()
	misc_tab()
	ui_tab()
	creditsAndInfo()
	changeTag()
	animemenu()
	watermark()
	main_console_custom()
	on_paint()
	background()
end)
ConsoleCustom:RegisterCallback(cfgConsoleCallback)
Cheat.RegisterCallback("destroy", function()
	updateConsoleColor(1, 1, 1, 1)
	undo()
end)
