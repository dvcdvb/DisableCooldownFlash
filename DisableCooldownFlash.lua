local hooked = false

local function DisableCooldownFlash(cooldown)
    if not cooldown then
        return
    end

    if type(cooldown.SetDrawBling) == "function" then
        pcall(cooldown.SetDrawBling, cooldown, false)
    end
end

local function HookCooldownMixin()
    if hooked then
        return
    end

    local cooldown = _G.ActionButton1Cooldown
    if not cooldown then
        return
    end

    local mt = getmetatable(cooldown)
    if not mt or type(mt.__index) ~= "table" then
        return
    end

    if type(mt.__index.SetCooldown) ~= "function" then
        return
    end

    hooksecurefunc(mt.__index, "SetCooldown", function(self)
        DisableCooldownFlash(self)
    end)

    hooked = true
end

local function DisableBartenderCooldowns()
    for i = 1, 10 do
        local bar = _G["BT4Bar" .. i]

        if bar and bar.buttons then
            for _, button in pairs(bar.buttons) do
                if button and button.cooldown then
                    DisableCooldownFlash(button.cooldown)
                end
            end
        end
    end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")

frame:SetScript("OnEvent", function()
    HookCooldownMixin()
    DisableBartenderCooldowns()
end)