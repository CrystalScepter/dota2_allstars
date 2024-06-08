modifier_item_tango_060 = class({})

-- Called when the modifier is created
function modifier_item_tango_060:OnCreated(kv)
	self.heal = self:GetAbility():GetSpecialValueFor("health_restore")
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
	self.interval = self:GetAbility():GetSpecialValueFor("heal_interval")

	if IsServer() then
		self:SetDuration(self.duration, false)

		-- Start the 1 second interval for healing
		self:StartIntervalThink(self.interval)

		-- Creates the tango effect particle
		self.tango_particle = ParticleManager:CreateParticle(
			"particles/items_fx/healing_tango.vpcf",
			PATTACH_ABSORIGIN_FOLLOW,
			self:GetParent()
		)
	end
end

-- Called when the modifier is destroyed
function modifier_item_tango_060:OnDestroy()
	if IsServer() then
		-- Destroys the particle created when the item was used
		ParticleManager:DestroyParticle(self.tango_particle, false)
		ParticleManager:ReleaseParticleIndex(self.tango_particle)
	end
end

-- Applies the modifier effect every second
function modifier_item_tango_060:OnIntervalThink()
	-- Calculates the heal amount per second
	local heal_amount = self.heal / self.duration

	-- Heals the target that the item was cast upon
	self:GetParent():Heal(heal_amount, self:GetAbility())
end

-- Makes the modifier dispellable
function modifier_item_tango_060:IsPurgable()
	return true
end

-- Returns the texture to be displayed in the buff bar in case the item runs out of charges
function modifier_item_tango_060:GetTexture()
	return "item_tango"
end
