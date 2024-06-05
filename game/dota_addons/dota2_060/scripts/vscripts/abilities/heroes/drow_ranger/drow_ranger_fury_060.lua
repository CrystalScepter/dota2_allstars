drow_ranger_fury_060 = class({})
LinkLuaModifier( "modifier_drow_ranger_fury_060", "modifiers/abilities/heroes/drow_ranger/modifier_drow_ranger_fury_060", LUA_MODIFIER_MOTION_NONE )

-- Applies the effect when the spell is used
function drow_ranger_fury_060:OnSpellStart()
	
	-- Retrieves the spell's owner and its duration
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor( "duration" )

	-- Creates the modifier on the hero
	caster:AddNewModifier( caster, self, "modifier_drow_ranger_fury_060", { duration = duration } )
end
