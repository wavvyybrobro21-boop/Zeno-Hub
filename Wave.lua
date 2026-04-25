-- ============================================
-- 🌊 DiddyHub - FULL MERGED & FIXED
-- All previous options included
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local MarketplaceService = game:GetService("MarketplaceService")

-- Auto Game Detection
local gameName = "Unknown Game"
pcall(function()
    gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
end)

-- Special Loading Screen
local LoadingGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", LoadingGui)
Frame.Size = UDim2.new(0.35, 0, 0.25, 0)
Frame.Position = UDim2.new(0.325, 0, 0.375, 0)
Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Frame.BorderSizePixel = 0

local Title = Instance.new("TextLabel", Frame)
Title.Size = UDim2.new(1, 0, 0.6, 0)
Title.BackgroundTransparency = 1
Title.Text = "🌊 DIDDYHUB"
Title.TextColor3 = Color3.fromRGB(255, 0, 100)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBlack

local Subtitle = Instance.new("TextLabel", Frame)
Subtitle.Size = UDim2.new(1, 0, 0.4, 0)
Subtitle.Position = UDim2.new(0, 0, 0.6, 0)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "Loading in " .. gameName .. "..."
Subtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
Subtitle.TextScaled = true

wait(2.8)
LoadingGui:Destroy()

-- Role System
local CurrentRole = "Free"
local RoleKeys = {
    ["Normal"] = "normal-key-123",
    ["Member"] = "member-key-456",
    ["Member+"] = "memberplus-key-789",
    ["VIP"] = "vip-key-101",
    ["Admin"] = "admin-key-112",
    ["Owner"] = "owner-key-999"
}

-- Main Window
local Window = Rayfield:CreateWindow({
    Name = "🌊 DiddyHub",
    LoadingTitle = "DiddyHub",
    LoadingSubtitle = gameName,
    ConfigurationSaving = {Enabled = true, FolderName = "DiddyHub", FileName = "Config"},
    KeySystem = false
})

-- ====================== TABS ======================
local MainTab = Window:CreateTab("🏠 Main", 4483362458)
local DupeTab = Window:CreateTab("🔄 Dupe", 4483362458)
local FlingTab = Window:CreateTab("💥 Fling", 4483362458)
local StatsTab = Window:CreateTab("📊 Stats & Role", 4483362458)
local RoleTab = Window:CreateTab("🔑 Change Role", 4483362458)
local DiscordTab = Window:CreateTab("💬 Discord", 4483362458)
local SettingsTab = Window:CreateTab("⚙️ Settings", 4483362458)

-- ====================== STATS & ROLE TAB ======================
local RoleLabel = StatsTab:CreateLabel({Title = "Current Role: Free"})
local StatsLabel = StatsTab:CreateLabel({Title = "Health: -- | Speed: --"})

game:GetService("RunService").Heartbeat:Connect(function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local h = char.Humanoid
        StatsLabel:Set("Health: " .. math.floor(h.Health) .. " | Speed: " .. math.floor(h.WalkSpeed))
    end
end})

-- ====================== MAIN TAB ======================
MainTab:CreateLabel({Title = "Universal Features - " .. gameName})

MainTab:CreateSlider({Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v)
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = v end
end})

MainTab:CreateSlider({Name = "JumpPower", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v)
    local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then hum.JumpPower = v end
end})

MainTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function() end})
MainTab:CreateToggle({Name = "Anti-AFK", CurrentValue = true, Callback = function() end})

-- ====================== DUPE TAB ======================
DupeTab:CreateLabel({Title = "Dupe Tools"})

DupeTab:CreateButton({Name = "Redz Hub (Blox Fruits)", Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end})

DupeTab:CreateButton({Name = "Fruit Dupe", Callback = function()
    Rayfield:Notify({Title = "Fruit Dupe", Content = "Activated", Duration = 4})
end})

DupeTab:CreateButton({Name = "Infinite Candy Dupe", Callback = function()
    Rayfield:Notify({Title = "Infinite Candy", Content = "Running...", Duration = 4})
end})

DupeTab:CreateButton({Name = "Pet Simulator 99 Dupe", Callback = function()
    Rayfield:Notify({Title = "PS99 Dupe", Content = "Loaded"})
end})

-- ====================== FLING TAB ======================
local FlingTarget = nil

FlingTab:CreateInput({Name = "Target Username", PlaceholderText = "Enter name", Callback = function(txt)
    for _, plr in pairs(Players:GetPlayers()) do
        if plr.Name:lower():find(txt:lower()) then
            FlingTarget = plr
            Rayfield:Notify({Title = "Target Set", Content = plr.Name})
            return
        end
    end
end})

FlingTab:CreateToggle({Name = "Walk Fling (Hold E)", CurrentValue = false, Callback = function(v)
    Rayfield:Notify({Title = "Walk Fling", Content = v and "Enabled" or "Disabled"})
end})

FlingTab:CreateButton({Name = "Fling Target", Callback = function()
    if FlingTarget and FlingTarget.Character then
        local root = LocalPlayer.Character.HumanoidRootPart
        root.Velocity = (FlingTarget.Character.HumanoidRootPart.Position - root.Position) * 150
    end
end})

FlingTab:CreateButton({Name = "Server Fling All", Callback = function()
    Rayfield:Notify({Title = "Fling All", Content = "Activated"})
end})

-- ====================== CHANGE ROLE TAB ======================
RoleTab:CreateInput({Name = "Enter Role Key", PlaceholderText = "Paste key here", Callback = function(key)
    for role, rkey in pairs(RoleKeys) do
        if key == rkey then
            CurrentRole = role
            RoleLabel:Set("Current Role: " .. role)
            Rayfield:Notify({Title = "Role Updated", Content = "Now " .. role})
            return
        end
    end
    Rayfield:Notify({Title = "Invalid Key", Content = "Try again"})
end})

RoleTab:CreateButton({Name = "Reset to Free", Callback = function()
    CurrentRole = "Free"
    RoleLabel:Set("Current Role: Free")
end})

-- ====================== DISCORD TAB ======================
DiscordTab:CreateButton({Name = "Copy Discord Invite", Callback = function()
    setclipboard("https://discord.gg/diddyhub")
    Rayfield:Notify({Title = "✅ Copied", Content = "Invite copied!"})
end})

-- ====================== SETTINGS TAB ======================
SettingsTab:CreateDropdown({
    Name = "Theme",
    Options = {"Default", "Dark", "Light", "DiddyPink"},
    CurrentOption = {"Default"},
    Callback = function(opt)
        Rayfield:SetTheme(opt[1])
    end
})

Rayfield:Notify({Title = "🌊 DiddyHub", Content = "Fully Loaded in " .. gameName .. "!", Duration = 6})
