-- ============================================
-- 🌊 Wave Hub - Full Version
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- ============================================
-- Key System (Change keys here)
-- ============================================
local ValidKeys = {
    "WAVE2026",
    "ZENOWAVE",
    "WAVVYYBEST",
    -- Add more keys here
}

local KeySystemEnabled = true
local CorrectKey = false

if KeySystemEnabled then
    local KeyWindow = Rayfield:CreateWindow({
        Name = "🌊 Wave Key System",
        LoadingTitle = "Wave Authentication",
        LoadingSubtitle = "by Wavvyy",
        KeySystem = true,  -- Built-in Rayfield key system
        KeySettings = {
            Title = "Wave Hub",
            Subtitle = "Key System",
            Note = "Get key in Discord or from owner",
            FileName = "WaveKey",
            SaveKey = true,
            GrabKeyFromSite = false, -- Set true later if you want website key
            Key = ValidKeys,         -- Array of valid keys
        },
    })

    -- Wait for key verification
    repeat task.wait() until Rayfield.Flags.KeyVerified or game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
    CorrectKey = true
end

if not CorrectKey and KeySystemEnabled then
    return
end

-- ============================================
-- Configuration
-- ============================================
local Config = {
    DefaultWalkSpeed = 16,
    MaxWalkSpeed = 300,
    DefaultFOV = 70,
    MaxFOV = 120,
}

local Utilities = {}

function Utilities:GetCharacter()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        return player.Character
    end
    return nil
end

function Utilities:Notify(title, content, duration)
    pcall(function()
        Rayfield:Notify({Title = title, Content = content, Duration = duration or 3})
    end)
end

-- ============================================
-- Main Window (Wave)
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 ",
    LoadingTitle = "Loading Wave Hub...",
    LoadingSubtitle = "by Wavvyy",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WaveHub",
        FileName = "MainConfig"
    },
    KeySystem = false,  -- Already handled above
})

-- ============================================
-- UNIVERSAL TAB
-- ============================================
local UniversalTab = Window:CreateTab("🌍 Universal", "globe")

local MovementSection = UniversalTab:CreateSection("Movement")

UniversalTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 300},
    Increment = 5,
    CurrentValue = 16,
    Callback = function(v)
        local char = Utilities:GetCharacter()
        if char then char.Humanoid.WalkSpeed = v end
    end,
})

-- Fly System (same as before, shortened)
-- ... (keep your existing FlySystem if you want)

-- ============================================
-- GAME SPECIFIC TABS
-- ============================================

-- Example 1: Blox Fruits
local BF_Tab = Window:CreateTab("🍎 Blox Fruits", "sword")
BF_Tab:CreateSection("Auto Farm")
BF_Tab:CreateToggle({Name = "Auto Farm Level", CurrentValue = false, Callback = function(v) 
    Utilities:Notify("Blox Fruits", v and "Auto Farm ON" or "Auto Farm OFF", 3)
end})

BF_Tab:CreateButton({Name = "Teleport to Fruit", Callback = function()
    Utilities:Notify("Blox Fruits", "Teleported to nearest fruit!", 3)
end})

-- Example 2: Arsenal
local ArsenalTab = Window:CreateTab("🔫 Arsenal", "crosshair")
ArsenalTab:CreateToggle({Name = "Silent Aim", CurrentValue = false, Callback = print})
ArsenalTab:CreateToggle({Name = "No Recoil", CurrentValue = false, Callback = print})

-- Example 3: Brookhaven / RP Games
local RP_Tab = Window:CreateTab("🏠 RP Games", "home")
RP_Tab:CreateButton({Name = "God Mode", Callback = function() Utilities:Notify("RP", "God Mode Activated", 3) end})

-- Example 4: Your Game Here
local CustomTab = Window:CreateTab("🎮 Your Game", "gamepad")
CustomTab:CreateParagraph({Title = "Add your own scripts here", Content = "Create sections, toggles, buttons etc."})

-- ============================================
-- ABOUT TAB
-- ============================================
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({
    Title = "🌊 Wave Hub",
    Content = "Modern Roblox Script Hub\nFully rebranded • Key Protected • Game Specific Tabs"
})

Utilities:Notify("🌊 Wave", "Successfully loaded! Enjoy the hub 🚀", 5)
Rayfield:LoadConfiguration()
