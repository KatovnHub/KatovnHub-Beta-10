-- KatovnHub | Fling Hub (1 Player + All)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

if game.CoreGui:FindFirstChild("KatovnFlingHub") then
    game.CoreGui.KatovnFlingHub:Destroy()
end

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KatovnFlingHub"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 260, 0, 340)
frame.Position = UDim2.new(0.5, -130, 0.5, -170)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.Text = "Fling Hub | by KatovnHub v1"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(35,35,35)
title.BorderSizePixel = 0

local flingAll = Instance.new("TextButton", frame)
flingAll.Size = UDim2.new(1,-10,0,35)
flingAll.Position = UDim2.new(0,5,0,40)
flingAll.Text = "💥 FLING ALL PLAYERS"
flingAll.BackgroundColor3 = Color3.fromRGB(120,40,40)
flingAll.TextColor3 = Color3.new(1,1,1)

local list = Instance.new("ScrollingFrame", frame)
list.Size = UDim2.new(1,-10,1,-90)
list.Position = UDim2.new(0,5,0,80)
list.CanvasSize = UDim2.new(0,0,0,0)
list.ScrollBarImageTransparency = 0.4
list.BackgroundColor3 = Color3.fromRGB(25,25,25)
list.BorderSizePixel = 0

local layout = Instance.new("UIListLayout", list)

-- fling function (chaos mode)
local function fling(target)
    if target == lp then return end
    if not lp.Character or not target.Character then return end

    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local troot = target.Character:FindFirstChild("HumanoidRootPart")
    if not root or not troot then return end

    local old = root.CFrame

    for i=1,300 do
        root.CFrame = troot.CFrame
        root.Velocity = Vector3.new(0,12000,0)
        root.RotVelocity = Vector3.new(999999,999999,999999)
        task.wait()
    end

    root.CFrame = old
end

-- add player button
local function addPlayer(p)
    local b = Instance.new("TextButton", list)
    b.Size = UDim2.new(1,-6,0,32)
    b.Text = "Fling → "..p.Name
    b.BackgroundColor3 = Color3.fromRGB(45,45,45)
    b.TextColor3 = Color3.new(1,1,1)
    b.BorderSizePixel = 0

    b.MouseButton1Click:Connect(function()
        fling(p)
    end)
end

-- fling all
flingAll.MouseButton1Click:Connect(function()
    for _,p in pairs(Players:GetPlayers()) do
        pcall(function()
            fling(p)
        end)
    end
end)

-- populate list
for _,p in pairs(Players:GetPlayers()) do addPlayer(p) end
Players.PlayerAdded:Connect(addPlayer)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    list.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
end)
