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
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_EVENT_ON_TAKEDAMAGE,
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
		MODIFIER_PROPERTY_MOVESPEED_LIMIT,
	}
	return funcs
end

-- Applies the effect upon finishing an attack
function modifier_attributes:OnAttack(params)
	-- Returns the owner of the modifier
	local unit = self:GetParent()

	-- If the attacker is not the owner of the modifier, return
	if params.attacker ~= unit then
		return
	end

	-- Adds the modifier to increase our movement speed if it's night time
	unit:AddNewModifier(unit, self, "modifier_night_movement_speed", { duration = 5 })
end

-- Applies the effect upon landing an attack
function modifier_attributes:OnAttackLanded(params)
	-- Returns the owner of the modifier
	local unit = self:GetParent()

	-- If the attacker is not the owner of the modifier, return
	if params.attacker ~= unit then
		return
	end

	-- Adds the modifier to increase our movement speed if it's night time
	unit:AddNewModifier(unit, self, "modifier_night_movement_speed", { duration = 5 })
end

-- Applies the effect upon taking damage
function modifier_attributes:OnTakeDamage(params)
	-- Declares the variables that are going to be used to determine whether we apply the modifier
	local unit = self:GetParent()
	local hero = params.attacker:IsHero()
	local creep_hero = params.attacker:IsCreepHero()
	local illusion = params.attacker:IsIllusion()

	-- If the attacked unit is not the owner of the modifier, return
	if params.unit ~= unit then
		return
	end

	-- Adds the modifier to increase our movement speed if it's night time
	if hero or creep_hero or illusion then
		unit:AddNewModifier(unit, self, "modifier_night_movement_speed", { duration = 5 })
	end
end

-- Returns the value for the property
function modifier_attributes:GetModifierMagicalResistanceDirectModification()
	return 0 - self:GetParent():GetIntellect(true) / 10
end

-- Returns the value for the property
function modifier_attributes:GetModifierMoveSpeedBonus_Constant()
	-- Checks whether it's day time
	if IsServer() then
		-- Declares the variables that are going to be used in the formula
		local daytime = GameRules:IsDaytime()
		local night_bonus
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
		self:SetStackCount(night_bonus)
	end

	local agility_bonus = self:GetParent():GetAgility() / 100

	return agility_bonus - self:GetStackCount()
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
