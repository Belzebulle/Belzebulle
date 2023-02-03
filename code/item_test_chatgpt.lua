local mod = BELZEMOD

local item = Isaac.GetItemIdByName("DamageBoost")

-- item which have 50% chance to spawn a tear and double damage (create a class for this)

local function newTear(tear)
    local player = tear.Parent:ToPlayer()
    local Tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, tear.Position, tear.Velocity, player)
    Tear.CollisionDamage = tear.CollisionDamage * 2
    Tear:GetSprite():ReplaceSpritesheet(0, "gfx/tear_arachna_normal.png")
    Tear:GetSprite():LoadGraphics()
    return Tear
end

function mod:addTearOnShoot(tear)
    if tear.Parent:ToPlayer():HasCollectible(item) then
        if math.floor(math.random(1, 2)) == 1 then
            tear.CollisionDamage = tear.CollisionDamage * 2
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_arachna_normal.png")
            tear:GetSprite():LoadGraphics()
        end
    end
end

mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.addTearOnShoot)
