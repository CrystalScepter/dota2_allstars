pudge_cripple_060 = class({})
LinkLuaModifier(
	"modifier_pudge_cripple_060",
	"modifiers/abilities/heroes/pudge/modifier_pudge_cripple_060",
	LUA_MODIFIER_MOTION_NONE
)

-- Applies the effect when the spell is used
function pudge_cripple_060:OnSpellStart()
	-- Retrieves the owner, target and spell duration
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local duration = self:GetSpecialValueFor("duration")

	-- Plays the corresponding sound
	EmitSoundOn("Hero_Bane.Enfeeble", caster)

	-- Creates the modifier on the target
	target:AddNewModifier(caster, self, "modifier_pudge_cripple_060", { duration = duration })
end
