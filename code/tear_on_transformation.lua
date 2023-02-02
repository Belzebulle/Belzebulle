local mod = BELZEMOD

function mod:candyTear(tear)
    local player = tear.Parent:ToPlayer()
    if superCandy(player) then
        if tear.Variant == TearVariant.BLUE then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_normal.png")
            tear:GetSprite():LoadGraphics()
            tear:GetData().candyTear = true
        elseif tear.Variant == TearVariant.CUPID_BLUE then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_cupid.png")
            tear:GetSprite():LoadGraphics()
            tear:GetData().candyTear = true
        elseif tear.Variant == TearVariant.LOST_CONTACT then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_lostcontact.png")
            tear:GetSprite():LoadGraphics()
            tear:GetData().candyTear = true
        elseif tear.Variant == TearVariant.PUPULA then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_candy_pupula.png")
            tear:GetSprite():LoadGraphics()
            tear:GetData().candyTear = true
        elseif tear.Variant == TearVariant.HUNGRY then
            tear:GetSprite():ReplaceSpritesheet(0, "gfx/projectiles/tear_cancy_hungry.png")
            tear:GetSprite():LoadGraphics()
            tear:GetData().candyTear = true
        end
    end
end
mod:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, mod.candyTear)
