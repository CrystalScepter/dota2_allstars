hide_health_bar = class({})
LinkLuaModifier(
	"modifier_hide_health_bar",
	"modifiers/generic/modifier_hide_health_bar",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function hide_health_bar:GetIntrinsicModifierName()
	return "modifier_hide_health_bar"
end
