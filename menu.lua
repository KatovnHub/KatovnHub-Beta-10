-- ==============================
-- KatovnHub | TSB | MENU LOADER (FIXED)
-- ==============================
if getgenv().Katovn_Menu_Loaded then return end
getgenv().Katovn_Menu_Loaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ===== RAW LINKS =====
local LINKS = {
    FREE = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/freemium.lua",
    PREMIUM = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/premium.lua",
    KEYS = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/keys.lua"
}

-- ==============================
-- CREATE WINDOW FIRST (QUAN TRỌNG)
-- ==============================
local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub | TSB",
    Icon = 95214547594099,
    LoadingTitle = "KatovnHub Loader",
    LoadingSubtitle = "Free / Premium",
    ToggleUIKeybind = "K"
})

local Main = Window:CreateTab("Main", "home")

Main:CreateLabel("🔑 Enter Premium Key")

-- ==============================
-- LOAD KEYS (SAFE)
-- ==============================
local PremiumKeys = {}
pcall(function()
    local result = loadstring(game:HttpGet(LINKS.KEYS))()
    if type(result) == "table" then
        PremiumKeys = result
    end
end)

local function IsValidKey(input)
    for _, k in ipairs(PremiumKeys) do
        if input == k then
            return true
        end
    end
    return false
end

-- ==============================
-- INPUT
-- ==============================
local UserKey = ""

Main:CreateInput({
    Name = "Premium Key",
    PlaceholderText = "Enter key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        UserKey = text
    end
})

-- ==============================
-- BUTTONS
-- ==============================
Main:CreateButton({
    Name = "Unlock / Load Hub",
    Callback = function()
        getgenv().From_Menu = true

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
                Content = "Invalid key → Loading Free",
                Duration = 4
            })
            loadstring(game:HttpGet(LINKS.FREE))()
        end
    end
})

Main:CreateButton({
    Name = "Load Free Version",
    Callback = function()
        getgenv().From_Menu = true
        loadstring(game:HttpGet(LINKS.FREE))()
    end
})

Main:CreateLabel("💎 Premium = Anti Hack • Combo • Full Moveset")
