modifier_item_circlet_096 = class({})

-- Called when the modifier is created
function modifier_item_circlet_096:OnCreated( kv )
	self.bonus_strength = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_agility = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("all_attributes")
end

-- Returns the events and properties our modifier affects
function modifier_item_circlet_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_circlet_096:GetModifierBonusStats_Strength( params )
	return self.bonus_strength
end

-- Returns the value for the property
function modifier_item_circlet_096:GetModifierBonusStats_Agility( params )
	return self.bonus_agility
end

-- Returns the value for the property
function modifier_item_circlet_096:GetModifierBonusStats_Intellect( params )
	return self.bonus_intelligence
end

-- Allows the modifier to stack
function modifier_item_circlet_096:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_circlet_096:IsHidden()
	return true
end
