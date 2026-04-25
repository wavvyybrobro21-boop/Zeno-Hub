-- ============================================
-- 🌊 Wave Hub - Fixed Key System + Auto Detect
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
    
    -- ==================== KEY SYSTEM ====================
    KeySystem = true,
