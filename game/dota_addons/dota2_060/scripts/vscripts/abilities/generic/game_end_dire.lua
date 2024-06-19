game_end_dire = class({})
LinkLuaModifier(
	"modifier_game_end_dire",
	"modifiers/generic/modifier_game_end_dire",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function game_end_dire:GetIntrinsicModifierName()
	return "modifier_game_end_dire"
end
