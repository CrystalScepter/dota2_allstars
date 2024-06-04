modifier_item_void_stone_096 = class({})

-- Called when the modifier is created
function modifier_item_void_stone_096:OnCreated( kv )
	self.bonus_mana_regen = self:GetAbility():GetSpecialValueFor( "bonus_mana_regen" )
end

-- Returns the events and properties our modifier affects
function modifier_item_void_stone_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_void_stone_096:GetModifierMPRegenAmplify_Percentage( params )
	return self.bonus_mana_regen
end

-- Allows the modifier to stack
function modifier_item_void_stone_096:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_void_stone_096:IsHidden()
	return true
end