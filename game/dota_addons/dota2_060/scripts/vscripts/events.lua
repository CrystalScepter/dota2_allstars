-- Called when the game state has changed
function GameMode:OnGameRulesStateChange(keys)
	-- Catches the current game state
	local new_state = GameRules:State_Get()

	-- Called when the game is in progress
	if new_state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		-- Adds ancients onto the map
		local point_ancient_radiant = Entities:FindByName(nil, "npc_dota_ancient_radiant"):GetAbsOrigin()
		local point_ancient_dire = Entities:FindByName(nil, "npc_dota_ancient_dire"):GetAbsOrigin()
		CreateUnitByName("npc_dota_ancient_radiant_060", point_ancient_radiant, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_ancient_dire_060", point_ancient_dire, false, nil, nil, DOTA_TEAM_BADGUYS)

		-- Adds fountains onto the map
		local point_fountain_radiant = Entities:FindByName(nil, "npc_dota_fountain_radiant"):GetAbsOrigin()
		local point_fountain_dire = Entities:FindByName(nil, "npc_dota_fountain_dire"):GetAbsOrigin()
		CreateUnitByName("npc_dota_fountain_radiant_060", point_fountain_radiant, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_fountain_dire_060", point_fountain_dire, false, nil, nil, DOTA_TEAM_BADGUYS)

		-- Adds Radiant's filler buildings onto the map
		local point_filler_radiant_1 = Entities:FindByName(nil, "npc_dota_filler_radiant_1"):GetAbsOrigin()
		local point_filler_radiant_2 = Entities:FindByName(nil, "npc_dota_filler_radiant_2"):GetAbsOrigin()
		local point_filler_radiant_3 = Entities:FindByName(nil, "npc_dota_filler_radiant_3"):GetAbsOrigin()
		local point_filler_radiant_4 = Entities:FindByName(nil, "npc_dota_filler_radiant_4"):GetAbsOrigin()
		local point_filler_radiant_5 = Entities:FindByName(nil, "npc_dota_filler_radiant_5"):GetAbsOrigin()
		local point_filler_radiant_6 = Entities:FindByName(nil, "npc_dota_filler_radiant_6"):GetAbsOrigin()
		local point_filler_radiant_7 = Entities:FindByName(nil, "npc_dota_filler_radiant_7"):GetAbsOrigin()
		local point_filler_radiant_8 = Entities:FindByName(nil, "npc_dota_filler_radiant_8"):GetAbsOrigin()
		local point_filler_radiant_9 = Entities:FindByName(nil, "npc_dota_filler_radiant_9"):GetAbsOrigin()
		local point_filler_radiant_10 = Entities:FindByName(nil, "npc_dota_filler_radiant_10"):GetAbsOrigin()
		local point_filler_radiant_11 = Entities:FindByName(nil, "npc_dota_filler_radiant_11"):GetAbsOrigin()
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_1, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_2, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_3, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_4, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_5, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_6, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_7, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_8, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060", point_filler_radiant_9, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060_2", point_filler_radiant_10, false, nil, nil, DOTA_TEAM_GOODGUYS)
		CreateUnitByName("npc_dota_filler_radiant_060_2", point_filler_radiant_11, false, nil, nil, DOTA_TEAM_GOODGUYS)

		-- Adds Dire's filler buildings onto the map
		local point_filler_dire_1 = Entities:FindByName(nil, "npc_dota_filler_dire_1"):GetAbsOrigin()
		local point_filler_dire_2 = Entities:FindByName(nil, "npc_dota_filler_dire_2"):GetAbsOrigin()
		local point_filler_dire_3 = Entities:FindByName(nil, "npc_dota_filler_dire_3"):GetAbsOrigin()
		local point_filler_dire_4 = Entities:FindByName(nil, "npc_dota_filler_dire_4"):GetAbsOrigin()
		local point_filler_dire_5 = Entities:FindByName(nil, "npc_dota_filler_dire_5"):GetAbsOrigin()
		local point_filler_dire_6 = Entities:FindByName(nil, "npc_dota_filler_dire_6"):GetAbsOrigin()
		local point_filler_dire_7 = Entities:FindByName(nil, "npc_dota_filler_dire_7"):GetAbsOrigin()
		local point_filler_dire_8 = Entities:FindByName(nil, "npc_dota_filler_dire_8"):GetAbsOrigin()
		local point_filler_dire_9 = Entities:FindByName(nil, "npc_dota_filler_dire_9"):GetAbsOrigin()
		local point_filler_dire_10 = Entities:FindByName(nil, "npc_dota_filler_dire_10"):GetAbsOrigin()
		local point_filler_dire_11 = Entities:FindByName(nil, "npc_dota_filler_dire_11"):GetAbsOrigin()
		local point_filler_dire_12 = Entities:FindByName(nil, "npc_dota_filler_dire_12"):GetAbsOrigin()
		local point_filler_dire_13 = Entities:FindByName(nil, "npc_dota_filler_dire_13"):GetAbsOrigin()
		local point_filler_dire_14 = Entities:FindByName(nil, "npc_dota_filler_dire_14"):GetAbsOrigin()
		local point_filler_dire_15 = Entities:FindByName(nil, "npc_dota_filler_dire_15"):GetAbsOrigin()
		local point_filler_dire_16 = Entities:FindByName(nil, "npc_dota_filler_dire_16"):GetAbsOrigin()
		local point_filler_dire_17 = Entities:FindByName(nil, "npc_dota_filler_dire_17"):GetAbsOrigin()
		local point_filler_dire_18 = Entities:FindByName(nil, "npc_dota_filler_dire_18"):GetAbsOrigin()
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_1, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_2, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_3, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_4, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_5, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_6, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_7, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_8, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_9, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_10, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_11, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_12, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_13, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_14, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060", point_filler_dire_15, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060_2", point_filler_dire_16, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060_2", point_filler_dire_17, false, nil, nil, DOTA_TEAM_BADGUYS)
		CreateUnitByName("npc_dota_filler_dire_060_2", point_filler_dire_18, false, nil, nil, DOTA_TEAM_BADGUYS)
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
