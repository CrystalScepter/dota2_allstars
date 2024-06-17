modifier_drow_ranger_marksmanship_060 = class({})

-- Called when the modifier is created
function modifier_drow_ranger_marksmanship_060:OnCreated()
	self.caster = self:GetCaster()
	self.ability = self:GetAbility()
	self.parent = self:GetParent()
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
end

-- Returns the events and properties our modifier affects
function modifier_drow_ranger_marksmanship_060:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_START,
		MODIFIER_EVENT_ON_ATTACK,
		MODIFIER_EVENT_ON_ATTACK_LANDED,
		MODIFIER_EVENT_ON_ATTACK_FAIL,
		MODIFIER_EVENT_ON_ORDER,
	}
end

-- Applies the effect upon starting the attack windup
function modifier_drow_ranger_marksmanship_060:OnAttackStart(keys)
	if IsServer() then
		local attacker = keys.attacker
		local target = keys.target

		-- Only applies on Drow Ranger's attacks
		if self.caster == attacker then
			-- Returns if an illusion has attacked
			if attacker:IsIllusion() then
				return nil
			end

			-- Creates the marksmanship variable to define whether our attack is going to be flagged or not
			local marksmanship_attack = true

			-- Shoots a normal arrow if the caster is silenced
			if self.caster:IsSilenced() then
				marksmanship_attack = false
			end

			-- Returns if the caster has no mana
			if not self.ability:IsFullyCastable() then
				marksmanship_attack = false
			end

			-- Returns if the target is not a creep
			if
				target:IsAncient()
				or target:IsClone()
				or target:IsCreepHero()
				or target:IsHero()
				or target:IsIllusion()
			then
				marksmanship_attack = false
			end

			-- Returns if we didn't attack via casting the ability or having auto cast turned on
			if self.parent:GetCurrentActiveAbility() ~= self.ability and not self.ability:GetAutoCastState() then
				marksmanship_attack = false
			end

			-- Checks whether our attack is flagged as Marksmanship
			if marksmanship_attack then
				-- Marks the attack as a Marksmanship arrow
				self.marksmanship_arrow_attack = true
				SetArrowAttackProjectile(self.caster, true)
			else
				-- Transforms back to the normal projectile
				self.marksmanship_arrow_attack = false
				SetArrowAttackProjectile(self.caster, false)
			end
		end
	end
end

-- Applies the effect upon finishing the attack cast point
function modifier_drow_ranger_marksmanship_060:OnAttack(keys)
	if IsServer() then
		local attacker = keys.attacker
		local target = keys.target

		-- Only applies on Drow Ranger's attacks
		if self.caster == attacker then
			-- Returns if it's not a marksmanship arrow
			if not self.marksmanship_arrow_attack then
				return nil
			end

			-- Plays the corresponding sound
			EmitSoundOn("Hero_DrowRanger.FrostArrows", self.caster)

			-- Spends mana upon arrow shot
			self.ability:UseResources(true, false, false, false)
		end
	end
end

-- Applies the effect upon landing an attack
function modifier_drow_ranger_marksmanship_060:OnAttackLanded(keys)
	if IsServer() then
		local attacker = keys.attacker
		local target = keys.target

		-- Only applies on Drow Ranger's attacks
		if self.caster == attacker then
			-- Checks whether the target is a creep and the arrow is flagged as Marksmanship
			if target:IsCreep() and self.marksmanship_arrow_attack then
				-- Creates damage information
				local damage = {
					victim = target,
					attacker = attacker,
					damage = self.bonus_damage,
					damage_type = DAMAGE_TYPE_PHYSICAL,
					ability = self.ability,
				}

				-- Applies damage to the target
				ApplyDamage(damage)
			end
		end
	end
end

-- Sets the arrow particle to the marksmanship one if the conditions are met
function SetArrowAttackProjectile(caster, marksmanship_attack)
	if marksmanship_attack then
		caster:SetRangedProjectileName("particles/units/heroes/hero_drow/drow_marksmanship_attack.vpcf")
	else
		caster:SetRangedProjectileName("particles/units/heroes/hero_drow/drow_base_attack.vpcf")
	end
end

-- Prevents the modifier from showing up on the buff bar
function modifier_drow_ranger_marksmanship_060:IsHidden()
	return true
end
