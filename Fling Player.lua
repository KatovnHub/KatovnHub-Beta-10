--// KatovnHub Fling GUI
-- independent gui

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

-- destroy old gui
pcall(function()
    game.CoreGui.KatovnFling:Destroy()
end)

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KatovnFling"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.fromScale(0.25,0.28)
frame.Position = UDim2.fromScale(0.37,0.32)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.fromScale(1,0.2)
title.BackgroundTransparency = 1
title.Text = "KatovnHub Fling v1"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local box = Instance.new("TextBox", frame)
box.Position = UDim2.fromScale(0.1,0.3)
box.Size = UDim2.fromScale(0.8,0.18)
box.PlaceholderText = "enter username..."
box.Text = ""
box.TextScaled = true
box.Font = Enum.Font.Gotham
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.TextColor3 = Color3.new(1,1,1)

local flingBtn = Instance.new("TextButton", frame)
flingBtn.Position = UDim2.fromScale(0.1,0.55)
flingBtn.Size = UDim2.fromScale(0.8,0.18)
flingBtn.Text = "FLING PLAYER"
flingBtn.TextScaled = true
flingBtn.Font = Enum.Font.GothamBold
flingBtn.BackgroundColor3 = Color3.fromRGB(200,80,80)
flingBtn.TextColor3 = Color3.new(1,1,1)

local allBtn = Instance.new("TextButton", frame)
allBtn.Position = UDim2.fromScale(0.1,0.78)
allBtn.Size = UDim2.fromScale(0.8,0.18)
allBtn.Text = "FLING ALL"
allBtn.TextScaled = true
allBtn.Font = Enum.Font.GothamBold
allBtn.BackgroundColor3 = Color3.fromRGB(80,120,200)
allBtn.TextColor3 = Color3.new(1,1,1)

local function GetPlayer(name)
    name = name:lower()
    for _,x in pairs(Players:GetPlayers()) do
        if x ~= Player then
            if x.Name:lower():match("^"..name)
            or x.DisplayName:lower():match("^"..name) then
                return x
            end
        end
    end
end

local function Fling(TargetPlayer)
    if not TargetPlayer or TargetPlayer == Player then return end
    if not TargetPlayer.Character then return end

    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")

    if not RootPart or not TRootPart then return end

    local OldPos = RootPart.CFrame

    local BV = Instance.new("BodyVelocity", RootPart)
    BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
    BV.Velocity = Vector3.new(9e8,9e8,9e8)

    local Base = THead or TRootPart

    for i=1,30 do
        RootPart.CFrame = Base.CFrame * CFrame.new(0,1.5,0)
        RootPart.Velocity = Vector3.new(9e7,9e7,9e7)
        RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        task.wait()
    end

    BV:Destroy()

    repeat
        RootPart.CFrame = OldPos
        task.wait()
    until (RootPart.Position - OldPos.p).Magnitude < 5
end

flingBtn.MouseButton1Click:Connect(function()
    local target = GetPlayer(box.Text)
    if target then
        Fling(target)
    end
end)

allBtn.MouseButton1Click:Connect(function()
    for _,plr in pairs(Players:GetPlayers()) do
        task.spawn(function()
            Fling(plr)
        end)
    end
end)
