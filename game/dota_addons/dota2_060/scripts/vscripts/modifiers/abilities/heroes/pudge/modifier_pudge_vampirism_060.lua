modifier_pudge_vampirism_060 = class({})

-- Called when the modifier is created
function modifier_pudge_vampirism_060:OnCreated(kv)
	self.bonus_lifesteal = self:GetAbility():GetSpecialValueFor("bonus_lifesteal")
end

-- Called when the modifier is refreshed
function modifier_pudge_vampirism_060:OnRefresh(kv)
	self.bonus_lifesteal = self:GetAbility():GetSpecialValueFor("bonus_lifesteal")
end

-- Returns the events and properties our modifier affects
function modifier_pudge_vampirism_060:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Applies the effect upon landing an attack
function modifier_pudge_vampirism_060:OnAttacked(params)
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
	params.attacker:Heal(self.bonus_lifesteal * params.damage / 100, self:GetCaster())

	-- Renders the particle effect from lifestealing
	self:PlayEffects(params.attacker)
end

-- Renders the particle effect from lifestealing
function modifier_pudge_vampirism_060:PlayEffects(target)
	-- Gets the particle effect
	local particle_cast = "particles/generic_gameplay/generic_lifesteal.vpcf"

	-- Creates the particle
	local effect_cast = ParticleManager:CreateParticle(particle_cast, PATTACH_ABSORIGIN_FOLLOW, target)

	-- Releases the particle
	ParticleManager:ReleaseParticleIndex(effect_cast)
end

-- Prevents the modifier from showing up on the buff bar
function modifier_pudge_vampirism_060:IsHidden()
	return true
end
