local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function fling(target)
    if not lp.Character or not target.Character then return end

    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local troot = target.Character:FindFirstChild("HumanoidRootPart")

    if not root or not troot then return end

    local oldPos = root.CFrame

    for i = 1, 40 do
        root.CFrame = troot.CFrame * CFrame.new(0,0,-1.5)
        root.Velocity = Vector3.new(0, 600, 0)
        task.wait()
    end

    root.CFrame = oldPos
    root.Velocity = Vector3.zero
end

-- GUI popup
if game.CoreGui:FindFirstChild("KatovnFlingGui") then
    game.CoreGui.KatovnFlingGui:Destroy()
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KatovnFlingGui"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.26,0.24)
frame.Position = UDim2.fromScale(0.37,0.35)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.18)
title.Text = "👑 KatovnHub v1 | Fling GUI"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local close = Instance.new("TextButton", frame)
close.Size = UDim2.fromScale(0.12,0.18)
close.Position = UDim2.fromScale(0.88,0)
close.Text = "X"
close.BackgroundColor3 = Color3.fromRGB(120,0,0)
close.TextColor3 = Color3.new(1,1,1)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

local box = Instance.new("TextBox", frame)
box.Size = UDim2.fromScale(0.9,0.22)
box.Position = UDim2.fromScale(0.05,0.25)
box.PlaceholderText = "Enter username"

local flingBtn = Instance.new("TextButton", frame)
flingBtn.Size = UDim2.fromScale(0.9,0.22)
flingBtn.Position = UDim2.fromScale(0.05,0.52)
flingBtn.Text = "🎯 Fling Player"

local flingAll = Instance.new("TextButton", frame)
flingAll.Size = UDim2.fromScale(0.9,0.22)
flingAll.Position = UDim2.fromScale(0.05,0.76)
flingAll.Text = "💥 Fling All"

local status = Instance.new("TextLabel", frame)
status.Size = UDim2.fromScale(1,0.12)
status.Position = UDim2.fromScale(0,0.9)
status.Text = "Status: Ready"
status.TextColor3 = Color3.new(1,1,1)
status.BackgroundTransparency = 1

flingBtn.MouseButton1Click:Connect(function()
    local target = Players:FindFirstChild(box.Text)
    if target then
        fling(target)
        status.Text = "Status: Flinged "..target.Name
    else
        status.Text = "Status: Player not found"
    end
end)

flingAll.MouseButton1Click:Connect(function()
    for _,v in pairs(Players:GetPlayers()) do
        if v ~= lp then
            fling(v)
            task.wait(0.3)
        end
    end
    status.Text = "Status: Flinged All"
end)
