modifier_game_end_radiant = class({})

-- Returns the events and properties our modifier affects
function modifier_game_end_radiant:DeclareFunctions()
	local funcs = {
		MODIFIER_EVENT_ON_DEATH,
	}
	return funcs
end

-- Applies the effect upon death
function modifier_game_end_radiant:OnDeath(params)
	-- Returns if the killed unit isn't the parent of the modifier
	if params.unit ~= self:GetParent() then
		return
	end
	GameRules:SetGameWinner(DOTA_TEAM_GOODGUYS)
end

-- Prevents the modifier from showing up on the buff bar
function modifier_game_end_radiant:IsHidden()
	return true
end
