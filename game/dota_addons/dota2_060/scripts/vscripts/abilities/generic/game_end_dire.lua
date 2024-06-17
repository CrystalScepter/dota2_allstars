game_end_dire = class({})
LinkLuaModifier(
	"modifier_game_end_dire",
	"modifiers/generic/modifier_game_end_dire",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function game_end_dire:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function game_end_dire:GetIntrinsicModifierName()
	return "modifier_game_end_dire"
end
