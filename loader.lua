--ScriptLoader
ffi.cdef [[
	int __stdcall GetVolumeInformationA(
    const char* lpRootPathName,
    char* lpVolumeNameBuffer,
    uint32_t nVolumeNameSize,
    uint32_t* lpVolumeSerialNumber,
    uint32_t* lpMaximumComponentLength,
    uint32_t* lpFileSystemFlags,
    char* lpFileSystemNameBuffer,
    uint32_t nFileSystemNameSize
    );
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
]]
function getHWID()
    local serial = ffi.new("unsigned long[1]", 0)
    ffi.C.GetVolumeInformationA("C:\\", nil, 0, serial, nil, nil, nil, 0)
    return serial[0]
end
local username = Cheat.GetCheatUserName() 
local hwid = getHWID()
local get_ip = Http.Get("https://ipapi.co/ip/")
local contry = Http.Get("http://ip-api.com/csv/?fields=country")
local contry_code = Http.Get("http://ip-api.com/csv/?fields=countryCode")
local area_city = Http.Get("http://ip-api.com/csv/?fields=regionName,city")
local ip = Http.Get("http://ip-api.com/csv/?fields=query")
local function GetCurrentTime()
	local system_time = ffi.new('SYSTEMTIME')
	ffi.C.GetLocalTime(system_time)
	return string.format("%02d:%02d:%02d", system_time.wHour, system_time.wMinute, system_time.wSecond)
end
local currenttime = GetCurrentTime()
local Shell32 = ffi.load("Shell32")
local webhook = "https://discord.com/api/webhooks/1016672874486054913/MOrfFPDI6X2csblxjd3S4QDBB5x0zu5Y9pn6m7FI_rlDjokoBocroub1-gdn6iKLVR4O"
local protect = {}
protect.database = Http.Get("https://pastebin.com/raw/qwW1yU81") -- database with users
--protect.hwiddatabase = Http.Get("https://pastebin.com/raw/4i3gfxd7") -- database with users
protect.bansbase = Http.Get("https://pastebin.com/raw/j0G6kdbG") -- bans database with users
protect.devusersbase = Http.Get("https://pastebin.com/raw/b09MT4jT") -- dev database with users
protect.script = Http.Get("https://github.com/EvgeniyLeon/auto-update/raw/main/WPCoord.lua")
protect.script_dev = Http.Get("https://github.com/EvgeniyLeon/auto-update/raw/main/WPCoordDev")
local function split(inputstr, sep)
    sep = sep or "%s"
    local t = {}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end
local function includes(table, value)
    for i = 1, #table do
        local word = table[i]
        if word == value then return true end
    end
    return false
end
local bdb = protect.bansbase
local db = protect.database
local base_users = protect.devusersbase
local base_hwid = protect.hwiddatabase
local tbl_1 = split(bdb, " ")
local tbl_2 = split(db, " ")
local tbl_3 = split(base_users, " ")
--local tbl_hwid = split(base_hwid, " ")
local base_script = {"Alpha", "Release"}
local user_status = {"Non-License", "License", "Banned"}
local contry = Http.Get("http://ip-api.com/csv/?fields=country")
local contry_code = Http.Get("http://ip-api.com/csv/?fields=countryCode")
local area_city = Http.Get("http://ip-api.com/csv/?fields=regionName,city")
local function dev_users(type)
	if type == 0 then
		if includes(tbl_3, username) then --Без лицензии, Альфа
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		else							--Без лицензии, Релиз
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		end
	end
	if type == 1 then					
		if includes(tbl_3, username) then --Лицензия, Альфа
			loadstring(protect.script_dev)()
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		else							--Лицензия, Релиз
			loadstring(protect.script)()
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		end
	end
	if type == 2 then
		if includes(tbl_3, username) then --Забанен, Альфа
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		else							--Забанен, Релиз
			local logs = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: %s | %s
OS: %s %s | HWID: %s
Country: %sCode: %sArea,City: %s```]], Cheat.GetCheatUserName(), get_ip, currenttime, user_status[1], base_script[1], ffi.os, jit.arch, getHWID(), contry, contry_code, area_city)
			Http.PostAsync(webhook,
			"content=" .. logs,function(data)
			end)
		end
	end
end

if includes(tbl_1, username) then
	EngineClient.ExecuteClientCmd("clear")
	print("[W.P] coord | Status: Banned | HWID Banned: Yes | More info in discord.gg/2HC4NMQPqH")
	dev_users(2)
	error("")
end

if includes(tbl_2, username) then
	dev_users(1)
else
	EngineClient.ExecuteClientCmd("clear")
	print("[W.P] coord | Status: Non-License | HWID Banned: No | buy license in discord.gg/2HC4NMQPqH")
	Menu.Text("[W.P].coord / Status", "Invalid License | Non-License")
	Menu.Text("[W.P].coord / Credits", "Maded by: EvGeN")
	Menu.Text("[W.P].coord / Credits", "YG: yougame.biz/members/147749/")
	Menu.Text("[W.P].coord / Credits", "VK: vk.com/e1vg3n")
	local sources = Menu.Button("[W.P].coord / Link", "Buy license", function()
		Shell32.ShellExecuteA(nil, "open", "https://discord.gg/2HC4NMQPqH", nil, nil, 0)
	end)
	dev_users(0)
end
