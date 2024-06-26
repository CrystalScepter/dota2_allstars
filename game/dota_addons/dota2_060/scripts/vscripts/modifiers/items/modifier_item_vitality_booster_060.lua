modifier_item_vitality_booster_060 = class({})

-- Called when the modifier is created
function modifier_item_vitality_booster_060:OnCreated(kv)
	self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
end

-- Returns the events and properties our modifier affects
function modifier_item_vitality_booster_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_vitality_booster_060:GetModifierHealthBonus(params)
	return self.bonus_health
end

-- Allows the modifier to stack
function modifier_item_vitality_booster_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_vitality_booster_060:IsHidden()
	return true
end
