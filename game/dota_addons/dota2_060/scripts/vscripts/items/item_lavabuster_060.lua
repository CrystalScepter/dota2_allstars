item_lavabuster_060 = class({})
LinkLuaModifier(
	"modifier_item_lavabuster_060",
	"modifiers/items/modifier_item_lavabuster_060",
	LUA_MODIFIER_MOTION_NONE
)
LinkLuaModifier(
	"modifier_item_lavabuster_060_stun",
	"modifiers/items/modifier_item_lavabuster_060_stun",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function item_lavabuster_060:GetIntrinsicModifierName()
	return "modifier_item_lavabuster_060"
end

-- Applies the effect when the item is used
function item_lavabuster_060:OnSpellStart()
	local target = self:GetCursorTarget()
	local projectile_speed = self:GetSpecialValueFor("projectile_speed")
	local projectile = "particles/units/heroes/hero_nevermore/nevermore_base_attack.vpcf"

	-- Creates projectile info
	local info = {
		Source = self:GetCaster(),
		Target = target,
		Ability = self,
		iMoveSpeed = projectile_speed,
		EffectName = projectile,
		bDodgeable = true,
	}

	-- Releases the projectile
	ProjectileManager:CreateTrackingProjectile(info)

	-- Removes the item from the inventory
	self:SpendCharge()
end

-- Applies the effect when the projectile hits the target
function item_lavabuster_060:OnProjectileHit(hTarget, vLocation)
	local damage = self:GetSpecialValueFor("spell_damage")
	local stun_duration = self:GetSpecialValueFor("stun_duration")

	-- Creates damage information
	local damage = {
		victim = hTarget,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self,
	}

	-- Applies damage to the target
	ApplyDamage(damage)

	-- Adds the stun modifier
	hTarget:AddNewModifier(self:GetCaster(), self, "modifier_item_lavabuster_060_stun", { duration = stun_duration })
end
