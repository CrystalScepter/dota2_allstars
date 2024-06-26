modifier_item_buckler_060 = class({})

-- Called when the modifier is created
function modifier_item_buckler_060:OnCreated(kv)
	self.bonus_strength = self:GetAbility():GetSpecialValueFor("bonus_strength")
	self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
end

-- Returns the events and properties our modifier affects
function modifier_item_buckler_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_buckler_060:GetModifierBonusStats_Strength(params)
	return self.bonus_strength
end

-- Returns the value for the property
function modifier_item_buckler_060:GetModifierHealthBonus(params)
	return self.bonus_health
end

-- Returns the value for the property
function modifier_item_buckler_060:GetModifierPhysicalArmorBonus(params)
	return self.bonus_armor
end

-- Allows the modifier to stack
function modifier_item_buckler_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_buckler_060:IsHidden()
	return true
end
