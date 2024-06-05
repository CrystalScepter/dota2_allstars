modifier_item_hyperstone_060 = class({})

-- Called when the modifier is created
function modifier_item_hyperstone_060:OnCreated( kv )
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
end

-- Returns the events and properties our modifier affects
function modifier_item_hyperstone_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_hyperstone_060:GetModifierAttackSpeedBonus_Constant( params )
	return self.bonus_attack_speed
end

-- Allows the modifier to stack
function modifier_item_hyperstone_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_hyperstone_060:IsHidden()
	return true
end
