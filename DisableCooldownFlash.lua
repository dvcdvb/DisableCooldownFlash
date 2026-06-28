local function DisableCooldownFlash(cooldown)
    if type(cooldown) ~= "table" then
        return
    end

    if type(cooldown.SetDrawBling) == "function" then
        pcall(cooldown.SetDrawBling, cooldown, false)
    end
end

local function DisableExistingCooldownFlashes()
    for _, object in pairs(_G) do
        if type(object) == "table" and type(object.SetDrawBling) == "function" then
            DisableCooldownFlash(object)
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    DisableExistingCooldownFlashes()

    local cooldown = _G.ActionButton1Cooldown
    local mt = cooldown and getmetatable(cooldown)
    local index = mt and mt.__index

    if type(index) == "table" and type(index.SetCooldown) == "function" then
        hooksecurefunc(index, "SetCooldown", function(self)
            DisableCooldownFlash(self)
        end)
    end
end)