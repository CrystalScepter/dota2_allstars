modifier_aoe_attack = class({})

-- Returns the events and properties our modifier affects
function modifier_aoe_attack:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Applies the effect upon landing an attack
function modifier_aoe_attack:OnAttacked(params)
	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	local units = FindUnitsInRadius(
		self:GetCaster():GetTeamNumber(),
		params.target:GetAbsOrigin(),
		nil,
		25,
		DOTA_UNIT_TARGET_TEAM_BOTH,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
		DOTA_UNIT_TARGET_FLAG_NONE,
		0,
		false
	)

	-- Deals damage to the surrounding units
	for _, unit in pairs(units) do
		ApplyDamage({
			attacker = params.attacker,
			victim = unit,
			ability = self,
			damage = 100,
			damage_type = DAMAGE_TYPE_PHYSICAL,
		})
	end
end

-- Prevents the modifier from showing up on the buff bar
function modifier_aoe_attack:IsHidden()
	return true
end
