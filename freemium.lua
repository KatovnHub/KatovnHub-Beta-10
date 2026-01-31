-- ==============================
-- KatovnHub | TSB | FREE (TEMPLATE)
-- ==============================
if getgenv().Katovn_Free_Loaded then return end
getgenv().Katovn_Free_Loaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local b = Rayfield:CreateWindow({
    Name = "🆓 KatovnHub | TSB (Free)",
    Icon = 92237982579352, -- LOGO FREE
    LoadingTitle = "KatovnHub Free",
    LoadingSubtitle = "Community Version",
    Theme = "DarkBlue",
    ToggleUIKeybind = "K",

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KatovnHub",
        FileName = "TSB_Free"
    },

    KeySystem = false
})

-- ===== TABS =====
local Tech        = b:CreateTab("Tech", "cpu")
local Moveset     = b:CreateTab("Moveset", "sword")
local Troll       = b:CreateTab("Troll Player", "smile")
local More        = b:CreateTab("Script More", "layers")
local UpdatePrem  = b:CreateTab("Update Hub Prem", "bell") -- ✅ TAB MỚI
local Setting     = b:CreateTab("Setting", "settings")

-- ===== TECH =====
Tech:CreateButton({
    Name = "Button 1",
    Callback = function()
        -- script here
    end
})

Tech:CreateButton({
    Name = "Button 2",
    Callback = function()
        -- script here
    end
})

-- ===== MOVESET =====
Moveset:CreateButton({
    Name = "",
    Callback = function()
        -- script here
    end
})

-- ===== TROLL =====
Troll:CreateButton({
    Name = "",
    Callback = function()
        -- script here
    end
})

-- ===== SCRIPT MORE =====
More:CreateButton({
    Name = "",
    Callback = function()
        -- script here
    end
})

-- ===== UPDATE HUB PREMIUM =====
UpdatePrem:CreateLabel("🔔 Premium Update & Community")

UpdatePrem:CreateButton({
    Name = "Join Discord (Premium Update)",
    Callback = function()
        setclipboard("https://discord.gg/Nz9Drwczg")
        Rayfield:Notify({
            Title = "KatovnHub",
            Content = "Discord link copied!",
            Duration = 4
        })
    end
})

UpdatePrem:CreateButton({
    Name = "What does Premium have?",
    Callback = function()
        Rayfield:Notify({
            Title = "KatovnHub Premium",
            Content = "Anti Hacker • Combo Script • Full Moveset • VIP Features",
            Duration = 6
        })
    end
})

-- ===== SETTING =====
Setting:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(
            game.PlaceId,
            game.Players.LocalPlayer
        )
    end
})
