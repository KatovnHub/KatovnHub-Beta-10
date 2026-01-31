-- KatovnHub | True Spin Fling

local Players = game:GetService("Players")
local lp = Players.LocalPlayer

local function spinFling(target)
    if target == lp then return end
    if not lp.Character or not target.Character then return end

    local root = lp.Character:FindFirstChild("HumanoidRootPart")
    local troot = target.Character:FindFirstChild("HumanoidRootPart")
    if not root or not troot then return end

    local oldCF = root.CFrame

    local bav = Instance.new("BodyAngularVelocity")
    bav.MaxTorque = Vector3.new(1e8,1e8,1e8)
    bav.AngularVelocity = Vector3.new(5000,5000,5000)
    bav.Parent = root

    local bv = Instance.new("BodyVelocity")
    bv.MaxForce = Vector3.new(1e8,1e8,1e8)
    bv.Velocity = Vector3.new(0,200,0)
    bv.Parent = root

    for i = 1,180 do
        root.CFrame = troot.CFrame
        task.wait()
    end

    bav:Destroy()
    bv:Destroy()

    root.AssemblyLinearVelocity = Vector3.zero
    root.AssemblyAngularVelocity = Vector3.zero
    root.CFrame = oldCF
end
