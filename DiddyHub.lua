-- DiddyHub - Multi-Game Universal Hub with Rayfield UI
-- Made for executors like Delta, Solara, Wave, Fluxus, etc.
-- Auto-detects game and loads relevant features
-- Paste this entire script into your executor

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "DiddyHub",
    LoadingTitle = "DiddyHub Loading...",
    LoadingSubtitle = "Universal Exploit Hub - By Grok",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "DiddyHubConfigs",
        FileName = "DiddyHub"
    },
    Discord = {
        Enabled = true,
        Invite = "https://discord.gg/yourserver", -- Replace with real Discord if needed
        RememberJoins = true
    },
    KeySystem = false -- Set to true if you want a key system
})

-- Special Load-in Screen / Intro
Rayfield:Notify({
    Title = "Welcome to DiddyHub",
    Content = "The ultimate multi-game hub. Auto-detecting game...",
    Duration = 5,
    Image = 4483362458 -- Example icon
})

-- Role System (Simple key-based)
local CurrentRole = "Normal" -- Default
local RoleKeys = {
    ["Member"] = "memberkey123",
    ["Member+"] = "memberpluskey456",
    ["VIP"] = "vipkey789",
    ["Admin"] = "adminkey101112",
    ["Owner"] = "ownerkey131415"
}

-- Auto-detect game
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local lowerGameName = string.lower(gameName)

Rayfield:Notify({
    Title = "Game Detected",
    Content = "Playing: " .. gameName,
    Duration = 4
})

