-- ==============================
-- KatovnHub | TSB | MENU LOADER
-- CLEAN VERSION
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

-- ===== LOAD KEYS SAFE =====
local Keys = {}

local success, result = pcall(function()
    return loadstring(game:HttpGet(LINKS.KEYS))()
end)

if success and type(result) == "table" then
    Keys = result
else
    warn("Keys failed to load!")
end

-- ===== NORMALIZE KEY =====
local function Normalize(text)
    return tostring(text):lower():gsub("^%s*(.-)%s*$", "%1")
end

local function IsValidKey(input)
    input = Normalize(input)

    for _, key in ipairs(Keys) do
        if Normalize(key) == input then
            return true
        end
    end

    return false
end

-- ===== WINDOW =====
local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub | TSB Loader",
    Icon = 95214547594099,
    LoadingTitle = "KatovnHub Loader",
    LoadingSubtitle = "Free / Premium System",
    ToggleUIKeybind = "K",
    Theme = "Default"
})

local Main = Window:CreateTab("Main", "home")

Main:CreateLabel("🔑 Enter Premium Key")

local UserKey = ""

Main:CreateInput({
    Name = "Premium Key",
    PlaceholderText = "Enter key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        UserKey = text
    end
})

-- ===== LOAD BUTTON =====
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
        loadstring(game:HttpGet(LINKS.FREE))()
    end
})

Main:CreateLabel("💎 Premium = Anti Hack • Combo • Full Moveset")
