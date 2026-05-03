-- ============================================
-- Y&B HUB - KEY LOADER SYSTEM
-- ============================================
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")

-- Check if key was provided via _G
if not _G.yb_key or _G.yb_key == "" then
    Players.LocalPlayer:Kick("NO KEY PROVIDED - Get one from Discord")
    return
end

print("[Y&B] Validating key: " .. _G.yb_key)

-- Your valid keys list (hardcoded for now, we'll improve this later)
local VALID_KEYS = {
    ["YB-60D4-531B-4F15"] = true,  -- Example key 1
    ["TEST-1234-5678-ABCD"] = true,  -- Example key 2
    -- Add more keys here as you generate them
}

-- Check if the key is valid
if not VALID_KEYS[_G.yb_key] then
    warn("[Y&B] Invalid key: " .. _G.yb_key)
    Players.LocalPlayer:Kick("NO KEY ACTIVE")
    return
end

-- Key is valid!
print("[Y&B] ✓ Key validated successfully!")
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Y&B HUB";
    Text = "Key accepted! Loading script...";
    Duration = 3;
})

wait(0.5)

-- Load the main script
local mainScriptUrl = "https://raw.githubusercontent.com/bloomer123/YB-HUB/main/main.lua"

local success, mainScript = pcall(function()
    return game:HttpGet(mainScriptUrl)
end)

if success and mainScript then
    print("[Y&B] Loading main script...")
    loadstring(mainScript)()
else
    warn("[Y&B] Failed to load main script")
    Players.LocalPlayer:Kick("Script load failed")
end
