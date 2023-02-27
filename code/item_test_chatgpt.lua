local mod = BELZEMOD

-- item which have 50% chance to spawn a tear and double damage (create a class for this)

local function newTear(tear)
    local player = tear.Parent:ToPlayer()
    local Tear = Isaac.Spawn(EntityType.ENTITY_TEAR, 0, 0, tear.Position, tear.Velocity, player)
    Tear.CollisionDamage = tear.CollisionDamage * 2
    Tear:GetSprite():ReplaceSpritesheet(0, "gfx/tear_arachna_normal.png")
    Tear:GetSprite():LoadGraphics()
    return Tear
end