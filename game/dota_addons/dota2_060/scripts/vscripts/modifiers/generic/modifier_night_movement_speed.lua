modifier_night_movement_speed = class({})

-- Returns the events and properties our modifier affects
function modifier_night_movement_speed:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
	}
	return funcs
end

-- Returns the value for the property
function modifier_night_movement_speed:GetModifierMoveSpeedBonus_Constant(params)
	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
		if daytime then
			self:SetStackCount(1)
		else
			self:SetStackCount(0)
		end
	end
	-- Declares the variables that are going to be used in the formula
	local night_bonus
	local hero = self:GetParent():IsHero()
	local creep_hero = self:GetParent():IsCreepHero()
	local illusion = self:GetParent():IsIllusion()

	-- Gives extra movement speed if the parent is a hero
	if self:GetStackCount() == 0 then
		if hero or creep_hero or illusion then
			night_bonus = 30
		else
			night_bonus = 15
		end
	else
		night_bonus = 0
	end

	return night_bonus
end

-- Prevents the modifier from showing up on the buff bar
function modifier_night_movement_speed:IsHidden()
	return true
end
