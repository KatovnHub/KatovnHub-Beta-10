-- =====================================
-- KatovnHub | Fluent Menu Loader
-- =====================================
if getgenv().Katovn_Menu_Loaded then return end
getgenv().Katovn_Menu_Loaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

-- ===== LINKS =====
local LINKS = {
    FREE = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/freemium.lua",
    PREMIUM = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/premium.lua",
    KEYS = "https://raw.githubusercontent.com/KatovnHub/KatovnHub-Beta-10/main/keys.lua"
}

-- =====================================
-- WINDOW (FLUENT STYLE)
-- =====================================
local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub | TSB",
    Icon = 95214547594099, -- prem icon
    LoadingTitle = "KatovnHub",
    LoadingSubtitle = "Fluent Menu Loader",
    Theme = "Dark",
    ToggleUIKeybind = "K"
})

-- =====================================
-- TAB
-- =====================================
local MainTab = Window:CreateTab("Menu", "home")

MainTab:CreateSection("🔑 Premium Access")

-- =====================================
-- LOAD KEYS (SAFE)
-- =====================================
local PremiumKeys = {}

pcall(function()
    local data = loadstring(game:HttpGet(LINKS.KEYS))()
    if type(data) == "table" then
        PremiumKeys = data
    end
end)

local function IsPremium(key)
    for _, v in ipairs(PremiumKeys) do
        if key == v then
            return true
        end
    end
    return false
end

-- =====================================
-- INPUT
-- =====================================
local UserKey = ""

MainTab:CreateInput({
    Name = "Premium Key",
    PlaceholderText = "Enter your key here",
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        UserKey = text
    end
})

-- =====================================
-- BUTTONS
-- =====================================
MainTab:CreateButton({
    Name = "🚀 Load Hub",
    Callback = function()
        getgenv().From_Menu = true

        if IsPremium(UserKey) then
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

MainTab:CreateButton({
    Name = "🆓 Load Free Version",
    Callback = function()
        getgenv().From_Menu = true
        loadstring(game:HttpGet(LINKS.FREE))()
    end
})

-- =====================================
-- INFO (FLUENT)
-- =====================================
MainTab:CreateSection("ℹ️ Info")

MainTab:CreateParagraph({
    Title = "Premium Features",
    Content = "• Anti Hacker\n• Combo Script\n• Full Moveset\n• Advanced Tech"
})

MainTab:CreateParagraph({
    Title = "Free Version",
    Content = "• Basic Tech\n• Moveset\n• Troll Player\n• Script More"
})
