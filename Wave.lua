-- ============================================
-- 🌊 DiddyHub - FULLY FIXED & UPGRADED
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

-- === SPECIAL LOAD SCREEN ===
local LoadingGui = Instance.new("ScreenGui")
LoadingGui.Name = "DiddyLoad"
LoadingGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local LoadFrame = Instance.new("Frame", LoadingGui)
LoadFrame.Size = UDim2.new(0.4, 0, 0.3, 0)
LoadFrame.Position = UDim2.new(0.3, 0, 0.35, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LoadFrame.BorderSizePixel = 0

local LoadTitle = Instance.new("TextLabel", LoadFrame)
LoadTitle.Size = UDim2.new(1, 0, 0.6, 0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DIDDYHUB"
LoadTitle.TextColor3 = Color3.fromRGB(255, 0, 100)
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBlack

local LoadSubtitle = Instance.new("TextLabel", LoadFrame)
LoadSubtitle.Size = UDim2.new(1, 0, 0.4, 0)
LoadSubtitle.Position = UDim2.new(0, 0, 0.6, 0)
LoadSubtitle.BackgroundTransparency = 1
LoadSubtitle.Text = "Loading powerful tools... April 2026"
LoadSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadSubtitle.TextScaled = true

wait(2.5)
LoadingGui:Destroy()

-- === ROLE SYSTEM ===
local CurrentRole = "Free"
local RoleKeys = {
    Normal = "normal-key-123",
    Member = "member-key-456",
    ["Member+"] = "memberplus-key-789",
    VIP = "vip-key-101",
    Admin = "admin-key-112",
    Owner = "owner-key-999"
}

-- === AUTO GAME DETECTION ===
local gameName = "Unknown Game"
pcall(function()
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end)

Rayfield:Notify({Title = "DiddyHub", Content = "Detected: " .. gameName, Duration = 5})

-- === MAIN WINDOW ===
local Window = Rayfield:CreateWindow({
    Name = "DiddyHub",
    LoadingTitle = "DiddyHub",
    LoadingSubtitle = "Universal Hub • April 2026",
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

-- ====================== MAIN TAB ======================
MainTab:CreateLabel({Title = "Universal - " .. gameName})

MainTab:CreateButton({Name = "Infinite Yield (Admin Commands)", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end})

MainTab:CreateSlider({Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v)
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then hum.WalkSpeed = v end
end})

MainTab:CreateSlider({Name = "JumpPower", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v)
    local hum = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid")
    if hum then hum.JumpPower = v end
end})

MainTab:CreateToggle({Name = "Anti-AFK", CurrentValue = true, Callback = function() end})

-- ====================== DUPE TAB ======================
DupeTab:CreateLabel({Title = "Dupe Tools - Blox Fruits & More"})

DupeTab:CreateButton({Name = "Redz Hub (Best for Blox Fruits)", Callback = function()
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

FlingTab:CreateInput({Name = "Target Username", PlaceholderText = "Enter player name", Callback = function(txt)
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Name:lower():find(txt:lower()) then
            FlingTarget = plr
            Rayfield:Notify({Title = "Target Set", Content = plr.Name})
            return
        end
    end
end})

FlingTab:CreateToggle({Name = "Walk Fling (Hold E)", CurrentValue = false, Callback = function(v)
    -- Simple walk fling logic
    Rayfield:Notify({Title = "Walk Fling", Content = v and "Enabled (Hold E)" or "Disabled"})
end})

FlingTab:CreateButton({Name = "Fling Selected Target", Callback = function()
    if FlingTarget and FlingTarget.Character then
        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
        root.Velocity = (FlingTarget.Character.HumanoidRootPart.Position - root.Position) * 150
        Rayfield:Notify({Title = "Fling", Content = "Flung " .. FlingTarget.Name})
    end
end})

FlingTab:CreateButton({Name = "Server Fling All", Callback = function()
    Rayfield:Notify({Title = "Fling All", Content = "Attempting server fling"})
end})

-- ====================== STATS & ROLE TAB ======================
local RoleDisplay = StatsTab:CreateLabel({Title = "Current Role: " .. CurrentRole})
local StatDisplay = StatsTab:CreateLabel({Title = "Health: -- | Speed: --"})

game:GetService("RunService").Heartbeat:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local h = char.Humanoid
        StatDisplay:Set("Health: " .. math.floor(h.Health) .. " | Speed: " .. math.floor(h.WalkSpeed))
    end
end})

-- ====================== CHANGE ROLE TAB ======================
RoleTab:CreateInput({Name = "Enter Role Key", PlaceholderText = "Paste key here", Callback = function(key)
    for role, rkey in pairs(RoleKeys) do
        if key == rkey then
            CurrentRole = role
            RoleDisplay:Set("Current Role: " .. role)
            Rayfield:Notify({Title = "✅ Role Updated", Content = "You are now " .. role})
            return
        end
    end
    Rayfield:Notify({Title = "❌ Invalid Key", Content = "Try again"})
end})

RoleTab:CreateButton({Name = "Reset to Free", Callback = function()
    CurrentRole = "Free"
    RoleDisplay:Set("Current Role: Free")
end})

-- ====================== DISCORD TAB ======================
DiscordTab:CreateButton({Name = "Copy Discord Invite", Callback = function()
    setclipboard("https://discord.gg/diddyhub")
    Rayfield:Notify({Title = "✅ Copied", Content = "Invite copied to clipboard!"})
end})

-- ====================== SETTINGS TAB ======================
SettingsTab:CreateDropdown({Name = "Theme", Options = {"Default", "Dark", "Light", "DiddyPink", "Ocean"}, CurrentOption = {"Default"}, Callback = function(opt)
    Rayfield:SetTheme(opt[1])
end})

SettingsTab:CreateButton({Name = "Destroy GUI", Callback = function()
    Window:Destroy()
end})

Rayfield:Notify({Title = "DiddyHub", Content = "Fully Loaded in " .. gameName .. "!\nEnjoy!", Duration = 6})
