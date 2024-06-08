modifier_attributes = class({})

-- Returns the events and properties our modifier affects
function modifier_attributes:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_attributes:GetModifierConstantHealthRegen()
	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
	end

	-- Retrieves the hero's name
	local hero = self:GetParent():GetUnitName()

	-- Sets the default base regen to 0
	local base_regen = 0

	-- Checks whether the hero is Drow Ranger and it's currently night time
	if hero == "npc_dota_hero_drow_ranger" and not daytime then
		base_regen = 0.5
	end

	return base_regen - self:GetParent():GetStrength() / 20
end

-- Returns the value for the property
function modifier_attributes:GetModifierMagicalResistanceDirectModification()
	return 0 - self:GetParent():GetIntellect(true) / 10
end

-- Returns the value for the property
function modifier_attributes:GetModifierMoveSpeedBonus_Constant()
	return self:GetParent():GetAgility() / 100
end

-- Returns the value for the property
function modifier_attributes:GetModifierMoveSpeed_Limit()
	return 400
end

-- Turns the modifier permanent
function modifier_attributes:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT
end

-- Prevents the modifier from showing up on the buff bar
function modifier_attributes:IsHidden()
	return true
end
