invulnerable = class({})
LinkLuaModifier(
	"modifier_invulnerable",
	"modifiers/generic/modifier_invulnerable",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function invulnerable:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function invulnerable:GetIntrinsicModifierName()
	return "modifier_invulnerable"
end
