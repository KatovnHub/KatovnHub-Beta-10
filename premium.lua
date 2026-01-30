-- ==============================
-- KatovnHub | TSB | PREMIUM (TEMPLATE)
-- ==============================
if getgenv().Katovn_Premium_Loaded then return end
getgenv().Katovn_Premium_Loaded = true

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local b = Rayfield:CreateWindow({
    Name = "💎 KatovnHub | TSB (Premium)",
    Icon = 95214547594099, -- ✅ LOGO PREMIUM
    LoadingTitle = "KatovnHub Premium",
    LoadingSubtitle = "Golden Edition ✨",
    Theme = "AmberGlow", -- ✅ VÀNG KIM
    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KatovnHub",
        FileName = "TSB_Premium"
    },

    Discord = {
        Enabled = false
    },

    KeySystem = false
})

-- ===== TABS =====
local Tech        = b:CreateTab("Tech", "cpu")
local Moveset     = b:CreateTab("Moveset", "sword")
local AntiHack    = b:CreateTab("Anti Hacker", "shield")
local Combo       = b:CreateTab("Combo Script", "zap")
local Troll       = b:CreateTab("Troll Player", "smile")
local More        = b:CreateTab("Script More", "layers")
local Discord     = b:CreateTab("Discord", "message-circle")
local Setting     = b:CreateTab("Setting", "settings")

-- ===== TECH =====
Tech:CreateButton({
    Name = "Button 1",
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

-- ===== ANTI HACKER =====
AntiHack:CreateButton({
    Name = "",
    Callback = function()
        -- script here
    end
})

-- ===== COMBO SCRIPT =====
Combo:CreateButton({
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

-- ===== DISCORD =====
Discord:CreateButton({
    Name = "Copy Discord Invite",
    Callback = function()
        setclipboard("https://discord.gg/yourserver")
    end
})

-- ===== SETTING =====
Setting:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
    end
})
