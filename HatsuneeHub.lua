-- Blade Ball Script with Start Menu
-- Dependencies
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
local player = game.Players.LocalPlayer
local replicatedStorage = game:GetService("ReplicatedStorage")
local runService = game:GetService("RunService")
local mouse = player:GetMouse()

-- Main GUI with Start Menu
local main = OrionLib:MakeWindow({Name = "Blade Ball Script", HidePremium = false, SaveConfig = true, ConfigFolder = "BladeBallScript"})

-- Start Menu Tab
local startMenuTab = main:MakeTab({ Name = "Start Menu", Icon = "rbxassetid://4483345998", PremiumOnly = false })

startMenuTab:AddButton({
Name = "Start Auto Attack Script",
Callback = function()
startAutoAttackScript()
end
})

-- Main Auto Attack Script
function startAutoAttackScript()
-- Fungsi untuk menyerang musuh terdekat
local function attackNearestEnemy()
local enemies = {} -- daftar musuh

-- Temukan musuh di dalam area permainan (sesuaikan bagian ini dengan struktur game kalian)
for _, entity in ipairs(workspace:GetChildren()) do
if entity:FindFirstChild("Humanoid") and entity:FindFirstChildOfClass("Humanoid").Health > 0 then
table.insert(enemies, entity)
end
end

-- Temukan musuh terdekat
local nearestEnemy = nil
local shortestDistance = math.huge

for _, enemy in ipairs(enemies) do
local distance = (player.Character.PrimaryPart.Position - enemy.PrimaryPart.Position).Magnitude
if distance < shortestDistance then
shortestDistance = distance
nearestEnemy = enemy
end
end

-- Serang musuh terdekat
if nearestEnemy then
replicatedStorage:FindFirstChild("Remotes"):FindFirstChild("Combat"):InvokeServer("attack", nearestEnemy)
end
end

-- Fungsi untuk menghindari serangan musuh
local function dodgeAttack()
local closestProjectile = nil
local closestDistance = math.huge

-- Temukan proyektil terdekat (sesuaikan bagian ini dengan struktur game kalian)
for _, projectile in ipairs(workspace:GetChildren()) do
if projectile:FindFirstChild("Projectile") then
local distance = (player.Character.PrimaryPart.Position - projectile.Position).Magnitude
if distance < closestDistance then
closestDistance = distance
closestProjectile = projectile
end
end
end

-- Menghindari proyektil terdekat
if closestProjectile then
local dodgeDirection = (player.Character.PrimaryPart.Position - closestProjectile.Position).unit
player.Character.Humanoid:Move(dodgeDirection * 50)
end
end

-- Bind fungsi untuk serangan otomatis
runService.RenderStepped:Connect(function()
attackNearestEnemy()
dodgeAttack()
end)

-- Fungsi untuk manual Attack dengan klik mouse
mouse.Button1Down:Connect(function()
attackNearestEnemy()
end)

OrionLib:MakeNotification({
Name = "Script Started",
Content = "Auto Attack Script has been started!",
Image = "rbxassetid://4483345998",
Time = 5
})
end

-- Jalankan OrionLib GUI
OrionLib:Init()
