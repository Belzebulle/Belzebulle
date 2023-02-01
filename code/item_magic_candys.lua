local mod = BELZEMOD
local magicCandy_1 = Isaac.GetItemIdByName("Magic Bear")
local magicCandy_2 = Isaac.GetItemIdByName("Magic Lollipop")
local candyDamage = 1
local candyTearSpeed = 0.25
local candySpeed = 0.2


function superCandy(player)
    if (player:HasCollectible(magicCandy_1) and player:HasCollectible(magicCandy_2)) then
            return true
    end
end

function mod:CandyStatUp(player, cacheFlags)
    
    -- add speed if player has both items and only one time
    
    if cacheFlags & CacheFlag.CACHE_DAMAGE == CacheFlag.CACHE_DAMAGE then

        local itemCount = player:GetCollectibleNum(magicCandy_1)
        local damageToAdd = candyDamage * itemCount
        player.Damage = player.Damage + damageToAdd

        end
    if cacheFlags & CacheFlag.CACHE_SHOTSPEED == CacheFlag.CACHE_SHOTSPEED then

        local itemCount = player:GetCollectibleNum(magicCandy_2)
        local tearSpeedToAdd = candyTearSpeed * itemCount
        player.ShotSpeed = player.ShotSpeed + tearSpeedToAdd

        end


    -- Not working
    
    --if player:GetData().candySpeed == true then
    --    return
    --end
    --if superCandy(player) then
    --        player.MoveSpeed = player.MoveSpeed + candySpeed
    --        player:GetData().candySpeed = true
    --end

    
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, mod.CandyStatUp)

function mod:candyTear(tear)
    local player = tear.Parent:ToPlayer()
    if superCandy(player) then
        if tear.Variant == TearVariant.BLUE then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_normal.png")
            tear:GetSprite():LoadGraphics()

        elseif tear.Variant == TearVariant.CUPID_BLUE then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_cupid.png")
            tear:GetSprite():LoadGraphics()

        elseif tear.Variant == TearVariant.LOST_CONTACT then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_lostcontact.png")
            tear:GetSprite():LoadGraphics()

        elseif tear.Variant == TearVariant.PUPULA then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_pupula.png")
            tear:GetSprite():LoadGraphics()

        elseif tear.Variant == TearVariant.HUNGRY then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_cancy_hungry.png")
            tear:GetSprite():LoadGraphics()

        end
    end
end

mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.candyTear)

local magicCandy_Active = Isaac.GetItemIdByName("Magic Candy")

function mod:useCandy(item, rng,  player)

    local itemCount = player:GetCollectibleNum(magicCandy_1) + player:GetCollectibleNum(magicCandy_2)
    if itemCount == 0 then
        itemCount = 0.5
    end
    local damageToAdd = candyDamage * itemCount
    local tearSpeedToAdd = candyTearSpeed * itemCount
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

-- leave the room to remove the effect

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.removeCandy)