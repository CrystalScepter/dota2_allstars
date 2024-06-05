item_healing_potion_060 = class({})

-- Checks whether it's possible to use the item
function item_healing_potion_060:CastFilterResult()

	-- Verifies if the hero is full health and prevents the item from being used
	if IsServer() then
		if self:GetCaster():GetHealthPercent() == 100 then
			return UF_FAIL_CUSTOM
		end
	end
	
	-- Use the item is the hero is not full health
	return UF_SUCCESS
end

-- Returns the custom error string from failing to use the item
function item_healing_potion_060:GetCustomCastError()
	return "#dota_hud_error_hero_is_full_health"
end

-- Applies the effect when the item is used
function item_healing_potion_060:OnSpellStart()
	
	-- Retrieves the amount to be healed by the item
	local health_restore = self:GetSpecialValueFor( "health_restore" )
	
	-- Plays the corresponding sound
	self:GetCaster():EmitSound( "DOTA_Item.ClarityPotion.Activate" )
	
	-- Increases health according to the value in npc_items_custom
	self:GetCaster():Heal( health_restore, self )
	
	-- Removes the item from the inventory
	self:RemoveSelf()
end
