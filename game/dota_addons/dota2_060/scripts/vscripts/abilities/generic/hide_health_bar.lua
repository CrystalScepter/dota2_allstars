hide_health_bar = class({})
LinkLuaModifier(
	"modifier_hide_health_bar",
	"modifiers/generic/modifier_hide_health_bar",
	LUA_MODIFIER_MOTION_NONE
)

-- Sets the ability level to 1 when it's created
function hide_health_bar:Spawn()
	if IsServer() then
		self:SetLevel(1)
	end
end

-- Returns the name of the modifier
function hide_health_bar:GetIntrinsicModifierName()
	return "modifier_hide_health_bar"
end
