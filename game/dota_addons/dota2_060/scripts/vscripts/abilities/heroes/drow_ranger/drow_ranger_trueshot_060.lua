drow_ranger_trueshot_060 = class({})
LinkLuaModifier(
	"modifier_drow_ranger_trueshot_060",
	"modifiers/abilities/heroes/drow_ranger/modifier_drow_ranger_trueshot_060",
	LUA_MODIFIER_MOTION_NONE
)
LinkLuaModifier(
	"modifier_drow_ranger_trueshot_060_aura",
	"modifiers/abilities/heroes/drow_ranger/modifier_drow_ranger_trueshot_060_aura",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function drow_ranger_trueshot_060:GetIntrinsicModifierName()
	return "modifier_drow_ranger_trueshot_060"
end
