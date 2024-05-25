modifier_attributes = class({})

-- Returns the events and properties our modifier affects
function modifier_attributes:DeclareFunctions()
    local funcs = {
        MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
        MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
        MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
    }
    return funcs
end

-- Returns the value for the property
function modifier_attributes:GetModifierConstantHealthRegen()
    return 0 - self:GetParent():GetStrength() / 20
end

-- Returns the value for the property
function modifier_attributes:GetModifierMagicalResistanceDirectModification()
    return 0 - self:GetParent():GetIntellect( true ) / 10
end

-- Returns the value for the property
function modifier_attributes:GetModifierMoveSpeedBonus_Constant()
    return self:GetParent():GetAgility() / 100
end

-- Prevents the modifier from showing up on the buff bar
function modifier_attributes:IsHidden()
	return true
end