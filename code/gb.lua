local mod = BELZEMOD

function mod:EvaluateItems(player, cacheFlags)
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?"))
        local damageToAdd = 500 - player.Damage * itemCount
        player.Damage = player.Damage + damageToAdd
        -- Add tear data to the player
        if itemCount > 0 then
            player.tearOffset = Vector(0, 0)
        end
    end
end 

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateItems)



function mod:spawnItem()
    local game = Game()
    local level = game:GetLevel()
    local player = Isaac.GetPlayer(0)
    local pos = Isaac.GetFreeNearPosition(player.Position, 50)
    if level:GetAbsoluteStage() == 1 and level.EnterDoor == -1 and player.FrameCount == 1 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, Isaac.GetItemIdByName("Game Breaker?"), pos, pos, player)
    end
end

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.spawnItem)
