modifier_fountain_regeneration = class({})

-- Called when the modifier is created
function modifier_fountain_regeneration:OnCreated(kv)
	self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
end

-- Prevents the modifier from showing up on the buff bar
function modifier_fountain_regeneration:IsHidden()
	return true
end

-- Indicates that the modifier has an aura
function modifier_fountain_regeneration:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_fountain_regeneration:GetModifierAura()
	return "modifier_fountain_regeneration_aura"
end

-- Restricts the aura to only allied units
function modifier_fountain_regeneration:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_fountain_regeneration:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Returns the radius of the aura
function modifier_fountain_regeneration:GetAuraRadius()
	return self.aura_radius
end
