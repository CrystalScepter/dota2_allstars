pudge_giant_growth_060 = class({})
LinkLuaModifier(
	"modifier_pudge_giant_growth_060",
	"modifiers/abilities/heroes/pudge/modifier_pudge_giant_growth_060",
	LUA_MODIFIER_MOTION_NONE
)

-- Applies the effect when the spell is used
function pudge_giant_growth_060:OnSpellStart()
	-- Retrieves the spell's owner and its duration
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")

	-- Plays the corresponding sound
	EmitSoundOn("DOTA_Item.BlackKingBar.Activate", caster)

	-- Creates the modifier on the hero
	caster:AddNewModifier(caster, self, "modifier_pudge_giant_growth_060", { duration = duration })
end
