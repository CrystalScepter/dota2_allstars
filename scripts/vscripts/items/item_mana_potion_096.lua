item_mana_potion_096 = class({})

-- Checks whether it's possible to use the item
function item_mana_potion_096:CastFilterResult()

	-- Verifies if the hero is full mana and prevents the item from being used
	if IsServer() then
		if self:GetCaster():GetManaPercent() == 100 then
			return UF_FAIL_CUSTOM
		end
	end
	
	-- Use the item is the hero is not full mana
	return UF_SUCCESS
end

-- Returns the custom error string from failing to use the item
function item_mana_potion_096:GetCustomCastError()
	return "#dota_hud_error_hero_is_full_mana"
end

-- Applies the effect when the item is used
function item_mana_potion_096:OnSpellStart()
	
	-- Retrieves the amount of mana restored by the item
	local mana_restore = self:GetSpecialValueFor( "mana_restore" )
	
	-- Plays the corresponding sound
	self:GetCaster():EmitSound( "DOTA_Item.ClarityPotion.Activate")
	
	-- Increases mana according to the value in npc_items_custom
	self:GetCaster():GiveMana( mana_restore )
	
	-- Removes the item from the inventory
	self:RemoveSelf()
end
