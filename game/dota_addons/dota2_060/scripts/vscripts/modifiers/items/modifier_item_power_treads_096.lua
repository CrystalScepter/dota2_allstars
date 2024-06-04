modifier_item_power_treads_096 = class({})

-- Called when the modifier is created
function modifier_item_power_treads_096:OnCreated( kv )
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor( "bonus_movement_speed" )
end

-- Returns the events and properties our modifier affects
function modifier_item_power_treads_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_power_treads_096:GetModifierAttackSpeedBonus_Constant( params )
	return self.bonus_attack_speed
end

-- Returns the value for the property
function modifier_item_power_treads_096:GetModifierMoveSpeedBonus_Constant( params )
	return self.bonus_movement_speed
end

-- Allows the modifier to stack
function modifier_item_power_treads_096:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_power_treads_096:IsHidden()
	return true
end