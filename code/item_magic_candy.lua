local mod = BELZEMOD
local toxitoid_1 = Isaac.GetItemIdByName("Magic Bear")
local toxitoid_2 = Isaac.GetItemIdByName("Magic Lollipop")
local toxitoidDamage = 1
local toxitoidTearSpeed = 0.25
local toxitoidSpeed = 0.2

function mod:CandyStatUp(player, cacheFlags)

    if cacheFlags & CacheFlag.CACHE_SPEED == CacheFlag.CACHE_SPEED and
    (player:HasCollectible(toxitoid_1) and player:HasCollectible(toxitoid_2)) then
            player.MoveSpeed = player.MoveSpeed + toxitoidSpeed
    end

    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then

        local itemCount = player:GetCollectibleNum(toxitoid_1)
        local damageToAdd = toxitoidDamage * itemCount
        player.Damage = player.Damage + damageToAdd

    else if cacheFlags & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then

        local itemCount = player:GetCollectibleNum(toxitoid_2)
        local tearSpeedToAdd = toxitoidTearSpeed * itemCount
        player.ShotSpeed = player.ShotSpeed + tearSpeedToAdd

        end
    end
end 

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.CandyStatUp)
