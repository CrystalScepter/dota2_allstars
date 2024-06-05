modifier_drow_ranger_sneak_attack_060 = class({})

-- Called when the modifier is created
function modifier_drow_ranger_sneak_attack_060:OnCreated( kv )
	self.bonus_damage = self:GetAbility():GetSpecialValueFor( "bonus_damage" )
	self.movement_speed = self:GetAbility():GetSpecialValueFor( "movement_speed" )
end

-- Called when the modifier is refreshed
function modifier_drow_ranger_sneak_attack_060:OnRefresh( kv )
	self.bonus_damage = self:GetAbility():GetSpecialValueFor( "bonus_damage" )
	self.movement_speed = self:GetAbility():GetSpecialValueFor( "movement_speed" )
end

-- Returns the events and properties our modifier affects
function modifier_drow_ranger_sneak_attack_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE_POST_CRIT,
		MODIFIER_PROPERTY_INVISIBILITY_LEVEL,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ABILITY_EXECUTED,
	}
	return funcs
end

-- Gives phasing and invisibility
function modifier_drow_ranger_sneak_attack_060:CheckState() 
	return {
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_INVISIBLE] = true,
	}
end

-- Returns the value for the property
function modifier_drow_ranger_sneak_attack_060:GetModifierMoveSpeedBonus_Percentage( params )
	return self.movement_speed
end

-- Returns the value for the property
function modifier_drow_ranger_sneak_attack_060:GetModifierPreAttack_BonusDamagePostCrit( params )
	if not params.target:IsBuilding() then
		return self.bonus_damage
	end
end

-- Returns the value for the property
function modifier_drow_ranger_sneak_attack_060:GetModifierInvisibilityLevel()
	return 1
end

-- Applies the effect upon finishing the attack cast point
function modifier_drow_ranger_sneak_attack_060:OnAttack( params )
	if IsServer() then
		if params.attacker == self:GetParent() then

			-- Remove the invisibility on attack
			self:Destroy()
		end
	end
end

-- Applies the effect upon ability cast
function modifier_drow_ranger_sneak_attack_060:OnAbilityExecuted( keys )
	if IsServer() then
		local parent =	self:GetParent()

		-- Remove the invisibility on cast
		if keys.unit == parent then
			self:Destroy()
		end
	end
end
