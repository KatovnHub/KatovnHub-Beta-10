-- KatovnHub | Spin Fling Hub (1 Player + All)

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

if game.CoreGui:FindFirstChild("KatovnSpinFling") then
    game.CoreGui.KatovnSpinFling:Destroy()
end

local function spinFling(target)
    if target == lp then return end
    if not lp.Character or not target.Character then return end

    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local troot = target.Character:FindFirstChild("HumanoidRootPart")
    if not root or not troot then return end

    local oldCF = root.CFrame

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(9e9,9e9,9e9)
    bv.Velocity = Vector3.zero
    bv.Parent = root

    local bav = Instance.new("BodyAngularVelocity")
    bav.MaxTorque = Vector3.new(9e9,9e9,9e9)
    bav.AngularVelocity = Vector3.new(0,9999,0)
    bav.Parent = root

    for i = 1,120 do
        root.CFrame = troot.CFrame
        task.wait()
    end

    bv:Destroy()
    bav:Destroy()

    root.CFrame = oldCF
end

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KatovnSpinFling"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,240,0,320)
frame.Position = UDim2.new(0.5,-120,0.5,-160)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,35)
title.Text = "Spin Fling Hub | Katovn v1"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundColor3 = Color3.fromRGB(40,40,40)

local flingAll = Instance.new("TextButton", frame)
flingAll.Size = UDim2.new(1,-10,0,35)
flingAll.Position = UDim2.new(0,5,0,40)
flingAll.Text = "💥 FLING ALL"
flingAll.BackgroundColor3 = Color3.fromRGB(120,40,40)
flingAll.TextColor3 = Color3.new(1,1,1)

flingAll.MouseButton1Click:Connect(function()
    for _,p in pairs(Players:GetPlayers()) do
        task.spawn(function()
            spinFling(p)
        end)
    end
end)

local list = Instance.new("ScrollingFrame", frame)
list.Size = UDim2.new(1,-10,1,-90)
list.Position = UDim2.new(0,5,0,80)
list.CanvasSize = UDim2.new(0,0,0,0)
list.BackgroundColor3 = Color3.fromRGB(25,25,25)

local layout = Instance.new("UIListLayout", list)

local function addPlayer(p)
    local b = Instance.new("TextButton", list)
    b.Size = UDim2.new(1,-6,0,30)
    b.Text = "Fling → "..p.Name
    b.BackgroundColor3 = Color3.fromRGB(60,60,60)
    b.TextColor3 = Color3.new(1,1,1)

    b.MouseButton1Click:Connect(function()
        spinFling(p)
    end)
end

for _,p in pairs(Players:GetPlayers()) do addPlayer(p) end
Players.PlayerAdded:Connect(addPlayer)

layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    list.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y)
end)

