modifier_pudge_giant_growth_060 = class({})

-- Called when the modifier is created
function modifier_pudge_giant_growth_060:OnCreated(kv)
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
	self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

-- Called when the modifier is refreshed
function modifier_pudge_giant_growth_060:OnRefresh(kv)
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
	self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

-- Returns the events and properties our modifier affects
function modifier_pudge_giant_growth_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

-- Returns the modifier states
function modifier_pudge_giant_growth_060:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

-- Returns the value for the property
function modifier_pudge_giant_growth_060:GetModifierPreAttack_BonusDamage(params)
	return self.bonus_damage
end

-- Returns the value for the property
function modifier_pudge_giant_growth_060:GetModifierHealthBonus(params)
	return self.bonus_health
end

-- Returns the value for the property
function modifier_pudge_giant_growth_060:GetModifierPhysicalArmorBonus(params)
	return self.bonus_armor
end

-- Returns the name of the particle
function modifier_pudge_giant_growth_060:GetEffectName()
	return "particles/items_fx/black_king_bar_avatar.vpcf"
end

-- Returns the type of particle
function modifier_pudge_giant_growth_060:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
