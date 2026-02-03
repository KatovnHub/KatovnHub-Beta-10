-- =================================
-- FE FLING ALL
-- By KatovnHub
-- Fixed + Clean Version
-- =================================

local Targets = {"All"}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local function GetPlayer(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        table.remove(GetPlayers, table.find(GetPlayers, Player))
        return GetPlayers[math.random(#GetPlayers)]
    else
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name)
                or x.DisplayName:lower():match("^"..Name) then
                    return x
                end
            end
        end
    end
end

local function Message(title, text, time)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = time
    })
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    if not Character then return end

    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart
    if not RootPart then return end

    local TCharacter = TargetPlayer.Character
    if not TCharacter then return end

    local THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter:FindFirstChild("Head")

    local Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    if RootPart.Velocity.Magnitude < 50 then
        getgenv().OldPos = RootPart.CFrame
    end

    workspace.FallenPartsDestroyHeight = 0/0

    local BV = Instance.new("BodyVelocity")
    BV.Name = "KatovnVel"
    BV.Parent = RootPart
    BV.Velocity = Vector3.new(9e8,9e8,9e8)
    BV.MaxForce = Vector3.new(math.huge,math.huge,math.huge)

    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)

    local BasePart = THead or TRootPart or Handle
    if not BasePart then
        Message("KatovnHub","Target invalid",3)
        return
    end

    local Time = tick()

    repeat
        RootPart.CFrame = BasePart.CFrame * CFrame.new(0,1,0)
        RootPart.Velocity = Vector3.new(9e7,9e7,9e7)
        RootPart.RotVelocity = Vector3.new(9e8,9e8,9e8)
        task.wait()
    until tick() > Time + 2

    BV:Destroy()
    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)

    repeat
        RootPart.CFrame = getgenv().OldPos
        task.wait()
    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 5
end

Message("KatovnHub","Fling All Loaded",4)

for _,x in next, Targets do GetPlayer(x) end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        if x ~= Player then
            SkidFling(x)
        end
    end
end
