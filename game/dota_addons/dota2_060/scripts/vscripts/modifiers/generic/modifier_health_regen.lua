modifier_health_regen = class({})

-- Returns the events and properties our modifier affects
function modifier_health_regen:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_health_regen:GetModifierConstantHealthRegen()
	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
		if daytime then
			self:SetStackCount(1)
		else
			self:SetStackCount(0)
		end
	end

	-- Retrieves the hero's name
	local hero = self:GetParent():GetUnitName()

	-- Sets the default base regen to 0
	local base_regen = 0

	-- Checks whether the hero is Drow Ranger and it's currently night time
	if hero == "npc_dota_hero_drow_ranger" and self:GetStackCount() == 0 then
		base_regen = 0.5
	end

	return base_regen - self:GetParent():GetStrength() / 20
end

-- Turns the modifier permanent
function modifier_health_regen:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT
end

-- Prevents the modifier from showing up on the buff bar
function modifier_health_regen:IsHidden()
	return true
end
