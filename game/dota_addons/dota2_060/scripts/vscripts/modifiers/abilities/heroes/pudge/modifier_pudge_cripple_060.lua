modifier_pudge_cripple_060 = class({})

-- Called when the modifier is created
function modifier_pudge_cripple_060:OnCreated(kv)
	self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
	self.attack_speed_reduction = self:GetAbility():GetSpecialValueFor("attack_speed_reduction")
	self.movement_speed_reduction = self:GetAbility():GetSpecialValueFor("movement_speed_reduction")
end

-- Called when the modifier is refreshed
function modifier_pudge_cripple_060:OnRefresh(kv)
	self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
	self.attack_speed_reduction = self:GetAbility():GetSpecialValueFor("attack_speed_reduction")
	self.movement_speed_reduction = self:GetAbility():GetSpecialValueFor("movement_speed_reduction")
end

-- Returns the events and properties our modifier affects
function modifier_pudge_cripple_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_pudge_cripple_060:GetModifierBaseDamageOutgoing_Percentage(params)
	return 0 - self.damage_reduction
end

-- Returns the value for the property
function modifier_pudge_cripple_060:GetModifierAttackSpeedBonus_Constant(params)
	return 0 - self.attack_speed_reduction
end

-- Returns the value for the property
function modifier_pudge_cripple_060:GetModifierMoveSpeedBonus_Percentage(params)
	return 0 - self.movement_speed_reduction
end

-- Returns the name of the particle
function modifier_pudge_cripple_060:GetEffectName()
	return "particles/units/heroes/hero_bane/bane_enfeeble.vpcf"
end

-- Returns the type of particle
function modifier_pudge_cripple_060:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

-- Makes the modifier dispellable
function modifier_pudge_cripple_060:IsPurgable()
	return true
end
