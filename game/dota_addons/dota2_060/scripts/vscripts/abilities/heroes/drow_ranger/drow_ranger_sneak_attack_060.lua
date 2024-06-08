drow_ranger_sneak_attack_060 = class({})
LinkLuaModifier(
	"modifier_drow_ranger_sneak_attack_060",
	"modifiers/abilities/heroes/drow_ranger/modifier_drow_ranger_sneak_attack_060",
	LUA_MODIFIER_MOTION_NONE
)

-- Applies the effect when the spell is used
function drow_ranger_sneak_attack_060:OnSpellStart()
	-- Retrieves the spell's owner and its respective particle
	local caster = self:GetCaster()
	local particle_invisibility = "particles/generic_hero_status/status_invisibility_start.vpcf"

	-- Retrieves the spell's duration and fade time
	local duration = self:GetSpecialValueFor("duration")
	local fade_time = self:GetSpecialValueFor("fade_time")

	-- Plays the corresponding sound
	EmitSoundOn("DOTA_Item.InvisibilitySword.Activate", caster)

	-- Creates a timer based on fade time for the spell to start
	Timers:CreateTimer(fade_time, function()
		-- Creates a particle when you become invisible
		local particle_invisibility_start =
			ParticleManager:CreateParticle(particle_invisibility, PATTACH_ABSORIGIN, caster)
		ParticleManager:SetParticleControl(particle_invisibility_start, 0, caster:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(particle_invisibility_start)

		-- Adds the modifier to Drow Ranger
		caster:AddNewModifier(caster, self, "modifier_drow_ranger_sneak_attack_060", { duration = duration })
	end)
end
