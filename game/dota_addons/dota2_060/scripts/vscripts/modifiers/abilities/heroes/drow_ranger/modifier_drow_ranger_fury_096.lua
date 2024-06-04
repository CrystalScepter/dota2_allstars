modifier_drow_ranger_fury_096 = class({})

-- Called when the modifier is created
function modifier_drow_ranger_fury_096:OnCreated( kv )
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor( "bonus_attack_speed" )
end

-- Returns the events and properties our modifier affects
function modifier_drow_ranger_fury_096:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_drow_ranger_fury_096:GetModifierAttackSpeedBonus_Constant( params )
	return self.bonus_attack_speed
end

-- Makes the modifier dispellable
function modifier_drow_ranger_fury_096:IsPurgable()
	return true
end