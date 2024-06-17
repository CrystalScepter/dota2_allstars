modifier_deniable = class({})

-- Returns the modifier states
function modifier_deniable:CheckState()
	return {
		[MODIFIER_STATE_SPECIALLY_DENIABLE] = true,
	}
end

-- Prevents the modifier from showing up on the buff bar
function modifier_deniable:IsHidden()
	return true
end
