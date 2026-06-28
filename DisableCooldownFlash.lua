local CooldownMixin = getmetatable(ActionButton1Cooldown).__index

hooksecurefunc(CooldownMixin, "SetCooldown", function(self)
    if self.SetDrawBling then
        self:SetDrawBling(false)
    end
end)