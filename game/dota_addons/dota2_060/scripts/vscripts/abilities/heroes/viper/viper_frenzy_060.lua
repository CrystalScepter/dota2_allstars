viper_frenzy_060 = class({})
LinkLuaModifier(
	"modifier_viper_frenzy_060",
	"modifiers/abilities/heroes/viper/modifier_viper_frenzy_060",
	LUA_MODIFIER_MOTION_NONE
)

-- Applies the effect when the spell is used
function viper_frenzy_060:OnSpellStart()
	-- Retrieves the spell's owner and its duration
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")

	-- Plays the corresponding sound
	EmitSoundOn("Hero_LegionCommander.PressTheAttack", caster)

	-- Creates the modifier on the hero
	caster:AddNewModifier(caster, self, "modifier_viper_frenzy_060", { duration = duration })
end
