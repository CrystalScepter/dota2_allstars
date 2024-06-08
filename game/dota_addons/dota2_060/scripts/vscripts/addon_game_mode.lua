-- Imports the following classes
require("gamemode")

-- Precaches the assets that are going to be used by the custom game
function Precache(context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_bane.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_legion_commander.vsndevts", context)
	PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_rattletrap.vsndevts", context)
end

-- Runs the following functions when you open the custom game
function Activate()
	-- Calls the gamemode class
	GameMode():InitGameMode()
end
