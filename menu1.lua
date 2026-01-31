-- =====================================
-- KatovnHub | Web Menu Loader
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
-- WINDOW (WEB STYLE)
-- =====================================
local Window = Rayfield:CreateWindow({
    Name = "KatovnHub Dashboard",
    Icon = 95214547594099,
    LoadingTitle = "KatovnHub",
    LoadingSubtitle = "Web Loader Panel",
    Theme = "Default",
    ToggleUIKeybind = "K"
})

local Tab = Window:CreateTab("Dashboard", "layout-dashboard")

Tab:CreateSection("Access Panel")

-- =====================================
-- SAFE KEY LOAD
-- =====================================
local Keys = {}

pcall(function()
    local result = loadstring(game:HttpGet(LINKS.KEYS))()
    if type(result) == "table" then
        Keys = result
    end
end)

local function ValidKey(k)
    for _, v in ipairs(Keys) do
        if v == k then
            return true
        end
    end
    return false
end

-- =====================================
-- INPUT
-- =====================================
local InputKey = ""

Tab:CreateInput({
    Name = "Premium Key",
    PlaceholderText = "Enter access key...",
    RemoveTextAfterFocusLost = false,
    Callback = function(txt)
        InputKey = txt
    end
})

-- =====================================
-- BUTTONS
-- =====================================
Tab:CreateButton({
    Name = "Load Hub",
    Callback = function()
        getgenv().From_Menu = true

        if ValidKey(InputKey) then
            Rayfield:Notify({
                Title = "Access Granted",
                Content = "Premium mode enabled",
                Duration = 4
            })
            loadstring(game:HttpGet(LINKS.PREMIUM))()
        else
            Rayfield:Notify({
                Title = "Free Mode",
                Content = "Invalid or empty key",
                Duration = 4
            })
            loadstring(game:HttpGet(LINKS.FREE))()
        end
    end
})

Tab:CreateButton({
    Name = "Load Free Only",
    Callback = function()
        getgenv().From_Menu = true
        loadstring(game:HttpGet(LINKS.FREE))()
    end
})

Tab:CreateSection("Information")

Tab:CreateParagraph({
    Title = "Premium",
    Content = "Full moveset • Anti hacker • Combo script • Advanced tools"
})

Tab:CreateParagraph({
    Title = "Free",
    Content = "Basic moveset • Tech • Troll tools"
})
