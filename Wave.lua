-- ============================================
-- 🌊 Wave Hub - Auto Game Detect + Player Info
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

-- ============================================
-- Key System
-- ============================================
local ValidKeys = {"WAVE2026", "ZENOWAVE", "WAVVYYBEST", "DELTAWAVE"}

if true then  -- Key System On
    local _ = Rayfield:CreateWindow({
        Name = "🌊 Wave Key System",
        LoadingTitle = "Wave Authentication",
        LoadingSubtitle = "Delta Optimized",
        KeySystem = true,
        KeySettings = {
            Title = "🌊 Wave Hub",
            Subtitle = "Key System",
            Note = "Get key from owner / Discord",
            FileName = "WaveKey",
            SaveKey = true,
            Key = ValidKeys,
        },
    })
    repeat task.wait(0.5) until Rayfield.Flags.KeyVerified
end

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
        [142823166] = "🚗 Vehicle Legends",
    }
    return gameMap[placeId] or "🌍 Unknown / Custom Game"
end

local CurrentGame = GetGameName()
local PlaceId = game.PlaceId

-- ============================================
-- Main Window
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 ",
    LoadingTitle = "Loading Wave Hub...",
    LoadingSubtitle = CurrentGame,
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "WaveHub",
        FileName = "Config"
    },
})

-- ============================================
-- PLAYER INFO TAB
-- ============================================
local InfoTab = Window:CreateTab("👤 Player Info", "user")

InfoTab:CreateSection("Your Info")

InfoTab:CreateParagraph({
    Title = "Username",
    Content = LocalPlayer.Name
})

InfoTab:CreateParagraph({
    Title = "Display Name",
    Content = LocalPlayer.DisplayName
})

InfoTab:CreateParagraph({
    Title = "User ID",
    Content = tostring(LocalPlayer.UserId)
})

InfoTab:CreateParagraph({
    Title = "Account Age",
    Content = LocalPlayer.AccountAge .. " days"
})

InfoTab:CreateParagraph({
    Title = "Current Game",
    Content = CurrentGame .. "\nPlaceId: " .. PlaceId
})

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
        local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        if char:FindFirstChild("Humanoid") then
            char.Humanoid.WalkSpeed = v
        end
    end,
})

-- Add more universal features here...

-- ============================================
-- AUTO GAME SPECIFIC TAB
-- ============================================
local GameTab = Window:CreateTab(CurrentGame, "gamepad")

GameTab:CreateSection("Game Specific Features")

if string.find(CurrentGame, "Blox Fruits") then
    GameTab:CreateToggle({Name = "Auto Farm", Callback = function(v) Rayfield:Notify("Auto Farm", v and "Enabled" or "Disabled") end})
    GameTab:CreateButton({Name = "Teleport to Fruit", Callback = function() Rayfield:Notify("Blox Fruits", "Looking for fruit...") end})
elseif string.find(CurrentGame, "Arsenal") then
    GameTab:CreateToggle({Name = "Silent Aim", Callback = print})
    GameTab:CreateToggle({Name = "No Recoil", Callback = print})
else
    GameTab:CreateParagraph({
        Title = "No specific scripts yet",
        Content = "This game is not fully supported.\nAdd your own features here!"
    })
end

-- ============================================
-- ABOUT
-- ============================================
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({
    Title = "🌊 Wave Hub",
    Content = "Auto Game Detection • Player Info • Delta Optimized\nMade for mobile & PC"
})

Rayfield:Notify({
    Title = "🌊 Wave Hub",
    Content = "Loaded in " .. CurrentGame .. "!\nWelcome, " .. LocalPlayer.DisplayName,
    Duration = 6
})

Rayfield:LoadConfiguration()
