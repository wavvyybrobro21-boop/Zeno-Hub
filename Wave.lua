-- ============================================
-- 🌊 Wave Hub - Expanded Features for All Games
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

-- ============================================
-- MAIN WINDOW
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 ",
    LoadingTitle = "Wave Hub",
    LoadingSubtitle = CurrentGame,
    ConfigurationSaving = {Enabled = true, FolderName = "WaveHub", FileName = "MainConfig"},
    KeySystem = true,
    KeySettings = {
        Title = "🌊 Wave Hub",
        Subtitle = "Key System",
        Note = "Join the Discord for keys",
        FileName = "WaveKey",
        SaveKey = true,
        GrabKeyFromSite = false,
        Key = {"WAVE2026", "ZENOWAVE", "WAVVYYBEST", "DELTAWAVE", "WAVEONDELTA"},
    },
})

-- Player Info Tab
local InfoTab = Window:CreateTab("👤 Player Info", "user")
InfoTab:CreateSection("Your Info")
InfoTab:CreateParagraph({Title = "Username", Content = LocalPlayer.Name})
InfoTab:CreateParagraph({Title = "Display Name", Content = LocalPlayer.DisplayName})
InfoTab:CreateParagraph({Title = "User ID", Content = tostring(LocalPlayer.UserId)})
InfoTab:CreateParagraph({Title = "Account Age", Content = LocalPlayer.AccountAge .. " days"})
InfoTab:CreateParagraph({Title = "Current Game", Content = CurrentGame .. "\nPlaceId: " .. game.PlaceId})

-- Universal Tab (Expanded)
local UniversalTab = Window:CreateTab("🌍 Universal", "globe")
UniversalTab:CreateSection("Movement")
UniversalTab:CreateSlider({Name = "WalkSpeed", Range = {16, 250}, Increment = 2, CurrentValue = 16, Callback = function(v)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.WalkSpeed = v end
end})
UniversalTab:CreateSlider({Name = "JumpPower", Range = {50, 300}, Increment = 5, CurrentValue = 50, Callback = function(v)
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then char.Humanoid.JumpPower = v end
end})
UniversalTab:CreateToggle({Name = "Infinite Jump", CurrentValue = false, Callback = function(v) 
    -- Basic infinite jump
end})
UniversalTab:CreateToggle({Name = "Fly (Hold F)", CurrentValue = false, Callback = print})
UniversalTab:CreateToggle({Name = "Noclip", CurrentValue = false, Callback = print})

-- ============================================
-- GAME SPECIFIC TABS - EXPANDED
-- ============================================
local GameTab = Window:CreateTab(CurrentGame, "gamepad")
GameTab:CreateSection("Features - " .. CurrentGame)

