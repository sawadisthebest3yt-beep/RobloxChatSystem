-- [[ AUTOMATIC REGION BYPASS ]] --
local TextChatService = game:GetService("TextChatService")
local StarterGui = game:GetService("StarterGui")

-- 1. FORCE THE UI TO APPEAR
local function forceUI()
    -- This overrides the "Disabled" state from your region
    TextChatService.ChatInputBarConfiguration.Enabled = true
    TextChatService.ChatWindowConfiguration.Enabled = true
    
    -- Force the bar to link to the main channel
    local channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    TextChatService.ChatInputBarConfiguration.TargetTextChannel = channel
end

-- 2. CREATE A "BACKUP" BUTTON
-- If the official bar still won't show, this puts a button on your screen
local screenGui = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
local btn = Instance.new("TextButton", screenGui)
btn.Size = UDim2.new(0, 200, 0, 50)
btn.Position = UDim2.new(0.5, -100, 0, 50)
btn.Text = "Chat Status: Attempting Bypass..."
btn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

-- 3. MONITOR MESSAGES
TextChatService.OnIncomingMessage = function(message)
    if message.TextSource then
        print("[MONITOR]: " .. message.TextSource.Name .. ": " .. message.Text)
        btn.Text = "Last Msg: " .. message.Text
    end
end

task.spawn(forceUI)
btn.Text = "Bypass Active - Check Chat Bar"
btn.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
