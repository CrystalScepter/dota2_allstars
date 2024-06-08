modifier_item_shadow_plate_060_corruption = class({})

-- Called when the modifier is created
function modifier_item_shadow_plate_060_corruption:OnCreated(kv)
	self.corruption_armor = 0 - self:GetAbility():GetSpecialValueFor("corruption_armor")
end

-- Returns the events and properties our modifier affects
function modifier_item_shadow_plate_060_corruption:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_shadow_plate_060_corruption:GetModifierPhysicalArmorBonus(params)
	return self.corruption_armor
end

-- Turns the modifier into a debuff
function modifier_item_shadow_plate_060_corruption:IsDebuff()
	return true
end

-- Makes the modifier dispellable
function modifier_item_shadow_plate_060_corruption:IsPurgable()
	return true
end
