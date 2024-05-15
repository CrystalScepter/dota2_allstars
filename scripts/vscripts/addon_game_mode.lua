-- Precaches the assets that are going to be used in the custom game
function Precache( context )
	PrecacheResource( "soundfile", "soundevents/game_sounds_heroes/game_sounds_rattletrap.vsndevts", context )
end

-- Runs the following functions when you open the custom game
function Activate()
	
	-- Commands with the intention of speeding up the process of getting into the game, for testing purposes while the addon is still in development
	-- Defaults to Radiant Side and goes into the hero selection immediately, jumps straight into the game after the hero has been chosen
	GameRules:EnableCustomGameSetupAutoLaunch(true)
	GameRules:SetCustomGameSetupAutoLaunchDelay(0)
    	GameRules:SetHeroSelectionTime(10)
	GameRules:SetStrategyTime(0)
	GameRules:SetShowcaseTime(0)
	
	-- Allows you to purchase items quickly for testing purposes
	GameRules:SetStartingGold(75000)
	
	-- Enable sandbox commands in DotA for testing purposes
	SendToConsole ( "sv_cheats 1" )
end
