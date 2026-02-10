local TCS = game:GetService("TextChatService")
local p = game.Players.LocalPlayer

-- This forces the chat to "Wake Up" now that you are verified
local function forceChat()
    TCS.ChatInputBarConfiguration.Enabled = true
    TCS.ChatWindowConfiguration.Enabled = true
    -- Force set the channel to the global one
    local channel = TCS:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
    TCS.ChatInputBarConfiguration.TargetTextChannel = channel
end

task.spawn(forceChat)
print("13+ Sync Complete. If bar is still missing, your Region is hard-locked.")
