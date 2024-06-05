modifier_item_blade_of_alacrity_060 = class({})

-- Called when the modifier is created
function modifier_item_blade_of_alacrity_060:OnCreated( kv )
	self.bonus_agility = self:GetAbility():GetSpecialValueFor( "bonus_agility" )
end

-- Returns the events and properties our modifier affects
function modifier_item_blade_of_alacrity_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_blade_of_alacrity_060:GetModifierBonusStats_Agility( params )
	return self.bonus_agility
end

-- Allows the modifier to stack
function modifier_item_blade_of_alacrity_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_blade_of_alacrity_060:IsHidden()
	return true
end
