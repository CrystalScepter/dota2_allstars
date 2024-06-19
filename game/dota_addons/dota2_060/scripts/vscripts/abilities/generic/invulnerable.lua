invulnerable = class({})
LinkLuaModifier(
	"modifier_invulnerable",
	"modifiers/generic/modifier_invulnerable",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function invulnerable:GetIntrinsicModifierName()
	return "modifier_invulnerable"
end
