--// GUI
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "KatovnFling"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 220, 0, 120)
frame.Position = UDim2.new(0.5, -110, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(20,20,20)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.Text = "Fling All • by KatovnHub"
title.BackgroundTransparency = 1
title.TextColor3 = Color3.fromRGB(255,215,0)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1,-20,0,50)
button.Position = UDim2.new(0,10,0,50)
button.Text = "FLING ALL"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.BackgroundColor3 = Color3.fromRGB(255,170,0)
button.TextColor3 = Color3.new(0,0,0)

----------------------------------------------------
-- ENGINE FLING (code của bạn)
----------------------------------------------------

local Targets = {"All"}
local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    end
end

local Message = function(t,x,d)
    game:GetService("StarterGui"):SetCore("SendNotification",{Title=t,Text=x,Duration=d})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    if not TargetPlayer.Character or not RootPart then return end

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    if not THumanoid then return end

    local TRootPart = THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle

    if Accessory and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    local function FPos(BasePart,Pos,Ang)
        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
        RootPart.Velocity = Vector3.new(9e7,9e7*10,9e7)
        RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
    end

    local function SF(BasePart)
        local Time=tick()
        repeat
            FPos(BasePart,CFrame.new(0,1.5,0),CFrame.Angles(math.rad(90),0,0))
            task.wait()
        until tick()>Time+1
    end

    workspace.FallenPartsDestroyHeight = 0/0

    local BV=Instance.new("BodyVelocity",RootPart)
    BV.Velocity=Vector3.new(9e8,9e8,9e8)
    BV.MaxForce=Vector3.new(1/0,1/0,1/0)

    if TRootPart then SF(TRootPart)
    elseif THead then SF(THead)
    elseif Handle then SF(Handle) end

    BV:Destroy()
    workspace.CurrentCamera.CameraSubject=Humanoid

    repeat
        RootPart.CFrame=getgenv().OldPos
        task.wait()
    until (RootPart.Position-getgenv().OldPos.p).Magnitude<25
end

----------------------------------------------------
-- BUTTON ACTION
----------------------------------------------------

button.MouseButton1Click:Connect(function()
    Message("KatovnHub","Flinging everyone...",3)

    for _,p in pairs(Players:GetPlayers()) do
        if p~=Player then
            SkidFling(p)
        end
    end
end)
