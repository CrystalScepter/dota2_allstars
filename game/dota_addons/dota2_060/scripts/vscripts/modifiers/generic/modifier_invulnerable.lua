modifier_invulnerable = class({})

-- Returns the modifier states
function modifier_invulnerable:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
	}
end

-- Prevents the modifier from showing up on the buff bar
function modifier_invulnerable:IsHidden()
	return true
end
