modifier_item_bottle_096 = class({})

-- Called when the modifier is created
function modifier_item_bottle_096:OnCreated( kv )
	self.heal = self:GetAbility():GetSpecialValueFor( "health_restore" )
	self.duration = self:GetAbility():GetSpecialValueFor( "duration" )
	self.interval = self:GetAbility():GetSpecialValueFor( "heal_interval" )
	
	if IsServer() then
		self:SetDuration( self.duration, false )
		
		-- Start the 1 second interval for healing
		self:StartIntervalThink( self.interval )
		
		-- Creates the bottle effect particle
		self.bottle_particle = ParticleManager:CreateParticle( "particles/items_fx/bottle.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetCaster() )
	end
end

-- Called when the modifier is destroyed
function modifier_item_bottle_096:OnDestroy()
	if IsServer() then
		
		-- Destroys the particle created when the item was used
		ParticleManager:DestroyParticle( self.bottle_particle, false )
		ParticleManager:ReleaseParticleIndex( self.bottle_particle )
	end
end

-- Applies the modifier effect every second
function modifier_item_bottle_096:OnIntervalThink()
	
	-- Calculates the heal amount per second
	local heal_amount = self.heal / self.duration
	
	-- Heals the target that the item was cast upon
	self:GetParent():Heal( heal_amount, self:GetAbility() )
end

-- Makes the modifier dispellable
function modifier_item_bottle_096:IsPurgable()
	return true
end

-- Returns the texture to be displayed in the buff bar in case the item runs out of charges
function modifier_item_bottle_096:GetTexture()
	return "item_bottle"
end
