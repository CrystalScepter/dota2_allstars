game_end_radiant = class({})
LinkLuaModifier(
	"modifier_game_end_radiant",
	"modifiers/generic/modifier_game_end_radiant",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function game_end_radiant:GetIntrinsicModifierName()
	return "modifier_game_end_radiant"
end
