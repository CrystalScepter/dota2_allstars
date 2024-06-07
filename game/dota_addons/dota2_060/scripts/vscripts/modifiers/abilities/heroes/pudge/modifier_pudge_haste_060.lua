modifier_pudge_haste_060 = class({})

-- Called when the modifier is created
function modifier_pudge_haste_060:OnCreated(kv)
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

-- Called when the modifier is refreshed
function modifier_pudge_haste_060:OnRefresh(kv)
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

-- Returns the events and properties our modifier affects
function modifier_pudge_haste_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_pudge_haste_060:GetModifierMoveSpeedBonus_Percentage(params)
	return self.bonus_movement_speed
end

-- Makes the modifier dispellable
function modifier_pudge_haste_060:IsPurgable()
	return true
end
