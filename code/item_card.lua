local mod = BELZEMOD

local swordman = Isaac.GetItemIdByName("Swordman")
local swordmanDamage = 1

function mod:EvaluateItems(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(swordman)
        local damageToAdd = swordmanDamage * itemCount
        player.Damage = player.Damage + damageToAdd
        -- add tear data to the player
    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateItems)

function mod:HasCostume(tear)
	local player = tear.Parent:ToPlayer()
	if player then
        if player:HasCollectible(swordman) then
			if tear.Variant == TearVariant.BLUE then
				tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/swordman_normal.png")
				tear:GetSprite():LoadGraphics()
				tear:GetData().swordmanTear = true
			elseif tear.Variant == TearVariant.CUPID_BLUE then
				tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/swordman_cupid.png")
				tear:GetSprite():LoadGraphics()
				tear:GetData().swordmanTear = true
			elseif tear.Variant == TearVariant.LOST_CONTACT then
				tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/swordman_lostcontact.png")
				tear:GetSprite():LoadGraphics()
				tear:GetData().swordmanTear = true
			elseif tear.Variant == TearVariant.PUPULA then
				tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/swordman_pupula.png")
				tear:GetSprite():LoadGraphics()
				tear:GetData().swordmanTear = true
			elseif tear.Variant == TearVariant.HUNGRY then
				tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/swordman_hungry.png")
				tear:GetSprite():LoadGraphics()
				tear:GetData().swordmanTear = true
			end
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.HasCostume)

