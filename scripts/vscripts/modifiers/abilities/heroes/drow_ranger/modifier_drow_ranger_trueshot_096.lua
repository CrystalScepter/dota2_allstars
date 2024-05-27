modifier_drow_ranger_trueshot_096 = class({})

-- Called when the modifier is created
function modifier_drow_ranger_trueshot_096:OnCreated( kv )
	self.aura_radius = self:GetAbility():GetSpecialValueFor( "aura_radius" )
end

-- Called when the modifier is created
function modifier_drow_ranger_trueshot_096:OnRefresh( kv )
	self.aura_radius = self:GetAbility():GetSpecialValueFor( "aura_radius" )
end

-- Prevents the modifier from showing up on the buff bar
function modifier_drow_ranger_trueshot_096:IsHidden()
	return true
end

-- Indicates that the item has an aura
function modifier_drow_ranger_trueshot_096:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_drow_ranger_trueshot_096:GetModifierAura()
	return "modifier_drow_ranger_trueshot_096_aura"
end

-- Restricts the aura to only allied units
function modifier_drow_ranger_trueshot_096:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_drow_ranger_trueshot_096:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Filters out units that aren't ranged
function modifier_drow_ranger_trueshot_096:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_RANGED_ONLY
end

-- Returns the radius of the aura
function modifier_drow_ranger_trueshot_096:GetAuraRadius()
	return self.aura_radius
end
