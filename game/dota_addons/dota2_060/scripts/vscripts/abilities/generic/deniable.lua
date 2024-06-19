deniable = class({})
LinkLuaModifier(
	"modifier_deniable",
	"modifiers/generic/modifier_deniable",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function deniable:GetIntrinsicModifierName()
	return "modifier_deniable"
end
