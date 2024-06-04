item_doom_mantle_096 = class({})
LinkLuaModifier( "modifier_item_doom_mantle_096", "modifiers/items/modifier_item_doom_mantle_096", LUA_MODIFIER_MOTION_NONE )
LinkLuaModifier( "modifier_item_doom_mantle_096_burn", "modifiers/items/modifier_item_doom_mantle_096_burn", LUA_MODIFIER_MOTION_NONE )

-- Returns the name of the modifier
function item_doom_mantle_096:GetIntrinsicModifierName()
	return "modifier_item_doom_mantle_096"
end
