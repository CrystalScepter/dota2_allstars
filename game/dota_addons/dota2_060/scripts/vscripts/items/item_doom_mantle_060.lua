item_doom_mantle_060 = class({})
LinkLuaModifier(
	"modifier_item_doom_mantle_060",
	"modifiers/items/modifier_item_doom_mantle_060",
	LUA_MODIFIER_MOTION_NONE
)
LinkLuaModifier(
	"modifier_item_doom_mantle_060_burn",
	"modifiers/items/modifier_item_doom_mantle_060_burn",
	LUA_MODIFIER_MOTION_NONE
)

-- Returns the name of the modifier
function item_doom_mantle_060:GetIntrinsicModifierName()
	return "modifier_item_doom_mantle_060"
end
