modifier_frost_attack_slow = class({})

-- Called when the modifier is created
function modifier_frost_attack_slow:OnCreated(kv)
	self.attack_speed_slow = kv.attack_speed_slow
	self.movement_speed_slow = kv.movement_speed_slow
end

-- Returns the events and properties our modifier affects
function modifier_frost_attack_slow:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_frost_attack_slow:GetModifierAttackSpeedBonus_Constant(params)
	return self.attack_speed_slow
end

-- Returns the value for the property
function modifier_frost_attack_slow:GetModifierMoveSpeedBonus_Percentage(params)
	return self.movement_speed_slow
end

-- Makes the modifier dispellable
function modifier_frost_attack_slow:IsPurgable()
	return true
end
