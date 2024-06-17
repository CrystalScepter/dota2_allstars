modifier_hide_health_bar = class({})

-- Returns the modifier states
function modifier_hide_health_bar:CheckState()
	return {
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
	}
end

-- Prevents the modifier from showing up on the buff bar
function modifier_hide_health_bar:IsHidden()
	return true
end
