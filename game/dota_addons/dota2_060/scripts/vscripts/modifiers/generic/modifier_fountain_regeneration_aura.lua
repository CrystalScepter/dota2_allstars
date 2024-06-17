modifier_fountain_regeneration_aura = class({})

-- Called when the modifier is created
function modifier_fountain_regeneration_aura:OnCreated(kv)
	self.health_regen = self:GetParent():GetMaxHealth() * self:GetAbility():GetSpecialValueFor("health_regen") / 100
	self.mana_regen = self:GetParent():GetMaxMana() * self:GetAbility():GetSpecialValueFor("mana_regen") / 100
	if self:GetParent():IsAncient() then
		self:Destroy()
	end
end

-- Returns the events and properties our modifier affects
function modifier_fountain_regeneration_aura:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MANA_REGEN_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_fountain_regeneration_aura:GetModifierConstantHealthRegen(params)
	return self.health_regen
end

-- Returns the value for the property
function modifier_fountain_regeneration_aura:GetModifierConstantManaRegen(params)
	return self.mana_regen
end
