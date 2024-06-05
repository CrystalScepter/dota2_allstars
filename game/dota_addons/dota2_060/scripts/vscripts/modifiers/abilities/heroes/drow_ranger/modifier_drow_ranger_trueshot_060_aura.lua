modifier_drow_ranger_trueshot_060_aura = class({})

-- Called when the modifier is created
function modifier_drow_ranger_trueshot_060_aura:OnCreated( kv )
	self.damage_bonus = self:GetAbility():GetSpecialValueFor( "damage_bonus" )
end

-- Called when the modifier is refreshed
function modifier_drow_ranger_trueshot_060_aura:OnRefresh( kv )
	self.damage_bonus = self:GetAbility():GetSpecialValueFor( "damage_bonus" )
end

-- Returns the events and properties our modifier affects
function modifier_drow_ranger_trueshot_060_aura:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
	}
	return funcs
end

-- Returns the value for the property
function modifier_drow_ranger_trueshot_060_aura:GetModifierBaseDamageOutgoing_Percentage( params )
    return self.damage_bonus
end