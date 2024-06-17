modifier_item_bloodfury_060 = class({})

-- Called when the modifier is created
function modifier_item_bloodfury_060:OnCreated(kv)
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
	self.bonus_lifesteal = self:GetAbility():GetSpecialValueFor("bonus_lifesteal")
end

-- Returns the events and properties our modifier affects
function modifier_item_bloodfury_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_bloodfury_060:GetModifierPreAttack_BonusDamage(params)
	return self.bonus_damage
end

-- Applies the effect upon landing an attack
function modifier_item_bloodfury_060:OnAttacked(params)
	-- Retrieves the amount of bloodfuries in the hero's inventory
	local item_count = self:GetCaster():FindAllModifiersByName("modifier_item_bloodfury_060")

	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	-- If the attacker is in the same team as the target, return
	if params.target:GetTeamNumber() == self:GetCaster():GetTeamNumber() then
		return
	end

	-- If the target is a building, return
	if params.target:IsAncient() then
		return
	end

	-- Heals your hero for a percentage of the damage caused
	params.attacker:Heal(self.bonus_lifesteal * params.damage / 100 / #item_count, self:GetCaster())

	-- Renders the particle effect from lifestealing
	self:PlayEffects(params.attacker)
end

-- Renders the particle effect from lifestealing
function modifier_item_bloodfury_060:PlayEffects(target)
	-- Gets the particle effect
	local particle_cast = "particles/generic_gameplay/generic_lifesteal.vpcf"

	-- Creates the particle
	local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, target)

	-- Releases the particle
	ParticleManager:ReleaseParticleIndex(effect_cast)
end

-- Allows the modifier to stack
function modifier_item_bloodfury_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_bloodfury_060:IsHidden()
	return true
end
