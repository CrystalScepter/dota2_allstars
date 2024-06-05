modifier_item_bladeturn_necklace_060 = class({})

-- Called when the modifier is created
function modifier_item_bladeturn_necklace_060:OnCreated( kv )
	self.bonus_armor = self:GetAbility():GetSpecialValueFor( "bonus_armor" )
	self.bonus_evasion = self:GetAbility():GetSpecialValueFor( "bonus_evasion" )
	self.aura_radius = self:GetAbility():GetSpecialValueFor( "aura_radius" )
end

-- Returns the events and properties our modifier affects
function modifier_item_bladeturn_necklace_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_bladeturn_necklace_060:GetModifierPhysicalArmorBonus( params )
	return self.bonus_armor
end

-- Returns the value for the property
function modifier_item_bladeturn_necklace_060:GetModifierEvasion_Constant( params )
	return self.bonus_evasion
end

-- Allows the modifier to stack
function modifier_item_bladeturn_necklace_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_bladeturn_necklace_060:IsHidden()
	return true
end

-- Indicates that the item has an aura
function modifier_item_bladeturn_necklace_060:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_item_bladeturn_necklace_060:GetModifierAura()
	return "modifier_item_bladeturn_necklace_060_aura"
end

-- Restricts the aura to only allied units
function modifier_item_bladeturn_necklace_060:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_item_bladeturn_necklace_060:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Returns the radius of the aura
function modifier_item_bladeturn_necklace_060:GetAuraRadius()
	return self.aura_radius
end
