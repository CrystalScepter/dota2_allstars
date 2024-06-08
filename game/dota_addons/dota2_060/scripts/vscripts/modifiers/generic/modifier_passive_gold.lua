modifier_passive_gold = class({})

-- Called when the modifier is created
function modifier_passive_gold:OnCreated()
	-- Defines the amount of seconds for each gold tick and how much it gives
	self.gold_per_tick = 5
	self.gold_tick_time = 7

	-- Applies the effect periodically
	self:StartIntervalThink(self.gold_tick_time)
end

-- Called every x seconds based on what was defined in the OnCreated function
function modifier_passive_gold:OnIntervalThink()
	-- Gives gold to our hero
	if IsServer() then
		self:GetParent():ModifyGold(self.gold_per_tick, false, DOTA_ModifyGold_GameTick)
	end
end

-- Turns the modifier permanent
function modifier_passive_gold:GetAttributes()
	return MODIFIER_ATTRIBUTE_PERMANENT
end

-- Prevents the modifier from showing up on the buff bar
function modifier_passive_gold:IsHidden()
	return true
end
