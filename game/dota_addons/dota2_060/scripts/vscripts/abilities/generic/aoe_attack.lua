aoe_attack = class({})
LinkLuaModifier("modifier_aoe_attack", "modifiers/generic/modifier_aoe_attack", LUA_MODIFIER_MOTION_NONE)

-- Sets the ability level to 1 when it's created
function aoe_attack:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function aoe_attack:GetIntrinsicModifierName()
	return "modifier_aoe_attack"
end
