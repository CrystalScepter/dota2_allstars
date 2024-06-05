item_wand_of_negation_060 = class({})
LinkLuaModifier( "modifier_item_wand_of_negation_060_thinker", "modifiers/items/modifier_item_wand_of_negation_060_thinker", LUA_MODIFIER_MOTION_NONE )

-- Applies the effect when the item is used
function item_wand_of_negation_060:OnSpellStart()

	-- Retrieves some values used by the item
	local caster = self:GetCaster()
	local target_position = self:GetCursorPosition()
	local damage = self:GetSpecialValueFor( "damage" )
	local radius = self:GetSpecialValueFor( "radius" )
	
	-- Finds units within the splash radius
	local allies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), target_position, nil, radius, DOTA_UNIT_TARGET_TEAM_FRIENDLY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, 0, 0, false )
	local enemies = FindUnitsInRadius( self:GetCaster():GetTeamNumber(), target_position, nil, radius, DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP, 0, 0, false )
	
	-- Plays the corresponding sound
	caster:EmitSound( "DOTA_Item.VeilofDiscord.Activate" )
	
	-- Creates a dummy to cast the effect particle on
	local thinker = CreateModifierThinker( caster, self, "modifier_item_wand_of_negation_060_thinker", nil, target_position, caster:GetTeamNumber(), false )
	
	-- Creates the effect particle and spawns the dummy
	local particle_effect = ParticleManager:CreateParticle( "particles/items2_fx/veil_of_discord.vpcf", PATTACH_ABSORIGIN, thinker )
	ParticleManager:SetParticleControl( particle_effect, 0, target_position )
	ParticleManager:SetParticleControl( particle_effect, 1, Vector( radius, 1, 1 ) )
	ParticleManager:ReleaseParticleIndex( particle_effect )
	
	-- Removes debuffs from allied units
	for _,ally in pairs(allies) do
		ally:Purge( false, true, false, false, false )
	end
	
	-- Removes buffs from enemy units
	for _,enemy in pairs(enemies) do
		enemy:Purge( true, false, false, false, false )
		
		-- Deals damage to summoned units
		if enemy:IsSummoned() then
			ApplyDamage( { attacker = caster, victim = enemy, ability = self, damage = damage, damage_type = DAMAGE_TYPE_PURE } )
		end
	end
	
	-- Consumes a charge for using the item
	self:SpendCharge()
end
