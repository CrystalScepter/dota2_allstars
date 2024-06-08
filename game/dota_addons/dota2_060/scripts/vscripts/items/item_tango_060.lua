item_tango_060 = class({})
LinkLuaModifier("modifier_item_tango_060", "modifiers/items/modifier_item_tango_060", LUA_MODIFIER_MOTION_NONE)

-- Applies the effect when the item is used
function item_tango_060:OnSpellStart()
	-- Retrieves the hero who casted the item
	local caster = self:GetCaster()

	-- Retrieves the target that the item was cast onto
	local target = self:GetCursorPosition()

	-- Plays the corresponding sound
	self:GetCaster():EmitSound("DOTA_Item.Tango.Activate")

	-- Creates the modifier on the target
	caster:AddNewModifier(caster, self, "modifier_item_tango_060", nil)

	-- Removes a charge from the item
	self:SpendCharge()

	-- Destroy the targeted tree
	GridNav:DestroyTreesAroundPoint(target, 1, false)
end
