local mod = BELZEMOD
MagicCandy_1 = Isaac.GetItemIdByName("Magic Bear")
MagicCandy_2 = Isaac.GetItemIdByName("Magic Lollipop")
CandyDamage = 1
CandyTearSpeed = 0.25
CandySpeed = 0.2


function superCandy(player)
    return (player:HasCollectible(MagicCandy_1) and player:HasCollectible(MagicCandy_2))
end

local function superCandy_2(player)
    return player:GetCollectibleNum(MagicCandy_1)
    + player:GetCollectibleNum(MagicCandy_2) >= 2   
end

local function countCandy(player)
    local count = 0
    count = player:GetCollectibleNum(MagicCandy_1) + player:GetCollectibleNum(MagicCandy_2)
    if count > 2 then
        count = 2
    end
    return count
end

local function updateCandy(player)
    if EID then
        EID:addCollectible(Isaac.GetItemIdByName("Magic Bear"), "{{ArrowUp}} 1 damage  ("..countCandy(player).."/2)", "Magic Bear")
        EID:addCollectible(Isaac.GetItemIdByName("Magic Lollipop"), "{{ArrowUp}} 0.25 tear speed ("..countCandy(player).."/2)", "Magic Lollipop")
    end
end



function mod:CandyStatUp(player, cacheFlags)
    
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then

        local itemCount = player:GetCollectibleNum(MagicCandy_1)
        local damageToAdd = CandyDamage * itemCount
        player.Damage = player.Damage + damageToAdd

        end
    if cacheFlags & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then

        local itemCount = player:GetCollectibleNum(MagicCandy_2)
        local tearSpeedToAdd = CandyTearSpeed * itemCount
        player.ShotSpeed = player.ShotSpeed + tearSpeedToAdd

        end

    if cacheFlags & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED then
            if superCandy(player) then
                player.MoveSpeed = player.MoveSpeed + CandySpeed
            end
        end

    updateCandy(player)
end
mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.CandyStatUp)

-- ACTIVE START --

-- ACTIVE END --