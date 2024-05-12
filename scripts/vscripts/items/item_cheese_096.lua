item_cheese_096 = class({})

-- Checks whether it's possible to use the item
function item_cheese_096:CastFilterResult()

	-- Verifies if the hero is full health and mana and prevents the item from being used
	if IsServer() then
		if self:GetCaster():GetHealthPercent() == 100 and self:GetCaster():GetManaPercent() == 100 then
			return UF_FAIL_CUSTOM
		end
	end
	
	-- Use the item is the hero is not full on both health and mana
	return UF_SUCCESS
end

-- Returns the custom error string from failing to use the item
function item_cheese_096:GetCustomCastError()
	return "#dota_hud_error_hero_is_full_health_and_mana"
end

-- Applies the effect when the item is used
function item_cheese_096:OnSpellStart()

	-- Retrieves the amount to be healed by the item
	local health_restore = self:GetSpecialValueFor( "health_restore" )
	local mana_restore = self:GetSpecialValueFor( "mana_restore" )
	
	-- Plays the corresponding sound
	self:GetCaster():EmitSound( "DOTA_Item.Cheese.Activate")
	
	-- Increases health and mana according to the values in npc_items_custom
	self:GetCaster():Heal( health_restore, self )
	self:GetCaster():GiveMana( mana_restore )
	
	-- Removes the item from the inventory
	self:RemoveSelf()
end
