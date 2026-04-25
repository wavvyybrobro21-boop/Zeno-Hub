-- ============================================
-- 🌊 Wave Hub - Delta Mobile Optimized
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

-- ============================================
-- Key System
-- ============================================
local ValidKeys = {"WAVE2026", "ZENOWAVE", "WAVVYYBEST", "DELTAWAVE"}

local KeySystemEnabled = true

if KeySystemEnabled then
    local Window = Rayfield:CreateWindow({
        Name = "🌊 Wave Key System",
        LoadingTitle = "Wave Authentication",
        LoadingSubtitle = "Mobile Optimized",
        KeySystem = true,
        KeySettings = {
            Title = "🌊 Wave Hub",
            Subtitle = "Key System",
            Note = "Join Discord for keys",
            FileName = "WaveKey_Delta",
            SaveKey = true,
            GrabKeyFromSite = false,
            Key = ValidKeys,
        },
    })

    repeat task.wait(0.5) until Rayfield.Flags.KeyVerified
end

-- ============================================
-- Mobile Detection & Optimization
-- ============================================
local IsMobile = game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").KeyboardEnabled

local Config = {
    DefaultWalkSpeed = 16,
    MaxWalkSpeed = IsMobile and 150 or 300,  -- Lower max on mobile
    DefaultFOV = 70,
}

-- ============================================
-- Utilities
-- ============================================
local Utilities = {}

function Utilities:GetCharacter()
    local player = game.Players.LocalPlayer
    return player.Character or player.CharacterAdded:Wait()
end

function Utilities:Notify(title, content, duration)
    pcall(function()
        Rayfield:Notify({
            Title = title,
            Content = content,
            Duration = duration or 4,
            Image = 4483362458  -- Optional icon
        })
    end)
end

-- ============================================
-- Main Wave Window
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 ",
    LoadingTitle = "Loading Wave Hub...",
    LoadingSubtitle = IsMobile and "Delta Mobile Edition" or "by Wavvyy",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WaveHub_Delta",
        FileName = IsMobile and "MobileConfig" or "MainConfig"
    },
    KeySystem = false,
})

-- ============================================
-- UNIVERSAL TAB (Mobile Friendly)
-- ============================================
local UniversalTab = Window:CreateTab("🌍 Universal", "globe")

UniversalTab:CreateSection("Movement")

UniversalTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, Config.MaxWalkSpeed},
    Increment = IsMobile and 2 or 5,
    CurrentValue = 16,
    Callback = function(v)
        local char = Utilities:GetCharacter()
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end,
})

-- Add more mobile-friendly features (Fly, etc.) as needed

-- ============================================
-- GAME SPECIFIC TABS (Same as before)
-- ============================================
-- Blox Fruits, Arsenal, etc. (keep your existing tabs here)

-- ============================================
-- ABOUT TAB
-- ============================================
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({
    Title = "🌊 Wave Hub - Delta Edition",
    Content = "Optimized for iOS & Android Delta Executor\nTouch Friendly • Lower Resource Usage"
})

Utilities:Notify("🌊 Wave", "Loaded Successfully on Delta Mobile! 🚀", 5)
Rayfield:LoadConfiguration()
