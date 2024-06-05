-- Creates the global gamemode class
GameMode = class({})

-- Imports the following classes
require("libraries/timers")
require("events")

-- Initializes the game mode
function GameMode:InitGameMode()
	-- Gives access to game mode functions
	local GameMode = GameRules:GetGameModeEntity()

	-- Enable sandbox commands in DotA for testing purposes
	SendToConsole("sv_cheats 1")

	-- Commands with the intention of speeding up the process of getting into the game, for testing purposes while the addon is still in development
	-- Defaults to Radiant Side and goes into the hero selection immediately, jumps straight into the game after the hero has been chosen
	GameRules:EnableCustomGameSetupAutoLaunch(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0)
	GameRules:SetHeroSelectionTime(10)
	GameRules:SetStrategyTime(0)
	GameRules:SetShowcaseTime(0)

	GameMode:SetCustomGameForceHero("npc_dota_hero_drow_ranger")

	-- Disables loss of gold if no hero is picked during hero selection time
	GameMode:SetSelectionGoldPenaltyEnabled(false)

	-- Changes the default values for attributes
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 1)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 25)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0.05)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 1)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.3)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 2)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 1)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 15)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0.05)

	-- Sets the correct starting gold
	GameRules:SetStartingGold(500)

	-- Disables the recommended section for item builds
	GameMode:SetRecommendedItemsDisabled(true)

	-- Disables sticky items
	GameMode:SetStickyItemDisabled(true)

	-- Disables purchasing items with the stash
	GameMode:SetStashPurchasingDisabled(false)

	-- Disables being given a free Teleport Scroll on death
	GameMode:SetGiveFreeTPOnDeath(false)

	-- Disables neutral items
	GameMode:SetAllowNeutralItemDrops(false)

	-- Disables fog of war from automatically being uncovered
	GameMode:SetUnseenFogOfWarEnabled(true)

	-- Enables the day / night cycle
	GameMode:SetDaynightCycleDisabled(false)

	-- Disables backdoor protection
	GameMode:SetTowerBackdoorProtectionEnabled(false)

	-- Registers when an NPC spawns into the game
	ListenToGameEvent("npc_spawned", Dynamic_Wrap(self, "OnNPCSpawned"), self)

	-- Links the modifiers that are going to be used by our events
	LinkLuaModifier("modifier_attributes", "modifiers/global/modifier_attributes.lua", LUA_MODIFIER_MOTION_NONE)
	LinkLuaModifier("modifier_passive_gold", "modifiers/global/modifier_passive_gold.lua", LUA_MODIFIER_MOTION_NONE)
end