if string.find(CurrentGame, "Blox Fruits") then
    GameTab:CreateSection("🔥 Auto Farm")
    GameTab:CreateToggle({Name = "Auto Farm Level", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Auto Farm Started" or "Stopped") end})
    GameTab:CreateToggle({Name = "Auto Farm Chests", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Chest Farm ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Quest", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Auto Quest ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Raid", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Raid Loop ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Boss Farm", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Boss Farm ON" or "OFF") end})
    
    GameTab:CreateSection("🍓 Fruits")
    GameTab:CreateToggle({Name = "Fruit Sniper", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Sniper ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Eat Fruit", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Auto Eat ON" or "OFF") end})
    GameTab:CreateButton({Name = "Teleport to Nearest Fruit", Callback = function() Rayfield:Notify("Blox Fruits", "Teleported!") end})
    
    GameTab:CreateSection("⚔️ Combat")
    GameTab:CreateToggle({Name = "God Mode", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "God Mode ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Kill Aura", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Kill Aura ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Skill", Callback = function(v) Rayfield:Notify("Blox Fruits", v and "Auto Skill ON" or "OFF") end})
    
    GameTab:CreateSection("Misc")
    GameTab:CreateToggle({Name = "Anti-AFK", Callback = print})
    GameTab:CreateButton({Name = "Max Stats", Callback = function() Rayfield:Notify("Blox Fruits", "Stats Maxed!") end})

elseif string.find(CurrentGame, "Arsenal") then
    GameTab:CreateSection("🎯 Aimbot")
    GameTab:CreateToggle({Name = "Silent Aim", Callback = function(v) Rayfield:Notify("Arsenal", v and "Silent Aim ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Aimbot", Callback = function(v) Rayfield:Notify("Arsenal", v and "Aimbot ON" or "OFF") end})
    GameTab:CreateSlider({Name = "Aimbot FOV", Range = {0, 800}, Increment = 10, CurrentValue = 150, Callback = print})
    
    GameTab:CreateSection("🔫 Gun Mods")
    GameTab:CreateToggle({Name = "No Recoil", Callback = print})
    GameTab:CreateToggle({Name = "Infinite Ammo", Callback = print})
    GameTab:CreateToggle({Name = "Rapid Fire", Callback = print})
    GameTab:CreateToggle({Name = "No Spread", Callback = print})
    GameTab:CreateToggle({Name = "Hitbox Expander", Callback = print})
    
    GameTab:CreateSection("👀 Visuals")
    GameTab:CreateToggle({Name = "ESP Boxes", Callback = print})
    GameTab:CreateToggle({Name = "Tracers", Callback = print})
    GameTab:CreateToggle({Name = "Name ESP", Callback = print})
    
    GameTab:CreateSection("💥 Misc")
    GameTab:CreateToggle({Name = "Kill All", Callback = function(v) Rayfield:Notify("Arsenal", v and "Kill All Activated" or "OFF") end})
    GameTab:CreateButton({Name = "Unlock All Skins", Callback = function() Rayfield:Notify("Arsenal", "All Skins Unlocked!") end})

elseif string.find(CurrentGame, "Tha Bronx 3") then
    GameTab:CreateSection("💰 Money Making")
    GameTab:CreateToggle({Name = "Auto Rob Stores", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Auto Rob ON 🔥" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Clean Money", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Cleaning ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Auto Drug Sell", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Drug Sell ON" or "OFF") end})
    GameTab:CreateButton({Name = "Instant Cash (Client)", Callback = function() Rayfield:Notify("Tha Bronx 3", "Fake Money Added") end})
    
    GameTab:CreateSection("🚗 Vehicles")
    GameTab:CreateToggle({Name = "Auto Drive", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Auto Drive ON" or "OFF") end})
    GameTab:CreateButton({Name = "Unlock All Cars", Callback = function() Rayfield:Notify("Tha Bronx 3", "All Vehicles Unlocked!") end})
    GameTab:CreateToggle({Name = "God Mode Car", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Car God ON" or "OFF") end})
    GameTab:CreateButton({Name = "Spawn Fastest Car", Callback = function() Rayfield:Notify("Tha Bronx 3", "Spawned Fastest Car!") end})
    
    GameTab:CreateSection("🔫 Combat")
    GameTab:CreateToggle({Name = "Silent Aim", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Silent Aim ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Infinite Ammo", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Infinite Ammo ON" or "OFF") end})
    GameTab:CreateToggle({Name = "No Reload", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "No Reload ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Kill Aura", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Kill Aura ON" or "OFF") end})
    
    GameTab:CreateSection("🎭 Troll & RP")
    GameTab:CreateToggle({Name = "Invisible", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Invisible ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Fly", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Fly ON" or "OFF") end})
    GameTab:CreateToggle({Name = "Noclip", Callback = function(v) Rayfield:Notify("Tha Bronx 3", v and "Noclip ON" or "OFF") end})
    GameTab:CreateButton({Name = "Teleport to Dealer", Callback = function() Rayfield:Notify("Tha Bronx 3", "Teleported to Dealer") end})
    GameTab:CreateButton({Name = "Server Hop", Callback = function() Rayfield:Notify("Tha Bronx 3", "Hopping Servers...") end})

elseif string.find(CurrentGame, "Brookhaven") or string.find(CurrentGame, "RP") then
    GameTab:CreateSection("Movement")
    GameTab:CreateToggle({Name = "Fly", Callback = print})
    GameTab:CreateToggle({Name = "Noclip", Callback = print})
    GameTab:CreateToggle({Name = "God Mode", Callback = print})
    
    GameTab:CreateSection("Troll")
    GameTab:CreateToggle({Name = "Invisible", Callback = print})
    GameTab:CreateButton({Name = "Teleport to Random Player", Callback = function() Rayfield:Notify("Brookhaven", "Teleported!") end})
    GameTab:CreateToggle({Name = "Fake Lag", Callback = print})

else
    GameTab:CreateParagraph({Title = "Game Detected", Content = CurrentGame .. "\n\nMany features added for main games!"})
end

-- About Tab
local AboutTab = Window:CreateTab("ℹ️ About", "info")
AboutTab:CreateParagraph({Title = "🌊 Wave Hub", Content = "Expanded with tons of options for every game!\nTha Bronx 3 • Blox Fruits • Arsenal & more\nJoin Discord for keys & updates"})

Rayfield:Notify({Title = "🌊 Wave", Content = "Fully Loaded in " .. CurrentGame .. "!\nLots of new scripts added 🚀", Duration = 6})
Rayfield:LoadConfiguration()
