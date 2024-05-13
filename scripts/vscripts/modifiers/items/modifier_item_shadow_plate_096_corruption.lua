modifier_item_shadow_plate_096_corruption = class({})

-- Called when the modifier is created
function modifier_item_shadow_plate_096_corruption:OnCreated( kv )
	self.corruption_armor = 0 - self:GetAbility():GetSpecialValueFor( "corruption_armor" )
end

-- Creates the tooltip modifier for the localization
function modifier_item_shadow_plate_096_corruption:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_shadow_plate_096_corruption:GetModifierPhysicalArmorBonus( params )
	return self.corruption_armor
end

-- Turns the modifier into a debuff
function modifier_item_shadow_plate_096_corruption:IsDebuff()
	return true
end

-- Makes the modifier dispellable
function modifier_item_shadow_plate_096_corruption:IsPurgable()
	return true
end
