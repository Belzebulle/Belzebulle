BELZEMOD = RegisterMod("Belzebulle", 1)
local mod = BELZEMOD


-- include code files
local item_test_chatgpt = require("code.item_test_chatgpt")
local item_magic_bear_lollipop = require("code.item_magic_bear_lollipop")
local item_magic_candy = require("code.item_magic_candy")
local tear_on_transformation = require("code.tear_on_transformation")

-- add description to items
if EID then
    EID:addCollectible(Isaac.GetItemIdByName("Magic Bear"), "{{ArrowUp}} 1 damage  (0/2)", "Magic Bear")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Lollipop"), "{{ArrowUp}} 0.25 tear speed (0/2)", "Magic Lollipop")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Candy"), "{{ArrowUp}} 1 damage, {{ArrowUp}} 0.25 tear speed",
        "Magic Candy")
end


-- if player is keeper change fly sprite to "gfx\monsters\other\monster_fly.png"
function mod:changeFlySprite(player)
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_KEEPER then
        local flySprite = "gfx/monsters/other/monster_fly.png"
        
        for _, entity in pairs(Isaac.GetRoomEntities()) do
            if entity.Type == EntityType.ENTITY_FLY then
                entity:GetSprite():ReplaceSpritesheet(0, flySprite)
                entity:GetSprite():LoadGraphics()
            end
        end

    end
end
mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, mod.changeFlySprite)

-- on spawn fly change sprite to "gfx\monsters\other\monster_fly.png"
function mod:changeFlySpriteOnSpawn(fly)
    if Isaac.GetPlayer(0):GetPlayerType() == PlayerType.PLAYER_KEEPER then
        local flySprite = "gfx/monsters/other/monster_fly.png"
        fly:GetSprite():ReplaceSpritesheet(0, flySprite)
        fly:GetSprite():LoadGraphics()
    end
    Game():ShakeScreen(10)
end
mod:AddCallback(ModCallbacks.MC_POST_NPC_INIT, mod.changeFlySpriteOnSpawn, EntityType.ENTITY_ATTACKFLY)