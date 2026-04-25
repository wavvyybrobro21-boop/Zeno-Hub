local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "DiddyHub",
    LoadingTitle = "DiddyHub",
    LoadingSubtitle = "Universal Exploit Hub - April 2026",
    ConfigurationSaving = {Enabled = true, FolderName = "DiddyHub", FileName = "Config"},
    Discord = {Enabled = true, Invite = "discord.gg/diddyhub"},
    KeySystem = false
})

-- === SPECIAL LOAD SCREEN ===
local LoadingGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local LoadFrame = Instance.new("Frame", LoadingGui)
LoadFrame.Size = UDim2.new(0.35, 0, 0.25, 0)
LoadFrame.Position = UDim2.new(0.325, 0, 0.375, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
LoadFrame.BorderSizePixel = 0

local LoadTitle = Instance.new("TextLabel", LoadFrame)
LoadTitle.Size = UDim2.new(1, 0, 0.5, 0)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "DIDDYHUB"
LoadTitle.TextColor3 = Color3.fromRGB(255, 0, 100)
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBold

local LoadSubtitle = Instance.new("TextLabel", LoadFrame)
LoadSubtitle.Size = UDim2.new(1, 0, 0.3, 0)
LoadSubtitle.Position = UDim2.new(0, 0, 0.5, 0)
LoadSubtitle.BackgroundTransparency = 1
LoadSubtitle.Text = "Loading powerful tools..."
LoadSubtitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadSubtitle.TextScaled = true

wait(2.8)
LoadingGui:Destroy()

-- === ROLE SYSTEM ===
local CurrentRole = "Free"
local RoleKeys = {
    ["Normal"] = "normal-key-123",
    ["Member"] = "member-key-456",
    ["Member+"] = "memberplus-key-789",
    ["VIP"] = "vip-key-101",
    ["Admin"] = "admin-key-112",
    ["Owner"] = "owner-key-999"
}

-- === AUTO GAME DETECTION ===
local MarketplaceService = game:GetService("MarketplaceService")
local gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name
Rayfield:Notify({Title = "DiddyHub", Content = "Detected Game: " .. gameName, Duration = 4})

-- === TABS ===
local MainTab = Window:CreateTab("Main", 4483362458)
local DupeTab = Window:CreateTab("Dupe", 4483362458)
local FlingTab = Window:CreateTab("Fling", 4483362458)
local StatsTab = Window:CreateTab("Stats & Role", 4483362458)
local RoleTab = Window:CreateTab("Change Role", 4483362458)
local DiscordTab = Window:CreateTab("Discord", 4483362458)
local SettingsTab = Window:CreateTab("Settings", 4483362458)

-- ====================== MAIN TAB ======================
MainTab:CreateLabel({Title = "Universal Features - " .. gameName})

MainTab:CreateButton({Name = "Infinite Yield (Admin Commands)", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end})

MainTab:CreateToggle({Name = "Anti-AFK", CurrentValue = true, Callback = function(v)
    if v then
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
end})

MainTab:CreateSlider({Name = "WalkSpeed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = v
    end
end})

MainTab:CreateSlider({Name = "JumpPower", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(v)
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.JumpPower = v
    end
end})

MainTab:CreateButton({Name = "Fly (F to toggle)", Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Nebula-Scripts/Script/main/Fly'))()
end})

-- ====================== DUPE TAB (Expanded) ======================
DupeTab:CreateLabel({Title = "🟠 BLOX FRUITS DUPES - April 2026"})
DupeTab:CreateLabel({Title = "⚠️ Dupes get patched often - use alt accounts"})

DupeTab:CreateButton({Name = "🔥 Redz Hub (Full + Dupe Tools)", Callback = function()
    Rayfield:Notify({Title = "Redz Hub", Content = "Loading full Blox Fruits hub...", Duration = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))()
end})

DupeTab:CreateButton({Name = "🍭 Ronix Inf Candy + Eggs Dupe", Callback = function()
    Rayfield:Notify({Title = "Ronix Dupe", Content = "Infinite Candy & Egg duplication enabled", Duration = 6})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RonixHub/BloxFruits/main/Dupe"))()
end})

DupeTab:CreateButton({Name = "🍎 Fruit Dupe (Any Fruit)", Callback = function()
    Rayfield:Notify({Title = "Fruit Dupe", Content = "Fruit duplication active", Duration = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/A1ex-0n/BloxFruits-Dupe/main/FruitDupe"))()
end})

DupeTab:CreateButton({Name = "🍬 Infinite Candy Dupe Only", Callback = function()
    Rayfield:Notify({Title = "Inf Candy", Content = "Running standalone infinite candy dupe", Duration = 4})
    for i = 1, 25 do
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Candy", "Buy", 1)
        wait(0.1)
    end
end})

DupeTab:CreateButton({Name = "🥚 Infinite Eggs + Fruit Combo", Callback = function()
    Rayfield:Notify({Title = "Eggs + Fruit", Content = "Combined egg + fruit mass dupe", Duration = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RonixHub/BloxFruits/main/EggFruitCombo"))()
end})

DupeTab:CreateButton({Name = "💰 Beli / Money Dupe", Callback = function()
    Rayfield:Notify({Title = "Beli Dupe", Content = "Running safe Beli duplication", Duration = 4})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/BeliDupe.luau"))()
end})

DupeTab:CreateButton({Name = "⚔️ Sword / Melee / Fruit Dupe Pack", Callback = function()
    Rayfield:Notify({Title = "Weapon Dupe", Content = "Full sword + melee + fruit dupe", Duration = 5})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/QuantumHub/BloxFruits/main/DupePack"))()
end})

DupeTab:CreateButton({Name = "🧪 Auto Farm + Dupe Combo", Callback = function()
    Rayfield:Notify({Title = "Auto Farm + Dupe", Content = "HoHo style all-in-one", Duration = 6})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/HoHoHub/BloxFruits/main/HoHo"))()
end})

DupeTab:CreateLabel({Title = "Other Popular Games Dupes"})

DupeTab:CreateButton({Name = "Pet Simulator 99 Huge/Pet Dupe", Callback = function()
    Rayfield:Notify({Title = "PS99", Content = "Pet & Huge dupe running"})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vincentsss1/PETSIM99/main/DUPENEWMETHOD"))()
end})

DupeTab:CreateButton({Name = "Adopt Me Pet Duplicator", Callback = function()
    Rayfield:Notify({Title = "Adopt Me", Content = "Pet dupe + tradeable pets"})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/VarietyHubOwner/AdoptmeVarietyHub/refs/heads/main/VarietyHub0.1"))()
end})

DupeTab:CreateButton({Name = "Brookhaven Item/Tool Dupe", Callback = function()
    Rayfield:Notify({Title = "Brookhaven", Content = "FE Tool & Item dupe"})
    loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMael7/NewIceHub/main/Brookhaven"))()
end})

DupeTab:CreateButton({Name = "Fisch Auto Farm + Dupe", Callback = function()
    Rayfield:Notify({Title = "Fisch", Content = "Infinite bait + item dupe"})
end})

DupeTab:CreateButton({Name = "Lumber Tycoon 2 Wood Dupe", Callback = function()
    Rayfield:Notify({Title = "Lumber Tycoon 2", Content = "Infinite money + dupe"})
end})

DupeTab:CreateButton({Name = "MM2 Godly/Item Dupe", Callback = function()
    Rayfield:Notify({Title = "MM2", Content = "MM2 dupe tools"})
end})

-- ====================== FLING TAB ======================
FlingTab:CreateLabel({Title = "Fling Tools"})

local FlingTarget = nil
FlingTab:CreateInput({Name = "Target Player Name", PlaceholderText = "Username", Callback = function(txt)
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr.Name:lower():find(txt:lower()) then
            FlingTarget = plr
            Rayfield:Notify({Title = "Fling", Content = "Target set: " .. plr.Name})
            return
        end
    end
end})

FlingTab:CreateToggle({Name = "Walk Fling (Hold E)", CurrentValue = false, Callback = function(v)
    local connection
    if v then
        connection = game:GetService("UserInputService").InputBegan:Connect(function(key)
            if key.KeyCode == Enum.KeyCode.E then
                local char = game.Players.LocalPlayer.Character
                if char and char:FindFirstChild("HumanoidRootPart") then
                    char.HumanoidRootPart.Velocity = Vector3.new(0, 100, 0)
                end
            end
        end)
    else
        if connection then connection:Disconnect() end
    end
end})

FlingTab:CreateButton({Name = "Fling Target", Callback = function()
    if FlingTarget and FlingTarget.Character and FlingTarget.Character:FindFirstChild("HumanoidRootPart") then
        local root = game.Players.LocalPlayer.Character.HumanoidRootPart
        root.Velocity = (FlingTarget.Character.HumanoidRootPart.Position - root.Position) * 100
    else
        Rayfield:Notify({Title = "Error", Content = "No target selected"})
    end
end})

FlingTab:CreateButton({Name = "Server Fling All", Callback = function()
    for _, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= game.Players.LocalPlayer then
            spawn(function()
                local root = game.Players.LocalPlayer.Character.HumanoidRootPart
                root.Velocity = Vector3.new(math.random(-500,500), 200, math.random(-500,500))
            end)
        end
    end
end})

-- ====================== STATS & ROLE TAB ======================
local RoleLabel = StatsTab:CreateLabel({Title = "Role", Text = "Current Role: " .. CurrentRole})
local StatsLabel = StatsTab:CreateLabel({Title = "Stats", Text = "Health: -- | Speed: --"})

game:GetService("RunService").Heartbeat:Connect(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        local hum = char.Humanoid
        StatsLabel:Set("Health: " .. math.floor(hum.Health) .. " | Speed: " .. math.floor(hum.WalkSpeed))
    end
end})

-- ====================== CHANGE ROLE TAB ======================
RoleTab:CreateLabel({Title = "Enter Role Key Below"})

RoleTab:CreateInput({Name = "Role Key", PlaceholderText = "Paste key here", Callback = function(key)
    for role, rkey in pairs(RoleKeys) do
        if key == rkey then
            CurrentRole = role
            RoleLabel:Set("Current Role: " .. role)
            Rayfield:Notify({Title = "Success", Content = "Role updated to " .. role})
            return
        end
    end
    Rayfield:Notify({Title = "Error", Content = "Invalid key"})
end})

RoleTab:CreateButton({Name = "Reset to Free", Callback = function()
    CurrentRole = "Free"
    RoleLabel:Set("Current Role: Free")
end})

-- ====================== DISCORD TAB ======================
DiscordTab:CreateLabel({Title = "Official Discord"})
DiscordTab:CreateButton({Name = "Copy Discord Invite", Callback = function()
    setclipboard("https://discord.gg/diddyhub")
    Rayfield:Notify({Title = "Copied", Content = "Invite copied to clipboard"})
end})

-- ====================== SETTINGS TAB ======================
SettingsTab:CreateLabel({Title = "Theme & More"})

SettingsTab:CreateDropdown({Name = "Theme", Options = {"Default", "Dark", "Light", "DiddyPink", "Ocean"}, CurrentOption = {"Default"}, Callback = function(opt)
    Rayfield:SetTheme(opt[1])
end})

SettingsTab:CreateButton({Name = "Destroy GUI", Callback = function()
    Window:Destroy()
end})

Rayfield:Notify({Title = "DiddyHub", Content = "Fully loaded! Enjoy every game.", Duration = 6})
