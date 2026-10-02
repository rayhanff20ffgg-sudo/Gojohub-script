--[[
╔══════════════════════════════════════════════╗
║           G O J O H U B   v8.0               ║
║      Steal An Egg | 🔑 KEY: rayhanzzll       ║
║      Style: Black & White                    ║
║      Telegram: @gojohub                      ║
╚══════════════════════════════════════════════╝
--]]

--============================================================
-- KEY SYSTEM
--============================================================
local VALID_KEY = "rayhanzzll"
local KEY_LINK = "https://t.me/gojohub"
_G.GOJOHUB_KEY_OK = false

local function showKeyGUI()
    local LP = game:GetService("Players").LocalPlayer
    pcall(function()
        local old = LP.PlayerGui:FindFirstChild("GOJOHUB_Key")
        if old then old:Destroy() end
    end)

    local keyGui = Instance.new("ScreenGui")
    keyGui.Name = "GOJOHUB_Key"
    keyGui.ResetOnSpawn = false
    keyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    keyGui.Parent = LP:WaitForChild("PlayerGui")

    local box = Instance.new("Frame")
    box.Size = UDim2.new(0, 360, 0, 240)
    box.Position = UDim2.new(0.5, -180, 0.5, -120)
    box.BackgroundColor3 = Color3.fromRGB(18,18,18)
    box.BorderSizePixel = 0
    box.Parent = keyGui

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0,12)
    bc.Parent = box

    local bs = Instance.new("UIStroke")
    bs.Color = Color3.fromRGB(255,255,255)
    bs.Thickness = 1.5
    bs.Parent = box

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1,0,0,30)
    title.Position = UDim2.new(0,0,0,15)
    title.BackgroundTransparency = 1
    title.Text = "🔑 GOJOHUB KEY"
    title.TextColor3 = Color3.fromRGB(255,255,255)
    title.TextSize = 18
    title.Font = Enum.Font.Code
    title.Parent = box

    local input = Instance.new("TextBox")
    input.Size = UDim2.new(1,-40,0,42)
    input.Position = UDim2.new(0,20,0,65)
    input.BackgroundColor3 = Color3.fromRGB(30,30,30)
    input.BorderSizePixel = 0
    input.Text = ""
    input.PlaceholderText = "Masukkan key..."
    input.PlaceholderColor3 = Color3.fromRGB(100,100,100)
    input.TextColor3 = Color3.fromRGB(255,255,255)
    input.TextSize = 14
    input.Font = Enum.Font.Code
    input.ClearTextOnFocus = false
    input.Parent = box

    local ic = Instance.new("UICorner")
    ic.CornerRadius = UDim.new(0,6)
    ic.Parent = input

    local status = Instance.new("TextLabel")
    status.Size = UDim2.new(1,-40,0,20)
    status.Position = UDim2.new(0,20,0,115)
    status.BackgroundTransparency = 1
    status.Text = ""
    status.TextColor3 = Color3.fromRGB(255,60,60)
    status.TextSize = 11
    status.Font = Enum.Font.Code
    status.Parent = box

    local submit = Instance.new("TextButton")
    submit.Size = UDim2.new(1,-40,0,42)
    submit.Position = UDim2.new(0,20,0,140)
    submit.BackgroundColor3 = Color3.fromRGB(255,255,255)
    submit.Text = "✓ SUBMIT"
    submit.TextColor3 = Color3.fromRGB(10,10,10)
    submit.TextSize = 14
    submit.Font = Enum.Font.Code
    submit.BorderSizePixel = 0
    submit.Parent = box

    local sc = Instance.new("UICorner")
    sc.CornerRadius = UDim.new(0,6)
    sc.Parent = submit

    local getKey = Instance.new("TextButton")
    getKey.Size = UDim2.new(1,-40,0,26)
    getKey.Position = UDim2.new(0,20,0,190)
    getKey.BackgroundColor3 = Color3.fromRGB(30,30,30)
    getKey.Text = "📋 " .. KEY_LINK
    getKey.TextColor3 = Color3.fromRGB(200,200,200)
    getKey.TextSize = 10
    getKey.Font = Enum.Font.Code
    getKey.BorderSizePixel = 0
    getKey.Parent = box

    local gkc = Instance.new("UICorner")
    gkc.CornerRadius = UDim.new(0,6)
    gkc.Parent = getKey

    getKey.MouseButton1Click:Connect(function()
        pcall(function()
            if setclipboard then setclipboard(KEY_LINK) end
        end)
    end)

    submit.MouseButton1Click:Connect(function()
        if input.Text == VALID_KEY then
            status.Text = "✓ Key valid!"
            status.TextColor3 = Color3.fromRGB(100,255,100)
            _G.GOJOHUB_KEY_OK = true
            task.wait(0.5)
            keyGui:Destroy()
        else
            status.Text = "✗ Key salah!"
            status.TextColor3 = Color3.fromRGB(255,60,60)
            input.Text = ""
        end
    end)
end

if not _G.GOJOHUB_KEY_OK then
    showKeyGUI()
    local t = 0
    while not _G.GOJOHUB_KEY_OK and t < 600 do
        task.wait(0.1)
        t = t + 1
    end
end

if not _G.GOJOHUB_KEY_OK then
    warn("[GOJOHUB] Key invalid, script berhenti.")
    return
