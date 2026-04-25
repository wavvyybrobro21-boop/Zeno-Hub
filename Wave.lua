-- ============================================
-- 🌊 Wave Hub - FIXED & STABLE
-- Made by Wavvyy | Owner: Zen
-- ============================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield', true))()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local CurrentGame = "🌍 Any Game"
local AccessLevel = "Normal"

-- Simple Game Name
local placeId = game.PlaceId
local gameMap = {
    [2753915549] = "🍎 Blox Fruits",
    [286090429] = "🔫 Arsenal",
    [4924922222] = "🏠 Brookhaven RP",
    [16472538603] = "🐍 Tha Bronx 3",
}
CurrentGame = gameMap[placeId] or CurrentGame

-- ============================================
-- MAIN WINDOW
-- ============================================
local Window = Rayfield:CreateWindow({
    Name = " 🌊Wave🌊 | SUPER ADVANCED",
    LoadingTitle = "Wave Hub",
    LoadingSubtitle = Current
