local mod = BELZEMOD

function mod:EvaluateItems(player, cacheFlags)

    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then
        local itemCount = player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?"))
        local damageToAdd = 200 * itemCount
        player.Damage = player.Damage + damageToAdd
    end

    if cacheFlags & CacheFlag.CACHE_TEARFLAG == CacheFlag.CACHE_TEARFLAG then
        local itemCount = player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?"))
        local tearFlagsToAdd = 0
        if itemCount > 0 then
            player.TearFlags = player.TearFlags | TearFlags.TEAR_PIERCING
        end
    end
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.EvaluateItems, CacheFlag.CACHE_DAMAGE, CacheFlag.CACHE_TEARFLAG)

--@param tear:Entity
function mod:tearFlags(tear)
    local player = Isaac.GetPlayer(0)
    local itemCount = player:GetCollectibleNum(Isaac.GetItemIdByName("Game Breaker?"))
    if itemCount > 0 then
        tear:AddTearFlags(TearFlags.TEAR_PIERCING)
        
        --tear.Scale = tear.Scale - 4.5
        player.Damage = player.Damage + 0.5

        -- write in a file
        local file = io.open("log.txt", "a")
        if file == nil then
            return print("Error opening file")
        else
            io.output(file)
            file:write(player.Damage .. "," .. tear.Scale .. "\n")
            file:close()
            print("File written")
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.tearFlags)


-- Spawn Game Breaker? on first floor on the center of the room
function mod:spawnItem()
    local game = Game()
    local level = game:GetLevel()
    local player = Isaac.GetPlayer(0)
    local room = game:GetRoom()
    local pos = room:GetCenterPos()
        if level:GetAbsoluteStage() == 1 and level.EnterDoor == -1 and player.FrameCount == 1 then
        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, Isaac.GetItemIdByName("Game Breaker?"), pos, pos, player)
    end
end

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, mod.spawnItem)
