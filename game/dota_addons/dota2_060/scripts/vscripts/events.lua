-- Called when an NPC spawns into the game
function GameMode:OnNPCSpawned(keys)
	-- Lists the NPCs that spawned
	local npc = EntIndexToHScript(keys.entindex)

	-- Checks whether a hero spawned, instead of a creep or another type of unit and checks whether it's the first time spawning
	if npc:IsRealHero() and not npc.firstSpawned then
		npc.firstSpawned = true
		self:OnHeroInGame(npc)
	end
end

-- Called by heroes when they spawn
function GameMode:OnHeroInGame(hero)
	-- Adds modifiers to the hero
	hero:AddNewModifier(hero, nil, "modifier_attributes", {})
	hero:AddNewModifier(hero, nil, "modifier_health_regen", {})

	-- Disables the stash
	hero:SetStashEnabled(false)
end
