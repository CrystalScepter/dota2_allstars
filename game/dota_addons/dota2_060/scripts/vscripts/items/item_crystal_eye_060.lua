item_crystal_eye_060 = class({})
LinkLuaModifier( "modifier_item_crystal_eye_060_thinker", "modifiers/items/modifier_item_crystal_eye_060_thinker", LUA_MODIFIER_MOTION_NONE )

-- Applies the effect when the item is used
function item_crystal_eye_060:OnSpellStart()

	-- Retrieves some values used by the item
	local caster = self:GetCaster()
	local target_position = self:GetCursorPosition()
	local duration = self:GetSpecialValueFor( "duration" )
	local radius = self:GetSpecialValueFor( "radius" )
	
	-- Creates a dummy to reveal invisible enemy units in the area
	local thinker = CreateModifierThinker( caster, self, "modifier_item_crystal_eye_060_thinker", { duration = duration, radius = radius }, target_position, caster:GetTeamNumber(), false )
	
	-- Reveals part of the fog of war
	AddFOWViewer( caster:GetTeamNumber(), target_position, radius, duration, false )
	
	-- Plays the corresponding sound
	caster:EmitSound( "Hero_Rattletrap.Rocket_Flare.Explode" )
	
	-- Creates the effect particle and spawns the dummy
	local explosion_particle = ParticleManager:CreateParticle( "particles/items_fx/dust_of_appearance.vpcf", PATTACH_ABSORIGIN, thinker )
	ParticleManager:SetParticleControl( explosion_particle, 1, Vector( radius, radius, radius) )
end
