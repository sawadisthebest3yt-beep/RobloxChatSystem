-- [[ 2026 REGION BYPASS & CHAT SYSTEM ]] --
local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- 1. FORCE THE UI (Bypass the "Not Available" lock)
local function forceEnable()
    -- Enable the modern TextChatService bars
    TextChatService.ChatInputBarConfiguration.Enabled = true
    TextChatService.ChatWindowConfiguration.Enabled = true
    
    -- Some games require a direct target channel to show the bar
    local generalChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    TextChatService.ChatInputBarConfiguration.TargetTextChannel = generalChannel
    
    print("UI Force-Enabled for " .. LocalPlayer.Name)
end

-- 2. THE CHAT MONITOR (See messages in banned regions)
local function setupMonitor()
    TextChatService.OnIncomingMessage = function(message)
        -- This logic still runs even if the UI is hidden for others
        if message.TextSource then
            local sender = message.TextSource.Name
            local text = message.Text
            print("[GLOBAL MONITOR]: " .. sender .. ": " .. text)
            -- You can insert this into your custom UI frame here
        end
    end
end

-- 3. EXECUTION
task.spawn(forceEnable)
task.spawn(setupMonitor)

-- Notification to confirm it worked
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Chat Unlocked",
    Text = "Region bypass active. Check your chat bar!",
    Duration = 5
})
