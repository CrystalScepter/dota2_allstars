modifier_attributes = class({})
LinkLuaModifier(
	"modifier_night_movement_speed",
	"modifiers/generic/modifier_night_movement_speed",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the events and properties our modifier affects
function modifier_attributes:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_TAKEDAMAGE,
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
	}
	return funcs
end

-- Applies the effect upon landing an attack
function modifier_attributes:OnAttack(params)
	-- Returns the owner of the modifier
	local unit = self:GetParent()

	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
	end

	-- If the attacker is not the owner of the modifier, return
	if params.attacker ~= unit then
		return
	end

	-- Adds the modifier to increase our movement speed if it's night time
	if not daytime then
		unit:AddNewModifier(unit, self, "modifier_night_movement_speed", { duration = 5 })
	end
end

-- Applies the effect upon taking damage
function modifier_attributes:OnTakeDamage(params)
	-- Declares the variables that are going to be used to determine whether we apply the modifier
	local unit = self:GetParent()
	local hero = params.attacker:IsHero()
	local creep_hero = params.attacker:IsCreepHero()
	local illusion = params.attacker:IsIllusion()

	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
	end

	-- If the attacked unit is not the owner of the modifier, return
	if params.unit ~= unit then
		return
	end

	-- Adds the modifier to increase our movement speed if it's night time
	if not daytime then
		if hero or creep_hero or illusion then
			unit:AddNewModifier(unit, self, "modifier_night_movement_speed", { duration = 5 })
		end
	end
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
	-- Checks whether it's day time
	if IsServer() then
		local daytime = GameRules:IsDaytime()
	end

	-- Declares the variables that are going to be used in the formula
	local night_bonus
	local agility_bonus = self:GetParent():GetAgility() / 100
	local hero = self:GetParent():IsHero()
	local creep_hero = self:GetParent():IsCreepHero()
	local illusion = self:GetParent():IsIllusion()

	-- Nullifies the night movement speed buff
	if not daytime then
		if hero or creep_hero or illusion then
			night_bonus = 30
		else
			night_bonus = 15
		end
	else
		night_bonus = 0
	end
	return agility_bonus - night_bonus
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
