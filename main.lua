BELZEMOD = RegisterMod("Belzebulle", 1)
local mod = BELZEMOD


-- include code files
local item_card = require("code.item_card")
--local item_magic_bear_lollipop = require("code.item_magic_bear_lollipop")
--local item_magic_candy = require("code.item_magic_candy")
--local item_gravitum = require("code.item_gravitum")
--local tear_on_transformation = require("code.tear_on_transformation")
local player_dav = require("code.character_dav")

-- add description to items
if EID then
    -- Swordman and Shieldman
    EID:addCollectible(Isaac.GetItemIdByName("Shieldman"), "{{ArrowUp}} +1 Health Up #{{Heart}} Full health" , "Shieldman")
    EID:addCollectible(Isaac.GetItemIdByName("Swordman"), "{{ArrowUp}} +1 Damage Up", "Swordman")

    EID:addCollectible(Isaac.GetItemIdByName("Magic Bear"), "{{ArrowUp}} +1 Damage Up  (0/2)", "Magic Bear")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Lollipop"), "{{ArrowUp}} +0.25 Shoot Speed Up (0/2)", "Magic Lollipop")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Candy"), "{{ArrowUp}} +1 Damage Up, {{ArrowUp}} 0.25 tear speed", "Magic Candy")
end