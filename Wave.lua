loadstring([[ 
-- ====================== DIDDYHUB + WAVE HUB ======================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

local Window = Rayfield:CreateWindow({
    Name = "DiddyHub 🌊 | Wave",
    LoadingTitle = "DiddyHub + Wave",
    LoadingSubtitle = "Universal Hub",
    ConfigurationSaving = {Enabled = true, FolderName = "DiddyHub", FileName = "Config"},
    Discord = {Enabled = true, Invite = "discord.gg/diddyhub"},
    KeySystem = false
})

-- Special Load Screen
local LoadingGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local LoadFrame = Instance.new("Frame", LoadingGui)
LoadFrame.Size = UDim2.new(0.35,0,0.25,0); LoadFrame.Position = UDim2.new(0.325,0,0.375,0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
local LoadTitle = Instance.new("TextLabel", LoadFrame); LoadTitle.Size = UDim2.new(1,0,0.5,0); LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DIDDYHUB 🌊"; LoadTitle.TextColor3 = Color3.fromRGB(255,0,100); LoadTitle.TextScaled = true; LoadTitle.Font = Enum.Font.GothamBold
local LoadSub = Instance.new("TextLabel", LoadFrame); LoadSub.Size = UDim2.new(1,0,0.3,0); LoadSub.Position = UDim2.new(0,0,0.5,0)
LoadSub.BackgroundTransparency = 1; LoadSub.Text = "Loading DiddyHub + Wave..."; LoadSub.TextColor3 = Color3.fromRGB(255,255,255); LoadSub.TextScaled = true
wait(2.8); LoadingGui:Destroy()

-- Auto Game Detection
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
Rayfield:Notify({Title = "DiddyHub", Content = "Detected: " .. gameName, Duration = 5})

-- ====================== YOUR DIDDYHUB TABS ======================
local MainTab = Window:CreateTab("Main", 4483362458)
local DupeTab = Window:CreateTab("Dupe", 4483362458)
local FlingTab = Window:CreateTab("Fling", 4483362458)
local StatsTab = Window:CreateTab("Stats", 4483362458)
local RoleTab = Window:CreateTab("Roles", 4483362458)
local DiscordTab = Window:CreateTab("Discord", 4483362458)

-- Main
MainTab:CreateButton({Name = "Infinite Yield", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end})
MainTab:CreateSlider({Name = "WalkSpeed", Range = {16,500}, CurrentValue = 16, Callback = function(v) local h = game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") if h then h.WalkSpeed = v end end})
MainTab:CreateButton({Name = "Fly (F)", Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/Nebula-Scripts/Script/main/Fly'))() end})

-- Blox Fruits Dupes
DupeTab:CreateLabel({Title = "Blox Fruits Dupes"})
DupeTab:CreateButton({Name = "Redz Hub", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))() end})
DupeTab:CreateButton({Name = "Ronix Inf Candy + Eggs", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/RonixHub/BloxFruits/main/Dupe"))() end})
DupeTab:CreateButton({Name = "Fruit Dupe", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/A1ex-0n/BloxFruits-Dupe/main/FruitDupe"))() end})
DupeTab:CreateButton({Name = "Auto Farm + Dupe", Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/HoHoHub/BloxFruits/main/HoHo"))() end})

-- Fling
local target = nil
FlingTab:CreateInput({Name = "Target", PlaceholderText = "Username", Callback = function(t) 
    for _,p in game.Players:GetPlayers() do if p.Name:lower():find(t:lower()) then target = p; Rayfield:Notify({Title="Target", Content=p.Name}) end end 
end})
FlingTab:CreateButton({Name = "Fling Target", Callback = function()
    if target and target.Character then
        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
        root.Velocity = (target.Character.HumanoidRootPart.Position - root.Position) * 150
    end
end})
FlingTab:CreateButton({Name = "Server Fling All", Callback = function()
    local root = game.Players.LocalPlayer.Character.HumanoidRootPart
    for _,p in game.Players:GetPlayers() do if p ~= game.Players.LocalPlayer then spawn(function() root.Velocity = Vector3.new(math.random(-500,500),200,math.random(-500,500)) end) end end
end})

-- Stats + Role
local CurrentRole = "Free"
StatsTab:CreateLabel({Title = "Role: " .. CurrentRole})
local statLabel = StatsTab:CreateLabel({Title = "Health: -- | Speed: --"})
game:GetService("RunService").Heartbeat:Connect(function()
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then statLabel:Set("Health: "..math.floor(hum.Health).." | Speed: "..math.floor(hum.WalkSpeed)) end
end})

RoleTab:CreateInput({Name = "Role Key", PlaceholderText = "Paste key", Callback = function(k)
    local keys = {["normal-key-123"]="Normal",["member-key-456"]="Member",["vip-key-101"]="VIP",["owner-key-999"]="Owner"}
    for key,r in pairs(keys) do if k == key then CurrentRole = r; Rayfield:Notify({Title="Role Updated", Content=r}) end end
end})

DiscordTab:CreateButton({Name = "Copy Invite", Callback = function() setclipboard("https://discord.gg/diddyhub") end})

-- ====================== LOAD WAVE HUB ======================
Rayfield:Notify({Title = "Loading Wave Hub", Content = "Connecting