end

--============================================================
-- LOAD SCRIPT UTAMA
--============================================================
loadstring(game:HttpGet("https://raw.githubusercontent.com/ThanhDuyHub/Game/refs/heads/main/Steal-An-Egg-V2.lua"))()

--============================================================
-- OPTIMASI
--============================================================
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local Terrain = workspace:FindFirstChildOfClass("Terrain")

settings().Rendering.QualityLevel = Enum.QualityLevel.Level0
settings().Rendering.EditQualityLevel = Enum.QualityLevel.Level0
settings().Rendering.MeshPartDetailLevel = Enum.MeshPartDetailLevel.Level0
settings().Rendering.TextureQualityEnum = Enum.TextureQualitySetting.None
settings().Rendering.ShadowsEnabled = false
settings().Physics.VisualThrottle = Enum.ThrottleBehavior.Default
settings().Network.IncomingReplicationLag = 0

pcall(function()
    sethiddenproperty(Lighting, "Technology", Enum.Technology.Compatibility)
end)

Lighting.GlobalShadows = false
Lighting.Brightness = 1
Lighting.FogEnd = 100000
Lighting.FogStart = 0
Lighting.EnvironmentSpecularScale = 0
Lighting.EnvironmentDiffuseScale = 0
Lighting.ShadowSoftness = 0
Lighting.Ambient = Color3.fromRGB(128,128,128)
Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)

for _, v in pairs(Lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("Sky") or v:IsA("Atmosphere") or v:IsA("BloomEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("FireEffect") then
        v:Destroy()
    end
end

if Terrain then
    Terrain.WaterWaveSize = 0
    Terrain.WaterWaveSpeed = 0
    Terrain.WaterReflectance = 0
    Terrain.WaterTransparency = 1
    Terrain.WaterColor = Color3.fromRGB(128,128,128)
end

local function destroyEffects(obj)
    if obj:IsA("Trail") or obj:IsA("Beam") or obj:IsA("ParticleEmitter") then
        obj:Destroy(); return true
    end
    if obj:IsA("Fire") or obj:IsA("Smoke") or obj:IsA("Sparkles") or obj:IsA("Explosion") then
        obj:Destroy(); return true
    end
    if obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
        obj:Destroy(); return true
    end
    if obj:IsA("Decal") or obj:IsA("Texture") then
        obj:Destroy(); return true
    end
    if obj:IsA("SpecialMesh") or obj:IsA("DataModelMesh") then
        obj:Destroy(); return true
    end
    if obj:IsA("Sound") then
        obj:Destroy(); return true
    end
    if obj:IsA("BillboardGui") or obj:IsA("SurfaceGui") then
        obj:Destroy(); return true
    end
    return false
end

local function cleanPart(obj)
    if obj:IsA("BasePart") then
        obj.Material = Enum.Material.SmoothPlastic
        obj.Reflectance = 0
        obj.CastShadow = false
        pcall(function()
            obj.TopSurface = Enum.SurfaceType.Smooth
            obj.BottomSurface = Enum.SurfaceType.Smooth
        end)
    end
    destroyEffects(obj)
end

local function removeModel(obj)
    if obj:IsA("Model") or obj:IsA("Folder") then
        local name = obj.Name:lower()
        local keywords = {"tree","plant","grass","leaves","bush","flower","prop","rock","debris","particle","vfx","fx","effect","light","fire","smoke","sparkle","explosion","trail","beam","decor"}
        for _, key in ipairs(keywords) do
            if name:find(key) then
                obj:Destroy(); return true
            end
        end
    end
    return false
end

for _, v in pairs(workspace:GetDescendants()) do
    if not v:IsDescendantOf(Players.LocalPlayer and Players.LocalPlayer.Character or nil) then
        removeModel(v)
    end
end

for _, v in pairs(workspace:GetDescendants()) do
    if v.Parent then cleanPart(v) end
end

workspace.DescendantAdded:Connect(function(v)
    task.defer(function()
        if v.Parent then
            removeModel(v)
            cleanPart(v)
        end
    end)
end)

if Terrain then
    Terrain.DescendantAdded:Connect(function(v)
        v:Destroy()
    end)
end

local function onCharacter(char)
    char:WaitForChild("Humanoid", 10)
    for _, v in pairs(char:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SpotLight") then
            v:Destroy()
        end
    end
    char.DescendantAdded:Connect(function(v)
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") or v:IsA("PointLight") or v:IsA("SpotLight") then
            v:Destroy()
        end
    end)
end

local localPlayer = Players.LocalPlayer
if localPlayer.Character then onCharacter(localPlayer.Character) end
localPlayer.CharacterAdded:Connect(onCharacter)

for _, v in pairs(Players:GetPlayers()) do
    if v ~= localPlayer and v.Character then
        for _, d in pairs(v.Character:GetDescendants()) do
            if d:IsA("ParticleEmitter") or d:IsA("Trail") or d:IsA("Beam") or d:IsA("Fire") or d:IsA("Smoke") or d:IsA("Sparkles") then
                d:Destroy()
            end
        end
    end
end

pcall(function()
    game:GetService("StarterGui"):SetCore("ParticlesDisabled", true)
end)

print("✅ GOJOHUB v8.0 loaded — Key: rayhanzzll")
