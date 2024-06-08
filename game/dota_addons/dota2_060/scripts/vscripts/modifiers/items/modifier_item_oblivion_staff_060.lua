modifier_item_oblivion_staff_060 = class({})

-- Called when the modifier is created
function modifier_item_oblivion_staff_060:OnCreated(kv)
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("bonus_intelligence")
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
	self.bonus_mana = self:GetAbility():GetSpecialValueFor("bonus_mana")
end

-- Returns the events and properties our modifier affects
function modifier_item_oblivion_staff_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MANA_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_oblivion_staff_060:GetModifierBonusStats_Intellect(params)
	return self.bonus_intelligence
end

-- Returns the value for the property
function modifier_item_oblivion_staff_060:GetModifierAttackSpeedBonus_Constant(params)
	return self.bonus_attack_speed
end

-- Returns the value for the property
function modifier_item_oblivion_staff_060:GetModifierManaBonus(params)
	return self.bonus_mana
end

-- Allows the modifier to stack
function modifier_item_oblivion_staff_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_oblivion_staff_060:IsHidden()
	return true
end
