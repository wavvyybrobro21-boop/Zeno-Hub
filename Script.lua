-- ============================================
-- 🌊 Wave Hub - Fully Working Version
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

-- ============================================
-- Player & Game Info
-- ============================================
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GetGameName()
    local placeId = game.PlaceId
    local gameMap = {
        [2753915549] = "🍎 Blox Fruits",
        [286090429] = "🔫 Arsenal",
        [4924922222] = "🏠 Brookhaven",
        [1537690962] = "🏙️ Adopt Me",
        [9872472334] = "🧪 Pet Simulator 99",
        [3260590327] = "⚔️ Blade Ball",
    }
    return gameMap[placeId] or "🌍 Unknown Game"
end

local CurrentGame = GetGameName()

-- ============================================
-- MAIN WINDOW WITH KEY SYSTEM
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 ",
    LoadingTitle = "Wave Hub",
    LoadingSubtitle = CurrentGame,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WaveHub",
        FileName = "MainConfig"
    },
    KeySystem = true,
    KeySettings = {
        Title = "🌊 Wave Hub",
        Subtitle = "Key System",
        Note = "Use one of these keys:\nWAVE2026, ZENOWAVE, DELTAWAVE",
        FileName = "WaveKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"WAVE2026", "ZENOWAVE", "WAVVYYBEST", "DELTAWAVE", "WAVEONDELTA"},
    },
})

-- ============================================
-- PLAYER INFO TAB
-- ============================================
local InfoTab = Window:CreateTab("👤 Player Info", "user")
InfoTab:CreateSection("Your Info")
InfoTab:CreateParagraph({Title = "Username", Content = LocalPlayer.Name})
InfoTab:CreateParagraph({Title = "Display Name", Content = LocalPlayer.DisplayName})
InfoTab:CreateParagraph({Title = "User ID", Content = tostring(LocalPlayer.UserId)})
InfoTab:CreateParagraph({Title = "Account Age", Content = LocalPlayer.AccountAge .. " days"})
InfoTab:CreateParagraph({Title = "Current Game", Content = CurrentGame .. "\nPlaceId: " .. game.PlaceId})

-- ============================================
-- UNIVERSAL TAB
-- ============================================
local UniversalTab = Window:CreateTab("🌍 Universal", "globe")
UniversalTab:CreateSection("Movement")
UniversalTab:CreateSlider({
    Name = "WalkSpeed",
    Range = {16, 200},
    Increment = 2,
    CurrentValue = 16,
    Callback = function(v)
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end,
})

-- ============================================
-- GAME TAB
-- ============================================
local GameTab = Window:CreateTab(CurrentGame, "gamepad")
GameTab:CreateSection("Game Features")
GameTab:CreateParagraph({Title = "Detected Game", Content = CurrentGame})

-- ============================================
-- ABOUT
-- ============================================
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({
    Title = "🌊 Wave Hub",
    Content = "Working Version • Key System Fixed • Auto Game Detect"
})

Rayfield:Notify({Title = "🌊 Wave", Content = "Loaded in " .. CurrentGame .. "!", Duration = 5})
Rayfield:LoadConfiguration()
