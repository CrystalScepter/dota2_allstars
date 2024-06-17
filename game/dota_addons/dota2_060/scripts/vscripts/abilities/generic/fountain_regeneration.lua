fountain_regeneration = class({})
LinkLuaModifier(
	"modifier_fountain_regeneration",
	"modifiers/generic/modifier_fountain_regeneration",
	LUA_MODIFIER_MOTION_NONE
)
LinkLuaModifier(
	"modifier_fountain_regeneration_aura",
	"modifiers/generic/modifier_fountain_regeneration_aura",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function fountain_regeneration:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function fountain_regeneration:GetIntrinsicModifierName()
	return "modifier_fountain_regeneration"
end
