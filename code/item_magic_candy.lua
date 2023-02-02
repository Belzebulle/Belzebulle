local mod = BELZEMOD
local magicCandy_Active = Isaac.GetItemIdByName("Magic Candy")

function mod:useCandy(item, rng,  player)

    local itemCount = player:GetCollectibleNum(MagicCandy_1) + player:GetCollectibleNum(MagicCandy_2)
    if itemCount == 0 then
        itemCount = 0.5
    end
    local damageToAdd = CandyDamage * itemCount
    local tearSpeedToAdd = CandyTearSpeed * itemCount
    player.Damage = player.Damage + damageToAdd
    player.ShotSpeed = player.ShotSpeed + tearSpeedToAdd
        
    player:GetData().candy = {
        damage = damageToAdd,
        tearSpeed = tearSpeedToAdd
    }


    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.useCandy, magicCandy_Active)

function mod:removeCandy()

    local player = Isaac.GetPlayer(0)

    if player:GetData().candy == nil or false then
        return 
    end

    player.Damage = player.Damage - player:GetData().candy.damage
    player.ShotSpeed = player.ShotSpeed - player:GetData().candy.tearSpeed

    player:GetData().candy = {
        damage = 0,
        tearSpeed = 0
    }
end

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.removeCandy)