-- Main Tabs
local MainTab = Window:CreateTab("Home", 4483362458)
local StatsTab = Window:CreateTab("Player Stats", 4483362458)
local FlingTab = Window:CreateTab("Fling", 4483362458)
local DupeTab = Window:CreateTab("Dupes & Scripts", 4483362458)
local RolesTab = Window:CreateTab("Roles", 4483362458)
local UniversalTab = Window:CreateTab("Universal", 4483362458)
local DiscordTab = Window:CreateTab("Discord", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- Home Tab
MainTab:CreateParagraph({Title = "DiddyHub", Content = "Multi-game hub with dupes, flings, roles & more. Supports Delta, Solara, etc."})
MainTab:CreateButton({
    Name = "Rejoin Server",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
})

-- Player Stats Tab
local player = game.Players.LocalPlayer
local statsSection = StatsTab:CreateSection("Your Stats & Role")

local roleLabel = StatsTab:CreateLabel("Current Role: " .. CurrentRole)
local usernameLabel = StatsTab:CreateLabel("Username: " .. player.Name)

local function updateStats()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        StatsTab:CreateLabel("Health: " .. player.Character.Humanoid.Health)
        StatsTab:CreateLabel("WalkSpeed: " .. player.Character.Humanoid.WalkSpeed)
    end
end

game:GetService("RunService").Heartbeat:Connect(updateStats)

-- Fling Tab
FlingTab:CreateSection("Fling Options")

local flingEnabled = false
local walkFlingEnabled = false
local targetPlayer = nil

FlingTab:CreateToggle({
    Name = "Enable Walk Fling",
    CurrentValue = false,
    Flag = "WalkFling",
    Callback = function(Value)
        walkFlingEnabled = Value
        if Value then
            -- Simple walk fling loop
            spawn(function()
                while walkFlingEnabled do
                    if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local root = player.Character.HumanoidRootPart
                        root.Velocity = root.Velocity + Vector3.new(math.random(-50,50), 0, math.random(-50,50))
                    end
                    task.wait(0.1)
                end
            end)
        end
    end
})

FlingTab:CreateInput({
    Name = "Target Player for Fling",
    PlaceholderText = "Player Name",
    RemoveTextAfterFocusLost = false,
    Callback = function(Text)
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if string.lower(plr.Name) == string.lower(Text) then
                targetPlayer = plr
                Rayfield:Notify({Title = "Target Set", Content = "Flinging " .. plr.Name})
                break
            end
        end
    end
})

FlingTab:CreateButton({
    Name = "Fling Target",
    Callback = function()
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetRoot = targetPlayer.Character.HumanoidRootPart
            local myRoot = player.Character.HumanoidRootPart
            myRoot.CFrame = targetRoot.CFrame * CFrame.new(0, 0, -5)
            myRoot.Velocity = Vector3.new(0, 10000, 0) -- Strong upward fling
        end
    end
})

FlingTab:CreateButton({
    Name = "Universal Fling All (FE)",
    Callback = function()
        -- Basic FE fling example
        for _, plr in ipairs(game.Players:GetPlayers()) do
            if plr ~= player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
                plr.Character.HumanoidRootPart.Velocity = Vector3.new(math.random(-100,100), 500, math.random(-100,100))
            end
        end
    end
})

-- Dupe & Game Scripts Tab (Expanded with many options)
DupeTab:CreateSection("Universal Dupes & Scripts")

DupeTab:CreateButton({
    Name = "Tool Dupe (Universal)",
    Callback = function()
        -- Basic tool dupe
        if player.Backpack then
            for _, tool in ipairs(player.Backpack:GetChildren()) do
                if tool:IsA("Tool") then
                    local clone = tool:Clone()
                    clone.Parent = player.Backpack
                end
            end
        end
        Rayfield:Notify({Title = "Dupe", Content = "Tools duplicated!"})
    end
})

-- Game-specific examples (expand as needed)
if lowerGameName:find("blox fruits") or lowerGameName:find("fruit") then
    DupeTab:CreateButton({Name = "Blox Fruits Auto Farm (Example)", Callback = function() Rayfield:Notify({Title="Game Script", Content="Blox Fruits features loaded (placeholder)"}) end})
elseif lowerGameName:find("da hood") or lowerGameName:find("hood") then
    DupeTab:CreateButton({Name = "Da Hood Aimlock + Dupe", Callback = function() end})
end

-- Add more generic powerful options
DupeTab:CreateToggle({
    Name = "Infinite Yield (Load IY)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))() end
    end
})

DupeTab:CreateButton({
    Name = "Anti-Lag + FPS Boost",
    Callback = function()
        settings().Rendering.QualityLevel = 1
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
        end
    end
})

-- Roles Tab
RolesTab:CreateSection("Role Manager")

RolesTab:CreateLabel("Default Role: Normal (Free)")

local keyInput = RolesTab:CreateInput({
    Name = "Enter Role Key",
    PlaceholderText = "Paste your key here",
    Callback = function(Text)
        for role, key in pairs(RoleKeys) do
            if Text == key then
                CurrentRole = role
                roleLabel:Set("Current Role: " .. CurrentRole)
                Rayfield:Notify({Title = "Role Upgraded!", Content = "You are now " .. role})
                return
            end
        end
        Rayfield:Notify({Title = "Invalid Key", Content = "Try again"})
    end
})

RolesTab:CreateDropdown({
    Name = "Change Role (if key owned)",
    Options = {"Normal", "Member", "Member+", "VIP", "Admin", "Owner"},
    CurrentOption = {"Normal"},
    MultipleOptions = false,
    Callback = function(CurrentOption)
        -- Would check key possession in real impl
        CurrentRole = CurrentOption[1]
        roleLabel:Set("Current Role: " .. CurrentRole)
    end
})

-- Universal Tab
UniversalTab:CreateSection("Universal Exploits")

UniversalTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 500},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(Value)
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = Value
        end
    end
})

UniversalTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            game:GetService("UserInputService").JumpRequest:Connect(function()
                if player.Character and player.Character:FindFirstChild("Humanoid") then
                    player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                end
            end)
        end
    end
})

-- Discord Tab
DiscordTab:CreateButton({
    Name = "Join DiddyHub Discord",
    Callback = function()
        -- Opens Discord invite (replace link)
        setclipboard("https://discord.gg/example")
        Rayfield:Notify({Title = "Copied", Content = "Discord link copied!"})
    end
})

DiscordTab:CreateLabel("Support & Updates in Discord")

-- Settings Tab
SettingsTab:CreateSection("UI Settings")

SettingsTab:CreateDropdown({
    Name = "Change Theme",
    Options = {"Default", "Ocean", "Midnight", "Sentinel", "Dark"},
    CurrentOption = {"Default"},
    Callback = function(CurrentOption)
        Window:ChangeTheme(CurrentOption[1]) -- Rayfield supports theme changes
    end
})

SettingsTab:CreateButton({
    Name = "Destroy GUI",
    Callback = function()
        Window:Destroy()
    end
})

Rayfield:Notify({
    Title = "DiddyHub Loaded!",
    Content = "Enjoy! Role: " .. CurrentRole .. " | Game: " .. gameName,
    Duration = 6
})
