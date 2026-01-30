-- ==============================
-- KatovnHub | TSB | MENU LOADER
-- ==============================
if getgenv().Katovn_Menu_Loaded then return end
getgenv().Katovn_Menu_Loaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ===== RAW LINKS (BRO CHỈ CẦN ĐỔI LINK) =====
local LINKS = {
    FREE = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/freemium.lua",
    PREMIUM = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/premium.lua",
    KEYS = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/keys.lua"
}

-- ===== LOAD KEYS =====
local PremiumKeys = loadstring(game:HttpGet(LINKS.KEYS))()

local function IsValidKey(input)
    for _, key in ipairs(PremiumKeys) do
        if input == key then
            return true
        end
    end
    return false
end

-- ===== MENU WINDOW =====
local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub | TSB",
    Icon = 95214547594099, -- logo trung tâm (hoặc để 0)
    LoadingTitle = "KatovnHub Loader",
    LoadingSubtitle = "Free / Premium System",
    Theme = "Default",
    ToggleUIKeybind = "K",
    KeySystem = false
})

-- ===== TAB =====
local Main = Window:CreateTab("Main", "home")

Main:CreateLabel("🔑 Enter Premium Key")

-- ===== INPUT KEY =====
local UserKey = ""

Main:CreateInput({
    Name = "Premium Key",
    PlaceholderText = "Enter key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        UserKey = text
    end
})

-- ===== BUTTON LOAD =====
Main:CreateButton({
    Name = "Unlock / Load Hub",
    Callback = function()
        if IsValidKey(UserKey) then
            Rayfield:Notify({
                Title = "KatovnHub",
                Content = "Premium unlocked!",
                Duration = 4
            })
            loadstring(game:HttpGet(LINKS.PREMIUM))()
        else
            Rayfield:Notify({
                Title = "KatovnHub",
                Content = "Invalid key → Loading Free version",
                Duration = 4
            })
            loadstring(game:HttpGet(LINKS.FREE))()
        end
    end
})

Main:CreateButton({
    Name = "Load Free Version",
    Callback = function()
        loadstring(game:HttpGet(LINKS.FREE))()
    end
})

Main:CreateLabel("💎 Premium = Anti Hack • Combo • Full Moveset")
