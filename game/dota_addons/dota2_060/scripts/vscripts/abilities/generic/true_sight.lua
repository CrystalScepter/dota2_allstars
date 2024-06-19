true_sight = class({})
LinkLuaModifier("modifier_true_sight", "modifiers/generic/modifier_true_sight", LUA_MODIFIER_MOTION_NONE)

-- Sets the ability level to 1 when it's created
function true_sight:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function true_sight:GetIntrinsicModifierName()
	return "modifier_true_sight"
end
