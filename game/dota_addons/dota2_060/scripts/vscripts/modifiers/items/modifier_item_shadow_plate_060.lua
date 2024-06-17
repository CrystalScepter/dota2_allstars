modifier_item_shadow_plate_060 = class({})
LinkLuaModifier(
	"modifier_item_shadow_plate_060_corruption",
	"modifiers/items/modifier_item_shadow_plate_060_corruption",
	LUA_MODIFIER_MOTION_NONE
)

-- Called when the modifier is created
function modifier_item_shadow_plate_060:OnCreated(kv)
	self.bonus_strength = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_agility = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
	self.corruption_duration = self:GetAbility():GetSpecialValueFor("corruption_duration")
end

-- Returns the events and properties our modifier affects
function modifier_item_shadow_plate_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_shadow_plate_060:GetModifierBonusStats_Strength(params)
	return self.bonus_strength
end

-- Returns the value for the property
function modifier_item_shadow_plate_060:GetModifierBonusStats_Agility(params)
	return self.bonus_agility
end

-- Returns the value for the property
function modifier_item_shadow_plate_060:GetModifierBonusStats_Intellect(params)
	return self.bonus_intelligence
end

-- Returns the value for the property
function modifier_item_shadow_plate_060:GetModifierPhysicalArmorBonus(params)
	return self.bonus_armor
end

-- Applies the effect upon finishing the attack cast point
function modifier_item_shadow_plate_060:OnAttack(params)
	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	-- If the target is a building, return
	if params.target:IsAncient() then
		return
	end

	-- Checks whether the hero is ranged
	if params.attacker:IsRangedAttacker() then
		-- Defines the properties for the projectile
		local desolator_projectile = {
			Target = params.target,
			Source = params.attacker,
			Ability = self:GetAbility(),
			EffectName = "particles/items_fx/desolator_projectile.vpcf",
			iMoveSpeed = params.attacker:GetProjectileSpeed(),
			bIsAttack = true,
			bDodgeable = true,
		}

		-- Launch projectile
		ProjectileManager:CreateTrackingProjectile(desolator_projectile)

		-- Plays the sound for the projectile
		params.attacker:EmitSound("Item_Desolator.Target")
	end
end

-- Applies the effect upon landing an attack
function modifier_item_shadow_plate_060:OnAttacked(params)
	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	-- If the target is a building, return
	if params.target:IsAncient() then
		return
	end

	-- Creates the modifier on the target
	params.target:AddNewModifier(
		self:GetParent(),
		self:GetAbility(),
		"modifier_item_shadow_plate_060_corruption",
		{ duration = self.corruption_duration }
	)
end

-- Allows the modifier to stack
function modifier_item_shadow_plate_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_shadow_plate_060:IsHidden()
	return true
end
