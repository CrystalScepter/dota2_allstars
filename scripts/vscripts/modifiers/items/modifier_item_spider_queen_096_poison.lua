modifier_item_spider_queen_096_poison = class({})

-- Called when the modifier is created
function modifier_item_spider_queen_096_poison:OnCreated( kv )
	self.poison_damage = self:GetAbility():GetSpecialValueFor( "poison_damage" )
	self.interval = self:GetAbility():GetSpecialValueFor( "poison_interval" )
	
	if IsServer() then
		
		-- Start the interval for dealing damage
		self:StartIntervalThink( self.interval )
		return
	end
end

-- Applies the modifier effect every second
function modifier_item_spider_queen_096_poison:OnIntervalThink()
	
	-- Creates the damage table that will be used to deal damage to the target
	local damageTable = {
		victim = self:GetParent(),
		attacker = self:GetCaster(),
		damage = self.poison_damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self
	}
	
	-- Applies the damage based on the table configuration
	ApplyDamage( damageTable )	
end

-- Creates the tooltip modifier for the localization
function modifier_item_spider_queen_096_poison:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_TOOLTIP,
	}
	return funcs
end

-- Returns the tooltip modifier value
function modifier_item_spider_queen_096_poison:OnTooltip()
	return self.poison_damage
end

-- Turns the modifier into a debuff
function modifier_item_spider_queen_096_poison:IsDebuff()
	return true
end

-- Makes the modifier dispellable
function modifier_item_spider_queen_096_poison:IsPurgable()
	return true
end
