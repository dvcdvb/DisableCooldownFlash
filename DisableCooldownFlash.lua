local function DisableCooldownFlash(cooldown)
    if cooldown and cooldown.SetDrawBling then
        cooldown:SetDrawBling(false)
    end
end

hooksecurefunc("CooldownFrame_Set", function(cooldown)
    DisableCooldownFlash(cooldown)
end)

local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function()
    for _, bar in pairs({
        _G.BT4Bar1,
        _G.BT4Bar2,
        _G.BT4Bar3,
        _G.BT4Bar4,
        _G.BT4Bar5,
        _G.BT4Bar6,
        _G.BT4Bar7,
        _G.BT4Bar8,
        _G.BT4Bar9,
        _G.BT4Bar10,
    }) do
        if bar and bar.buttons then
            for _, button in pairs(bar.buttons) do
                if button.cooldown then
                    DisableCooldownFlash(button.cooldown)
                end
            end
        end
    end
end)