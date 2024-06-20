frost_attack = class({})
LinkLuaModifier("modifier_frost_attack", "modifiers/generic/modifier_frost_attack", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_frost_attack_slow", "modifiers/generic/modifier_frost_attack_slow", LUA_MODIFIER_MOTION_NONE)

-- Sets the ability level to 1 when it's created
function frost_attack:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function frost_attack:GetIntrinsicModifierName()
	return "modifier_frost_attack"
end
