loadstring([[ 
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

local Window = Rayfield:CreateWindow({
    Name = "DiddyHub 🌊",
    LoadingTitle = "DiddyHub",
    LoadingSubtitle = "Universal Exploit Hub",
    ConfigurationSaving = {Enabled = true, FolderName = "DiddyHub", FileName = "Config"},
    Discord = {Enabled = true, Invite = "discord.gg/diddyhub"},
    KeySystem = false
})

-- Special Load Screen
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local LoadFrame = Instance.new("Frame", LoadingGui)
LoadFrame.Size = UDim2.new(0.35, 0, 0.25, 0)
LoadFrame.Position = UDim2.new(0.325, 0, 0.375, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadFrame.BorderSizePixel = 0

local LoadTitle = Instance.new("TextLabel", LoadFrame)
LoadTitle.Size = UDim2.new(1, 0, 0.5, 0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DIDDYHUB"
LoadTitle.TextColor3 = Color3.fromRGB(255, 0, 100)
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBold

local LoadSubtitle = Instance.new("TextLabel", LoadFrame)
LoadSubtitle.Size = UDim2.new(1, 0, 0.3, 0)
LoadSubtitle.Position = UDim2.new(0, 0, 0.5, 0)
LoadSubtitle.BackgroundTransparency = 1
LoadSubtitle.Text = "Loading powerful tools..."
LoadSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadSubtitle.TextScaled = true

wait(2.8)
LoadingGui:Destroy()

-- Variables
local CurrentRole = "Free"
local FlingTarget = nil

-- Auto Game Detection
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
Rayfield:Notify({Title = "DiddyHub", Content = "Detected Game: " .. gameName, Duration = 5})

-- ==================== TABS ====================
local MainTab = Window:CreateTab("Main", 4483362458)
local DupeTab = Window:CreateTab("Dupe", 4483362458)
local FlingTab = Window:CreateTab("Fling", 4483362458)
local StatsTab = Window:CreateTab("Stats & Role", 4483362458)
local RoleTab = Window:CreateTab("Change Role", 4483362458)
local DiscordTab = Window:CreateTab("Discord", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- ====================== MAIN TAB ======================
MainTab:CreateLabel({Title = "Universal Features - " .. gameName})

MainTab:CreateButton({Name = "Infinite Yield", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end})

MainTab:CreateToggle({Name = "Anti-AFK", CurrentValue = true, Callback = function(v) end})

MainTab:CreateSlider({Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = v
    end
end})

MainTab:CreateSlider({Name = "JumpPower", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = v
    end
end})

MainTab:CreateButton({Name = "Fly (F to toggle)", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nebula-Scripts/Script/main/Fly'))()
end})

-- ====================== DUPE TAB ======================
DupeTab:CreateLabel({Title = "🟠 Blox Fruits Dupes"})
DupeTab:CreateButton({Name = "🔥 Redz Hub (Full)", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end})
DupeTab:CreateButton({Name = "🍭 Ronix Inf Candy + Eggs", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RonixHub/BloxFruits/main/Dupe"))()
end})
DupeTab:CreateButton({Name = "🍎 Fruit Dupe", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/A1ex-0n/BloxFruits-Dupe/main/FruitDupe"))()
end})
DupeTab:CreateButton({Name = "🍬 Infinite Candy Only", Callback = function()
    for i = 1, 25 do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candy", "Buy", 1)
        wait(0.1)
    end
end})
DupeTab:CreateButton({Name = "🥚 Eggs + Fruit Combo", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RonixHub/BloxFruits/main/EggFruitCombo"))()
end})
DupeTab:CreateButton({Name = "🧪 Auto Farm + Dupe", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HoHoHub/BloxFruits/main/HoHo"))()
end})

DupeTab:CreateLabel({Title = "Other Games Dupes"})
DupeTab:CreateButton({Name = "Pet Simulator 99 Huge Dupe", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vincentsss1/PETSIM99/main/DUPENEWMETHOD"))()
end})
DupeTab:CreateButton({Name = "Adopt Me Pet Dupe", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VarietyHubOwner/AdoptmeVarietyHub/refs/heads/main/VarietyHub0.1"))()
end})
DupeTab:CreateButton({Name = "Brookhaven Dupe", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end})

-- ====================== FLING TAB ======================
FlingTab:CreateLabel({Title = "Fling Tools"})

FlingTab:CreateInput({Name = "Target Player", PlaceholderText = "Username", Callback = function(txt)
    for _, plr in ipairs(game.Players:GetPlayers()) do
        if plr.Name:lower():find(txt:lower()) then
            FlingTarget = plr
            Rayfield:Notify({Title = "Target Set", Content = plr.Name})
            return
        end
    end
end})

FlingTab:CreateToggle({Name = "Walk Fling (Hold E)", CurrentValue = false, Callback = function() end})

FlingTab:CreateButton({Name = "Fling Target", Callback = function()
    if FlingTarget and FlingTarget.Character and FlingTarget.Character:FindFirstChild("HumanoidRootPart") then
        local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            root.Velocity = (FlingTarget.Character.HumanoidRootPart.Position - root.Position) * 150
        end
    end
end})

FlingTab:CreateButton({Name = "Server Fling All", Callback = function()
    local root = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if root then
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= game.Players.LocalPlayer then
                spawn(function()
                    root.Velocity = Vector3.new(math.random(-500,500), 200, math.random(-500,500))
                end)
            end
        end
    end
end})

-- ====================== STATS TAB ======================
local RoleLabel = StatsTab:CreateLabel({Title = "Current Role: " .. CurrentRole})
local StatsLabel = StatsTab:CreateLabel({Title = "Health: -- | Speed: --"})

game:GetService("RunService").Heartbeat:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        StatsLabel:Set("Health: " .. math.floor(hum.Health) .. " | Speed: " .. math.floor(hum.WalkSpeed))
    end
end})

-- ====================== ROLE TAB ======================
RoleTab:CreateLabel({Title = "Enter Role Key"})
RoleTab:CreateInput({Name = "Role Key", PlaceholderText = "Paste key here", Callback = function(key)
    local keys = {
        ["normal-key-123"] = "Normal",
        ["member-key-456"] = "Member",
        ["memberplus-key-789"] = "Member+",
        ["vip-key-101"] = "VIP",
        ["admin-key-112"] = "Admin",
        ["owner-key-999"] = "Owner"
    }
    if keys[key] then
        CurrentRole = keys[key]
        RoleLabel:Set("Current Role: " .. CurrentRole)
        Rayfield:Notify({Title = "Success", Content = "Role changed to " .. CurrentRole})
    else
        Rayfield:Notify({Title = "Error", Content = "Invalid Key"})
    end
end})

-- ====================== DISCORD & SETTINGS ======================
DiscordTab:CreateButton({Name = "Copy Discord Invite", Callback = function()
    setclipboard("https://discord.gg/diddyhub")
    Rayfield:Notify({Title = "Copied!", Content = "Invite copied"})
end})

SettingsTab:CreateDropdown({Name = "Theme", Options = {"Default", "Dark", "Light", "DiddyPink"}, CurrentOption = {"Default"}, Callback = function(opt)
    Rayfield:SetTheme(opt[1])
end})

SettingsTab:CreateButton({Name = "Destroy GUI", Callback = function()
    Window:Destroy()
end})

Rayfield:Notify({Title = "DiddyHub", Content = "Successfully Loaded! Enjoy all games", Duration = 6})
]])()
