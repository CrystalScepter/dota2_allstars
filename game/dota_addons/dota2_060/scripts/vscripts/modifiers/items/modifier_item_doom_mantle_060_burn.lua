modifier_item_doom_mantle_060_burn = class({})

-- Called when the modifier is created
function modifier_item_doom_mantle_060_burn:OnCreated(kv)
	self.aura_damage = self:GetAbility():GetSpecialValueFor("aura_damage")
	self.aura_radius = self:GetAbility():GetSpecialValueFor("aura_radius")
	self.aura_interval = self:GetAbility():GetSpecialValueFor("aura_interval")

	if IsServer() then
		-- Start the 1 second interval for dealing damage
		self:StartIntervalThink(self.aura_interval)
	end
end

-- Applies the modifier effect every second
function modifier_item_doom_mantle_060_burn:OnIntervalThink()
	-- Finds the enemy units within the aura radius
	local enemies = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),
		self:GetParent():GetAbsOrigin(),
		nil,
		self.aura_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
		DOTA_UNIT_TARGET_FLAG_NOT_ANCIENTS,
		0,
		false
	)

	-- Applies damage to the surrounding targets and creates the particle on the target
	for _, enemy in pairs(enemies) do
		ApplyDamage({
			attacker = self:GetCaster(),
			victim = enemy,
			ability = self,
			damage = self.aura_damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
		})
	end
end
