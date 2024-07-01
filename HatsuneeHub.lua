-- Hatsune Script for Blade Ball
-- Dependencies
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local players = game:GetService("Players")
local player = players.LocalPlayer

-- Ensure script runs only in the game "Blade Ball"
if game.PlaceId ~= 13772394625 then
OrionLib:MakeNotification({
Name = "Invalid Game",
Content = "This script only works in Blade Ball.",
Image = "rbxassetid://4483345998",
Time = 5
})
return
end

-- Main GUI
local main = OrionLib:MakeWindow({Name = "Blade Ball Script", HidePremium = false, SaveConfig = true, ConfigFolder = "BladeBallScript"})

-- Auto Parry Variables
local autoParryEnabled = false
local parryDirection = "Costume"

-- Visualizer Variable
local visualizerEnabled = false

-- Disable VFX Variable
local disableVFXEnabled = false

-- AI Variable
local AIEnabled = false

-- Main Tab
local mainTab = main:MakeTab({ Name = "Main", Icon = "rbxassetid://4483345998", PremiumOnly = false })

mainTab:AddToggle({
Name = "Enable Auto Parry",
Default = false,
Callback = function(value)
autoParryEnabled = value
if value then
OrionLib:MakeNotification({
Name = "Auto Parry Enabled",
Content = "Auto Parry has been enabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(0, 0, 255)
})
else
OrionLib:MakeNotification({
Name = "Auto Parry Disabled",
Content = "Auto Parry has been disabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(255, 0, 0)
})
end
end
})

mainTab:AddDropdown({
Name = "Direction",
Default = "Costume",
Options = {"Costume", "Random"},
Callback = function(value)
parryDirection = value
end
})

mainTab:AddToggle({
Name = "Enable Visualizer",
Default = false,
Callback = function(value)
visualizerEnabled = value
if value then
OrionLib:MakeNotification({
Name = "Visualizer Enabled",
Content = "Visualizer has been enabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(0, 0, 255)
})
else
OrionLib:MakeNotification({
Name = "Visualizer Disabled",
Content = "Visualizer has been disabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(255, 0, 0)
})
end
end
})

mainTab:AddToggle({
Name = "Disable VFX",
Default = false,
Callback = function(value)
disableVFXEnabled = value
if value then
OrionLib:MakeNotification({
Name = "VFX Disabled",
Content = "VFX has been disabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(255, 0, 0)
})
else
OrionLib:MakeNotification({
Name = "VFX Enabled",
Content = "VFX has been enabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(0, 0, 255)
})
end
end
})

mainTab:AddToggle({
Name = "Enable AI",
Default = false,
Callback = function(value)
AIEnabled = value
if value then
OrionLib:MakeNotification({
Name = "AI Enabled",
Content = "AI has been enabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(0, 0, 255)
})
else
OrionLib:MakeNotification({
Name = "AI Disabled",
Content = "AI has been disabled.",
Image = "rbxassetid://4483345998",
Time = 5,
Color = Color3.fromRGB(255, 0, 0)
})
end
end
})

-- Settings Tab
local settingsTab = main:MakeTab({ Name = "Settings", Icon = "rbxassetid://4483345998", PremiumOnly = false })

settingsTab:AddButton({
Name = "Unlock FPS (30 FPS)",
Callback = function()
setfpscap(30)
OrionLib:MakeNotification({
Name = "FPS Set",
Content = "FPS has been set to 30.",
Image = "rbxassetid://4483345998",
Time = 5
})
end
})

settingsTab:AddButton({
Name = "Unlock FPS (60 FPS)",
Callback = function()
setfpscap(60)
OrionLib:MakeNotification({
Name = "FPS Set",
Content = "FPS has been set to 60.",
Image = "rbxassetid://4483345998",
Time = 5
})
end
})

settingsTab:AddButton({
Name = "Unlock FPS (120 FPS)",
Callback = function()
setfpscap(120)
OrionLib:MakeNotification({
Name = "FPS Set",
Content = "FPS has been set to 120.",
Image = "rbxassetid://4483345998",
Time = 5
})
end
})

settingsTab:AddKeybind({
Name = "Toggle UI",
Default = Enum.KeyCode.LeftAlt,
Hold = false,
Callback = function()
main:Toggle()
end
})

-- Developer Info
local infoTab = main:MakeTab({ Name = "Info", Icon = "rbxassetid://4483345998", PremiumOnly = false })

infoTab:AddLabel("Developer: <@1189847445807562772>")
infoTab:AddLabel("Discord: discord.gg/jgZmEXfcqW")

-- Main Logic
runService.RenderStepped:Connect(function()
if autoParryEnabled then
-- Logika Auto Parry
end

if visualizerEnabled then
-- Logika Visualizer
end

if disableVFXEnabled then
-- Logika Disable VFX
end

if AIEnabled then
-- Logika AI
end
end)

-- Jalankan OrionLib GUI
OrionLib:Init()
