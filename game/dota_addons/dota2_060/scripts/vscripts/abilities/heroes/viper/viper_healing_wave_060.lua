viper_healing_wave_060 = class({})

-- Applies the effect when the spell is used
function viper_healing_wave_060:OnSpellStart()
	-- Retrieves spell data
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local bounces = self:GetSpecialValueFor("bounces")
	self.heal = self:GetSpecialValueFor("heal")
	self.bounce_reduction = self:GetSpecialValueFor("bounce_reduction")
	self.bounce_area = self:GetSpecialValueFor("bounce_area")
end
