--ScriptLoader
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
]]
local username = Cheat.GetCheatUserName()
local base_name
local get_ip = Http.Get("https://ipapi.co/ip/")
local function GetCurrentTime()
	local system_time = ffi.new('SYSTEMTIME')
	ffi.C.GetLocalTime(system_time)
	return string.format("%02d:%02d:%02d", system_time.wHour, system_time.wMinute, system_time.wSecond)
end
local currenttime = GetCurrentTime()
local Shell32 = ffi.load("Shell32")
local webhook = "https://discord.com/api/webhooks/1016672874486054913/MOrfFPDI6X2csblxjd3S4QDBB5x0zu5Y9pn6m7FI_rlDjokoBocroub1-gdn6iKLVR4O"
local protect = {}
protect.database = Http.Get("https://github.com/EvgeniyLeon/auto-update/raw/main/usersdatabase.ini") -- database with users
--protect.bansbase = Http.Get("https://github.com/EvgeniyLeon/auto-update/raw/main/banlicense.txt") 
protect.script = Http.Get("https://github.com/EvgeniyLeon/auto-update/raw/main/WPCoord.lua")
--if protect.includes(protect.split(protect.database, ' '), username) then
--	if protect.includes(protect.split(protect.bansbase, ' '), username) then
--		EngineClient.ExecuteClientCmd("clear")
--		print("[W.P] coord | Status: Banned | More info in discord.gg/2HC4NMQPqH")
--		local log = string.format([[```WPCoord lua | Launch Loging 
--Username: %s
--IP: %s
--Time: %s
--Status: Banned```]], Cheat.GetCheatUserName(), get_ip, currenttime)
--		Http.PostAsync("https://discord.com/api/webhooks/1016672874486054913/MOrfFPDI6X2csblxjd3S4QDBB5x0zu5Y9pn6m7FI_rlDjokoBocroub1-gdn6iKLVR4O",
--		"content=" .. log,function(data)
--		end)
--		error("")
--	end
--end
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
local str = protect.database
local tbl = split(str, " ")
print(tostring(includes(tbl, username)))
if includes(tbl, username)) then
	--loadstring(protect.script)()
	--print(tostring(includes(tbl, username)))
	local log = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: License```]], Cheat.GetCheatUserName(), get_ip, currenttime)
	Http.PostAsync(webhook,
	"content=" .. log,function(data)
	end)
else
	--EngineClient.ExecuteClientCmd("clear")
	print("Spirthack.me | [W.P] coord | Status: Non-License | buy license in discord.gg/2HC4NMQPqH")
	Menu.Text("[W.P].coord / Status", "Invalid License | Non-License")
	Menu.Text("[W.P].coord / Credits", "Maded by: EvGeN")
	Menu.Text("[W.P].coord / Credits", "YG: yougame.biz/members/147749/")
	Menu.Text("[W.P].coord / Credits", "VK: vk.com/e1vg3n")
	local sources = Menu.Button("[W.P].coord / Link", "Buy license", function()
		Shell32.ShellExecuteA(nil, "open", "https://discord.gg/2HC4NMQPqH", nil, nil, 0)
	end)
	local log_2 = string.format([[```WPCoord lua | Launch Loging 
Username: %s
IP: %s
Time: %s
Status: Non-License```]], Cheat.GetCheatUserName(), get_ip, currenttime)
	Http.PostAsync(webhook,
	"content=" .. log_2,function(data)
	end)
end
