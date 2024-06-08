modifier_item_doom_mantle_060 = class({})

-- Called when the modifier is created
function modifier_item_doom_mantle_060:OnCreated(kv)
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
	self.splash_damage = self:GetAbility():GetSpecialValueFor("splash_damage")
	self.splash_radius = self:GetAbility():GetSpecialValueFor("splash_radius")
end

-- Returns the events and properties our modifier affects
function modifier_item_doom_mantle_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_doom_mantle_060:GetModifierPreAttack_BonusDamage(params)
	return self.bonus_damage
end

-- Returns the value for the property
function modifier_item_doom_mantle_060:GetModifierPhysicalArmorBonus(params)
	return self.bonus_armor
end

-- Applies the effect upon landing an attack
function modifier_item_doom_mantle_060:OnAttacked(params)
	-- Retrieves the amount of doom mantles in the hero's inventory
	local item_count = self:GetCaster():FindAllModifiersByName("modifier_item_doom_mantle_060")

	-- Finds the enemy units within the splash radius
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),
		params.target:GetAbsOrigin(),
		nil,
		self.splash_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
		0,
		0,
		false
	)

	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	-- If the attacker is in the same team as the target, return
	if params.target:GetTeamNumber() == self:GetCaster():GetTeamNumber() then
		return
	end

	-- If the target is a building, return
	if params.target:IsBuilding() then
		return
	end

	-- Applies damage to the surrounding targets
	for _, enemy in pairs(enemies) do
		if enemy ~= params.target then
			ApplyDamage({
				attacker = params.attacker,
				victim = enemy,
				ability = self,
				damage = self.splash_damage / #item_count,
				damage_type = DAMAGE_TYPE_PURE,
			})
		end
	end
end

-- Allows the modifier to stack
function modifier_item_doom_mantle_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_doom_mantle_060:IsHidden()
	return true
end

-- Indicates that the item has an aura
function modifier_item_doom_mantle_060:IsAura()
	return true
end

-- Returns the name of the aura modifier
function modifier_item_doom_mantle_060:GetModifierAura()
	return "modifier_item_doom_mantle_060_burn"
end

-- Restricts the aura to only allied units
function modifier_item_doom_mantle_060:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allows the aura to affect only heroes and creeps (includes summons)
function modifier_item_doom_mantle_060:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Returns the radius of the aura
function modifier_item_doom_mantle_060:GetAuraRadius()
	return 0
end
