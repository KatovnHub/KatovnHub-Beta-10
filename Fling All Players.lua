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

local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
    Name = "👑 KatovnHub v1 | Fling All",
    ToggleUIKeybind = "K"
})

local Tab = Window:CreateTab("Fling", "zap")

Tab:CreateButton({
    Name = "💥 Fling All Players",
    Callback = function()
        for _,v in pairs(Players:GetPlayers()) do
            if v ~= lp then
                fling(v)
                task.wait(0.3)
            end
        end
    end
})
