modifier_item_staff_of_wizardry_096 = class({})

-- Called when the modifier is created
function modifier_item_staff_of_wizardry_096:OnCreated ( kv )
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("bonus_intelligence")
end

-- Called when the modifier is refreshed
function modifier_item_staff_of_wizardry_096:OnRefresh ( kv )
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("bonus_intelligence")
end

-- Returns the events and properties our modifier affects
function modifier_item_staff_of_wizardry_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_staff_of_wizardry_096:GetModifierBonusStats_Intellect( params )
	return self.bonus_intelligence
end

-- Allows the modifier to stack
function modifier_item_staff_of_wizardry_096:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_staff_of_wizardry_096:IsHidden()
	return true
end
