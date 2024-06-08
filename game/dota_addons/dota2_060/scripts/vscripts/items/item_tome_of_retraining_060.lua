item_tome_of_retraining_060 = class({})

-- Applies the effect when the item is used
function item_tome_of_retraining_060:OnSpellStart()
	-- Retrieves some variables, such as hero's level and the modifiers being applied to it
	local hero = self:GetCaster()
	local level = hero:GetLevel()
	local modifiers = hero:FindAllModifiers()

	-- Sets the amount of abilities to be reset to level 0, note that DotA has a limited amount of ability slots
	-- It is set at 25 because that is the permanent bonus attributes from the talent tree
	local number_of_abilities = 25

	-- Stops the current action to prevent channeling abilities when they are level 0
	hero:Stop()

	-- Loops the code for every ability
	for i = 0, number_of_abilities do
		local ability = hero:GetAbilityByIndex(i)
		if ability and ability:GetLevel() > 0 then
			-- Deactivates orb effects
			if ability:GetAutoCastState() then
				ability:ToggleAutoCast()
			end

			-- Deactivates toggled abilities
			if ability:GetToggleState() then
				ability:ToggleAbility()
			end

			-- Remove modifiers from passive abilities
			for _, modifier in pairs(modifiers) do
				if modifier and modifier:GetAbility() == ability then
					modifier:Destroy()
				end
			end

			-- Sets the ability level to 0
			ability:SetLevel(0)
		end
	end

	-- Plays the corresponding sound
	self:GetCaster():EmitSound("Item.TomeOfKnowledge")

	-- Gives your ability points back
	self:GetCaster():SetAbilityPoints(level)

	-- Removes the item from the inventory
	self:RemoveSelf()
end
