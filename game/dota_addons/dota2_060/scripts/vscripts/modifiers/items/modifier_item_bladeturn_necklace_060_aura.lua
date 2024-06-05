modifier_item_bladeturn_necklace_060_aura = class({})

-- Called when the modifier is created
function modifier_item_bladeturn_necklace_060_aura:OnCreated( kv )
	self.bonus_armor = self:GetAbility():GetSpecialValueFor( "aura_armor" )
end

-- Returns the events and properties our modifier affects
function modifier_item_bladeturn_necklace_060_aura:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_bladeturn_necklace_060_aura:GetModifierPhysicalArmorBonus( params )
	return self.bonus_armor
end
