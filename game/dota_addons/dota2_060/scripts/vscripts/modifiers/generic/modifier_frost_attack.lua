modifier_frost_attack = class({})

-- Called when the modifier is created
function modifier_frost_attack:OnCreated(kv)
	self.attack_speed_slow = 0 - self:GetAbility():GetSpecialValueFor("attack_speed_slow")
	self.movement_speed_slow = 0 - self:GetAbility():GetSpecialValueFor("movement_speed_slow")
	self.duration = self:GetAbility():GetSpecialValueFor("duration")
end

-- Returns the events and properties our modifier affects
function modifier_frost_attack:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	}
	return funcs
end

-- Applies the effect upon landing an attack
function modifier_frost_attack:OnAttackLanded(params)
	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	params.target:AddNewModifier(params.attacker, self, "modifier_frost_attack_slow", {
		duration = self.duration,
		attack_speed_slow = self.attack_speed_slow,
		movement_speed_slow = self.movement_speed_slow,
	})
end

-- Prevents the modifier from showing up on the buff bar
function modifier_frost_attack:IsHidden()
	return true
end
