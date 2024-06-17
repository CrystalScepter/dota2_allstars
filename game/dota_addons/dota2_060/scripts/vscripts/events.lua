-- Called when the game state has changed
function GameMode:OnGameRulesStateChange(keys)
	-- Catches the current game state
	local new_state = GameRules:State_Get()

	-- Called when the game is in progress
	if new_state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		local point_ancient_radiant = Entities:FindByName(nil, "npc_dota_ancient_radiant"):GetAbsOrigin()
		local point_ancient_dire = Entities:FindByName(nil, "npc_dota_ancient_dire"):GetAbsOrigin()
		local ancient_radiant = CreateUnitByName("npc_dota_ancient_radiant_060", point_ancient_radiant, false, nil, nil, DOTA_TEAM_GOODGUYS)
		local ancient_dire = CreateUnitByName("npc_dota_ancient_dire_060", point_ancient_dire, false, nil, nil, DOTA_TEAM_BADGUYS)
	end
end

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
