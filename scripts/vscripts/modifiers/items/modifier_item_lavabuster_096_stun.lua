modifier_item_lavabuster_096_stun = class({})

function modifier_item_lavabuster_096_stun:CheckState()
	local state = {
	    [MODIFIER_STATE_STUNNED] = true,
	}
	return state
end

function modifier_item_lavabuster_096_stun:IsDebuff()
	return true
end

function modifier_item_lavabuster_096_stun:IsStunDebuff()
	return true
end
