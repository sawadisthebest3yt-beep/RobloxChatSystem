-- [[ CUSTOM CHAT SYSTEM V1 ]] --

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Global Chat & VC System",
   LoadingTitle = "Fetching from GitHub...",
   LoadingSubtitle = "by YourName",
})

-- 1. THE WHITELIST (The "Paid" Check)
-- You can put your UserId here for now to test it
local PaidUsers = {
    [12345678] = true, -- Replace with your Roblox ID
    [1] = true,        -- Example ID
}

local function IsPaid(id)
    return PaidUsers[id] or false
end

-- 2. TEXT CHAT TAB
local ChatTab = Window:CreateTab("Chat Monitor", 4483362458)
ChatTab:CreateSection("Live Server Messages")

local ChatLog = ChatTab:CreateLabel("Listening for messages...")

-- This "sees" the messages in the current game
game:GetService("TextChatService").OnIncomingMessage = function(message)
    if message.TextSource then
        local name = message.TextSource.Name
        local msg = message.Text
        ChatLog:Set("Last: [" .. name .. "]: " .. msg)
    end
end

-- 3. VOICE CHAT TAB (PAID)
local VCTab = Window:CreateTab("Voice Chat", 4483362458)
VCTab:CreateSection("Premium Voice Features")

VCTab:CreateButton({
   Name = "Enable Voice Bridge",
   Callback = function()
       local userId = game.Players.LocalPlayer.UserId
       
       if IsPaid(userId) then
           Rayfield:Notify({
               Title = "Access Granted",
               Content = "Initializing Premium Voice Chat...",
               Duration = 5,
           })
           -- [Insert your Audio API logic here]
       else
           Rayfield:Notify({
               Title = "Access Denied",
               Content = "This is a paid feature. Please purchase access.",
               Duration = 5,
           })
       end
   end,
})

-- 4. UTILITY TAB
local UtilTab = Window:CreateTab("Settings", 4483362458)
UtilTab:CreateButton({
   Name = "Clear Chat Log",
   Callback = function()
       ChatLog:Set("Chat Cleared.")
   end,
})

Rayfield:Notify({
    Title = "Script Loaded!",
    Content = "Successfully connected to GitHub Repository.",
    Duration = 3,
})
