modifier_viper_haste_060 = class({})

-- Called when the modifier is created
function modifier_viper_haste_060:OnCreated(kv)
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

-- Called when the modifier is refreshed
function modifier_viper_haste_060:OnRefresh(kv)
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

-- Returns the events and properties our modifier affects
function modifier_viper_haste_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_viper_haste_060:GetModifierAttackSpeedBonus_Constant(params)
	return self.bonus_attack_speed
end

-- Returns the value for the property
function modifier_viper_haste_060:GetModifierMoveSpeedBonus_Percentage(params)
	return self.bonus_movement_speed
end

-- Returns the name of the particle
function modifier_viper_haste_060:GetEffectName()
	return "particles/items2_fx/phase_boots.vpcf"
end

-- Returns the type of particle
function modifier_viper_haste_060:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

-- Makes the modifier dispellable
function modifier_viper_haste_060:IsPurgable()
	return true
end
