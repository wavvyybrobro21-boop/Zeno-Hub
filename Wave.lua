-- ============================================
-- 🌊 Wave Hub - VIP + Admin Keys
-- Made by Wavvyy | Owner: Zen
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function GetGameName()
    local placeId = game.PlaceId
    local gameMap = {
        [2753915549] = "🍎 Blox Fruits",
        [286090429]  = "🔫 Arsenal",
        [4924922222] = "🏠 Brookhaven RP",
        [920587237]  = "🛸 Adopt Me",
        [8737899170] = "🐾 Pet Simulator 99",
        [15101393044]= "👗 Dress To Impress",
        [3260590327] = "⚔️ Blade Ball",
        [16472538603]= "🐍 Tha Bronx 3",
    }
    local name = gameMap[placeId]
    if name then return name end
    local success, gName = pcall(function()
        return game:GetService("MarketplaceService"):GetProductInfo(placeId).Name
    end)
    return success and gName or "🌍 Unknown Game"
end

local CurrentGame = GetGameName()
local AccessLevel = "Normal"  -- Normal, VIP, Admin

-- ============================================
-- MAIN WINDOW
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 | Tiered Access",
    LoadingTitle = "Wave Hub",
    LoadingSubtitle = CurrentGame,
    ConfigurationSaving = {Enabled = true, FolderName = "WaveHub", FileName = "TierConfig"},
    KeySystem = true,
    KeySettings = {
        Title = "🌊 Wave Hub",
        Subtitle = "Key System",
        Note = "Join the Discord for keys\nVIP & Admin keys available",
        FileName = "WaveKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {
            "WAVE2026", "ZENOWAVE", "DELTAWAVE",     -- Normal
            "VIPWAVE", "VIP2026",                     -- VIP
            "ADMINWAVE", "ADMINZEN", "OWNERWAVE"      -- Admin / Owner
        },
    },
})

-- Detect Access Level (based on common saved key pattern)
local savedKey = Rayfield.Flags.Key or ""
if string.find(savedKey, "ADMIN") or string.find(savedKey, "OWNER") then
    AccessLevel = "Admin"
elseif string.find(savedKey, "VIP") then
    AccessLevel = "VIP"
end

Rayfield:Notify({
    Title = "🌊 Wave Hub",
    Content = "Access Level: " .. AccessLevel .. "\nWelcome, " .. LocalPlayer.DisplayName,
    Duration = 5
})

-- ============================================
-- PLAYER INFO TAB
-- ============================================
local InfoTab = Window:CreateTab("👤 Player Info", "user")
InfoTab:CreateSection("Account Info")
InfoTab:CreateParagraph({Title = "Username", Content = LocalPlayer.Name})
InfoTab:CreateParagraph({Title = "Display Name", Content = LocalPlayer.DisplayName})
InfoTab:CreateParagraph({Title = "User ID", Content = tostring(LocalPlayer.UserId)})
InfoTab:CreateParagraph({Title = "Access Level", Content = AccessLevel .. " User"})
InfoTab:CreateParagraph({Title = "Current Game", Content = CurrentGame})

-- ============================================
-- UNIVERSAL TAB
-- ============================================
local UniversalTab = Window:CreateTab("🌍 Universal", "globe")
UniversalTab:CreateSection("Movement")
UniversalTab:CreateSlider({Name = "WalkSpeed", Range = {16, 250}, Increment = 2, CurrentValue = 16, Callback = function(v)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = v end
end})
UniversalTab:CreateToggle({Name = "Fly", Callback = print})
UniversalTab:CreateToggle({Name = "Noclip", Callback = print})

-- ============================================
-- VIP PANEL
-- ============================================
if AccessLevel == "VIP" or AccessLevel == "Admin" then
    local VipTab = Window:CreateTab("⭐ VIP Panel", "star")
    VipTab:CreateSection("VIP Exclusive Features")
    VipTab:CreateToggle({Name = "Auto Farm Boost", Callback = function(v) Rayfield:Notify("VIP", v and "Boost Activated" or "Disabled") end})
    VipTab:CreateToggle({Name = "Premium ESP", Callback = print})
    VipTab:CreateButton({Name = "VIP Teleport Menu", Callback = function() Rayfield:Notify("VIP", "Teleport options unlocked") end})
end

-- ============================================
-- ADMIN PANEL
-- ============================================
if AccessLevel == "Admin" then
    local AdminTab = Window:CreateTab("👑 Admin Panel", "crown")
    AdminTab:CreateSection("Admin Commands")
    AdminTab:CreateToggle({Name = "Server God Mode", Callback = print})
    AdminTab:CreateButton({Name = "Give All Players Cash", Callback = function() Rayfield:Notify("Admin", "Cash distributed (client)") end})
    AdminTab:CreateToggle({Name = "Kill Aura (Global)", Callback = print})
    AdminTab:CreateButton({Name = "Server Hop All", Callback = function() Rayfield:Notify("Admin", "Force Server Hop") end})
end

-- ============================================
-- GAME SPECIFIC TAB (with more options)
-- ============================================
local GameTab = Window:CreateTab(CurrentGame, "gamepad")
GameTab:CreateSection("🌟 " .. CurrentGame .. " Features")

if string.find(CurrentGame, "Blox Fruits") then
    GameTab:CreateSection("Auto Farm")
    GameTab:CreateToggle({Name = "Auto Farm Level", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "✅ ON" or "⛔ OFF") end})
    GameTab:CreateToggle({Name = "Auto Quest", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "✅ ON" or "⛔ OFF") end})
    GameTab:CreateToggle({Name = "Auto Raid", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "✅ ON" or "⛔ OFF") end})
    -- Add more as needed

elseif string.find(CurrentGame, "Tha Bronx 3") then
    GameTab:CreateSection("Money & Vehicles")
    GameTab:CreateToggle({Name = "Auto Rob", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "✅ ON" or "⛔ OFF") end})
    GameTab:CreateToggle({Name = "God Mode Car", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "✅ ON" or "⛔ OFF") end})
    GameTab:CreateToggle({Name = "Infinite Ammo", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "✅ ON" or "⛔ OFF") end})
end

-- About Tab
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({Title = "🌊 Wave Hub", Content = "Tiered Keys:\nNormal • VIP (VIPWAVE) • Admin (ADMINWAVE)\nMade by Wavvyy • Owner: Zen"})

Rayfield:LoadConfiguration()
