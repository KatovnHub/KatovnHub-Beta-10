local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function fling(target)
    if not target.Character then return end
    if not lp.Character then return end

    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local troot = target.Character:FindFirstChild("HumanoidRootPart")

    if root and troot then
        root.CFrame = troot.CFrame
        root.Velocity = Vector3.new(9999,9999,9999)
    end
end

local list = {}
for _,v in pairs(Players:GetPlayers()) do
    if v ~= lp then
        table.insert(list, v.Name)
    end
end

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub v1 | Fling 1 Player",
    ToggleUIKeybind = "K"
})

local Tab = Window:CreateTab("Fling", "zap")

local selected = nil

Tab:CreateDropdown({
    Name = "Select Player",
    Options = list,
    CurrentOption = nil,
    Callback = function(opt)
        selected = opt
    end
})

Tab:CreateButton({
    Name = "Fling Selected Player",
    Callback = function()
        if selected and Players:FindFirstChild(selected) then
            fling(Players[selected])
        end
    end
})
