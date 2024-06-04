modifier_item_crystal_eye_096_thinker = class({})

-- Called when the modifier is created
function modifier_item_crystal_eye_096_thinker:OnCreated( kv )
	self.radius = self:GetAbility():GetSpecialValueFor( "radius" )
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_crystal_eye_096_thinker:IsHidden()
	return true
end

-- Indicates that the item has an aura
function modifier_item_crystal_eye_096_thinker:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_item_crystal_eye_096_thinker:GetModifierAura()
	return "modifier_truesight"
end

-- Restricts the aura to only allied units
function modifier_item_crystal_eye_096_thinker:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

-- Allows the aura to affect heroes with special flags
function modifier_item_crystal_eye_096_thinker:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_item_crystal_eye_096_thinker:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Returns the radius of the aura
function modifier_item_crystal_eye_096_thinker:GetAuraRadius()
	return self.radius
end
