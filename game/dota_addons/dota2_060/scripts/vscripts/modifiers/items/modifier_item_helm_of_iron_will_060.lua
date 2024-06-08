modifier_item_helm_of_iron_will_060 = class({})

-- Called when the modifier is created
function modifier_item_helm_of_iron_will_060:OnCreated(kv)
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
	self.bonus_health_regen = self:GetAbility():GetSpecialValueFor("bonus_health_regen")
end

-- Returns the events and properties our modifier affects
function modifier_item_helm_of_iron_will_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_helm_of_iron_will_060:GetModifierPhysicalArmorBonus(params)
	return self.bonus_armor
end

-- Returns the value for the property
function modifier_item_helm_of_iron_will_060:GetModifierConstantHealthRegen(params)
	return self.bonus_health_regen
end

-- Allows the modifier to stack
function modifier_item_helm_of_iron_will_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_helm_of_iron_will_060:IsHidden()
	return true
end
