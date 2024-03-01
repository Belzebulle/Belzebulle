local mod = BELZEMOD

function mod:EvaluateItems(player, cacheFlags)
    local itemCount = player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?"))

    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        -- ((𝜋/3)^(−y)⋅15−5 ) * z where y =player.Damage and z = item count
        local damage = ((math.pi/3)^(-player.Damage)*15-5) * itemCount
        print(damage)
        if damage <= 0.5 then damage = 0.5 * itemCount end
        player.Damage = player.Damage + damage
    end

    if cacheFlags & CacheFlag.CACHE_TEARFLAG == CacheFlag.CACHE_TEARFLAG then
        if itemCount > 0 then
            player.TearFlags = player.TearFlags | TearFlags.TEAR_PIERCING
        end
    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateItems, CacheFlag.CACHE_DAMAGE, CacheFlag.CACHE_TEARFLAG)

-- Spawn Game Breaker? on first floor on the center of the room
function mod:spawnItem()
    local game = Game()
    local level = game:GetLevel()
    local player = Isaac.GetPlayer(0)
    local room = game:GetRoom()
    local pos = room:GetCenterPos()
        if level:GetAbsoluteStage() == 1 and level.EnterDoor == -1 and player.FrameCount == 1 and  player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?")) == 0 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, Isaac.GetItemIdByName("Game Breaker?"), pos, pos, player)
    end
end

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.spawnItem)
