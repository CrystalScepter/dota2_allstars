item_bottle_096 = class({})
LinkLuaModifier( "modifier_item_bottle_096", "modifiers/items/modifier_item_bottle_096", LUA_MODIFIER_MOTION_NONE )

-- Applies the effect when the item is used
function item_bottle_096:OnSpellStart()
	
	-- Retrieves the hero who casted the item
	local caster = self:GetCaster()
	
	-- Retrieves the target that the item was cast onto
	local target = self:GetCursorTarget()
	
	-- Plays the corresponding sound
	self:GetCaster():EmitSound( "DOTA_Item.HealingSalve.Activate" )
	
	-- Creates the modifier on the target
	target:AddNewModifier( caster, self, "modifier_item_bottle_096", nil )
	
	-- Removes a charge from the item
	self:SpendCharge()
end
