deniable = class({})
LinkLuaModifier(
	"modifier_deniable",
	"modifiers/generic/modifier_deniable",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function deniable:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function deniable:GetIntrinsicModifierName()
	return "modifier_deniable"
end
