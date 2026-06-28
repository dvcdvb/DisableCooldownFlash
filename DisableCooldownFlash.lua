local function DisableCooldownFlash(cooldown)
    if not cooldown then
        return
    end

    if cooldown.SetDrawBling and cooldown.GetObjectType and cooldown:GetObjectType() == "Cooldown" then
        pcall(cooldown.SetDrawBling, cooldown, false)
    end
end

hooksecurefunc("CooldownFrame_Set", function(cooldown)
    DisableCooldownFlash(cooldown)
end)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    for i = 1, 10 do
        local bar = _G["BT4Bar" .. i]

        if bar and bar.buttons then
            for _, button in pairs(bar.buttons) do
                DisableCooldownFlash(button.cooldown)
            end
        end
    end
end)