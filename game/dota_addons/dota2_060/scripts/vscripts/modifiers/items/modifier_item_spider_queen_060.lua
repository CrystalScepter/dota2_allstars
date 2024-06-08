modifier_item_spider_queen_060 = class({})
LinkLuaModifier(
	"modifier_item_spider_queen_060_poison",
	"modifiers/items/modifier_item_spider_queen_060_poison",
	LUA_MODIFIER_MOTION_NONE
)

-- Called when the modifier is created
function modifier_item_spider_queen_060:OnCreated(kv)
	self.bonus_strength = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_agility = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.bonus_intelligence = self:GetAbility():GetSpecialValueFor("all_attributes")
	self.duration_hero = self:GetAbility():GetSpecialValueFor("duration_hero")
	self.duration_creep = self:GetAbility():GetSpecialValueFor("duration_creep")
end

-- Returns the events and properties our modifier affects
function modifier_item_spider_queen_060:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
		MODIFIER_EVENT_ON_ATTACKED,
	}
	return funcs
end

-- Returns the value for the property
function modifier_item_spider_queen_060:GetModifierBonusStats_Strength(params)
	return self.bonus_strength
end

-- Returns the value for the property
function modifier_item_spider_queen_060:GetModifierBonusStats_Agility(params)
	return self.bonus_agility
end

-- Returns the value for the property
function modifier_item_spider_queen_060:GetModifierBonusStats_Intellect(params)
	return self.bonus_intelligence
end

-- Applies the effect upon landing an attack
function modifier_item_spider_queen_060:OnAttacked(params)
	-- Sets the default poison duration to what was defined in npc_items_custom
	local duration = self.duration_hero

	-- If the attacker is not the owner of the item, return
	if params.attacker ~= self:GetCaster() then
		return
	end

	-- If the target is a building, return
	if params.target:IsBuilding() then
		return
	end

	-- Modifies the duration to the creep value
	if params.target:IsCreep() then
		duration = self.duration_creep
	end

	-- Creates the modifier on the target
	params.target:AddNewModifier(
		self:GetParent(),
		self:GetAbility(),
		"modifier_item_spider_queen_060_poison",
		{ duration = duration }
	)
end

-- Allows the modifier to stack
function modifier_item_spider_queen_060:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevents the modifier from showing up on the buff bar
function modifier_item_spider_queen_060:IsHidden()
	return true
end
