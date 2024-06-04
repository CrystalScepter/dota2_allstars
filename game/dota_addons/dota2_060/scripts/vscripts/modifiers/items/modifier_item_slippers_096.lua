modifier_item_slippers_096 = class({})

-- Called when the modifier is created
function modifier_item_slippers_096:OnCreated( kv )
	self.bonus_agility = self:GetAbility():GetSpecialValueFor( "bonus_agility" )
end

-- Returns the events and properties our modifier affects
function modifier_item_slippers_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_slippers_096:GetModifierBonusStats_Agility( params )
	return self.bonus_agility
end

-- Allows the modifier to stack
function modifier_item_slippers_096:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_slippers_096:IsHidden()
	return true
end