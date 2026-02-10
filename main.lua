-- [[ EMERGENCY OVERRIDE UI ]] --
local player = game.Players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

-- 1. KILL ANY OLD VERSIONS
if pgui:FindFirstChild("EmergencyBypass") then
    pgui.EmergencyBypass:Destroy()
end

-- 2. CREATE A BRIGHT RED OVERLAY (To prove it's running)
local sg = Instance.new("ScreenGui")
sg.Name = "EmergencyBypass"
sg.ResetOnSpawn = false
sg.DisplayOrder = 999 -- Keeps it on top of everything
sg.Parent = pgui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 100)
frame.Position = UDim2.new(0.5, -150, 0, 20)
frame.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
frame.BorderSizePixel = 4
frame.Parent = sg

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 1, 0)
label.Text = "EXECUTOR ACTIVE\nREGION: KUWAIT DETECTED\nAttempting Chat Unlock..."
label.TextColor3 = Color3.new(1, 1, 1)
label.BackgroundTransparency = 1
label.TextScaled = true
label.Parent = frame

-- 3. BRUTE FORCE THE CHAT SERVICE
local TCS = game:GetService("TextChatService")
local s, e = pcall(function()
    TCS.ChatInputBarConfiguration.Enabled = true
    TCS.ChatWindowConfiguration.Enabled = true
    label.Text = "CHAT UNLOCKED!\nTry clicking the top-left\nchat icon now."
    frame.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
end)

if not s then
    label.Text = "ERROR: " .. tostring(e)
end
