hull_size_128 = class({})

-- Sets the ability level to 1 when it's created and the hull size of the unit to 128
function hull_size_128:Spawn()
	if IsServer() then
		self:GetCaster():SetHullRadius(128)
	end
end
