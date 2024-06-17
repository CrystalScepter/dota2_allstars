game_end_radiant = class({})
LinkLuaModifier(
	"modifier_game_end_radiant",
	"modifiers/generic/modifier_game_end_radiant",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function game_end_radiant:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function game_end_radiant:GetIntrinsicModifierName()
	return "modifier_game_end_radiant"
end
