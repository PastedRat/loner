--// DECOMPILED BY SIFT
--// site: siftrblx.com || https://discord.gg/8BmPkvJbAQ
function ohYEAHHHH()
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ModuleLoader = require(game:GetService("ReplicatedStorage").Modules.Shared.ModuleLoader)
local signal = ModuleLoader:Load("Signal")
local crosshairManager = ModuleLoader:Load("CrosshairManager")
local Players = game:GetService("Players")
local v4 = nil
local network = ModuleLoader:Load("Network")
return {
    Modules = {},
    OnNewProjectile = signal.New(),
    ProjectileUpdated = signal.New(),
    ProjectileUpdatedS = signal.New(),
    New = function(a1, a2)
        if a2.Stats.Type then
            if a1.Modules[a2.Stats.Type] then
                a2.Type = a2.Stats.Type
                if not a2.FromServer then
                    a2.Id = `{tick()}_{Players.LocalPlayer.UserId}`
                    a2.CreatedAt = os.time()
                    a2.CreatedAtServer = workspace:GetServerTimeNow()
                    if not a2.Origin then
                        a2.Origin = workspace.CurrentCamera.CFrame.Position
                    end
                    if a2.ForceDown then
                        a2.HitVector = Vector3.new(0, -10000, 0) + workspace.CurrentCamera.CFrame.Position
                    elseif not a2.ForceHitVector then
                    end
                    if a2.Stats.Type == "Dynamite" then
                        local FuseTime = a2.FuseTime or math.random(60, 70) / 10
                        a2.FuseTime = FuseTime
                        FuseTime = a2.IsDud or a1.Modules[a2.Stats.Type](a2)
                        a2.IsDud = FuseTime
                        if not a2.DudsAt then
                            if a2.IsDud then
                                FuseTime = a2.DudsAt or math.random(30, 60) / 10
                            end
                        end
                        a2.DudsAt = a2.DudsAt or math.random(30, 60) / 10
                    elseif a2.Stats.Type == "DynamiteBundle" then
                        local FuseTime = a2.FuseTime or math.random(90, 120) / 10
                    end
                elseif typeof(a2.From) == "table" and (a2.From.AIIndex or not v1 or not v1.PrimaryPart) then
                    return
                end
                if not a2.FromServer then
                    a2.SpreadDirections = a1.Modules[a2.Stats.Type](a2)
                    if a2.Stats.Type ~= "Grenade" then
                        network:Fire("Create Projectile", a2)
                    end
                    a1.OnNewProjectile:Fire(a2)
                end
            end
        end
    end,
    Initialize = function(arg)
        v4 = ModuleLoader:Load("AIManagerClient")
        for _, child in pairs(script:GetChildren()) do
            arg.Modules[child.Name] = require(child)
        end
        network:Connect(
            "New Projectile",
            function(arg2)
                    if arg2.From ~= Players.LocalPlayer then
                        arg2.FromServer = true
                        arg:New(arg2)
                    end
                end
        )
        local function callback(arg2)
            if not arg2.Ignored then
                local character = arg2.From.Character or nil
                if character then
                    table.insert({ workspace.Ignored, workspace.CurrentCamera }, character)
                end
                local workspaceItems = { workspace.Ignored, workspace.CurrentCamera }
                arg2.Ignored = workspaceItems
            end
            arg:New(arg2)
        end
        network:ConnectUnreliable("New ProjectileUNR", callback)
        network:Connect(
            "Explosive Did Land",
            function(a1, a2, a3)
                    local Ignored = workspace.Ignored:FindFirstChild(a1)
                    if Ignored then
                        if a2 then
                            Ignored:SetPrimaryPartCFrame(a2.CFrame * a3)
                        end
                    end
                end
        )
        network:Connect(
            "Create Projectile Log",
            function(arg2)
                    arg.OnNewProjectile:Fire(arg2)
                end
        )
        network:Connect(
            "Set Server Return Status",
            function(a1, a2, a3)
                    if a3 then
                        for k, v in pairs(a3) do
                            local v3 = { Status = a2 }
                            v3[k] = v
                        end
                    end
                    arg.ProjectileUpdatedS:Fire(a1, { Status = a2 })
                end
        )
    end,
}
