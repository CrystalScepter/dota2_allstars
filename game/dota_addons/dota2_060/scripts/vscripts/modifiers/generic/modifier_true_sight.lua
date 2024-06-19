modifier_true_sight = class({})

-- Called when the modifier is created
function modifier_true_sight:OnCreated(kv)
	self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
end

-- Prevents the modifier from showing up on the buff bar
function modifier_true_sight:IsHidden()
	return true
end

-- Indicates that the modifier has an aura
function modifier_true_sight:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_true_sight:GetModifierAura()
	return "modifier_truesight"
end

-- Allows the aura to affect heroes with special flags
function modifier_true_sight:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

-- Restricts the aura to only allied units
function modifier_true_sight:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_true_sight:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Returns the radius of the aura
function modifier_true_sight:GetAuraRadius()
	return self.aura_radius
end
