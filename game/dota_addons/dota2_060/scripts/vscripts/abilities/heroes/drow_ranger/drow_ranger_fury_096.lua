drow_ranger_fury_096 = class({})
LinkLuaModifier( "modifier_drow_ranger_fury_096", "modifiers/abilities/heroes/drow_ranger/modifier_drow_ranger_fury_096", LUA_MODIFIER_MOTION_NONE )

-- Applies the effect when the spell is used
function drow_ranger_fury_096:OnSpellStart()
	
	-- Retrieves the spell's owner and its duration
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor( "duration" )

	-- Creates the modifier on the hero
	caster:AddNewModifier( caster, self, "modifier_drow_ranger_fury_096", { duration = duration } )
end
