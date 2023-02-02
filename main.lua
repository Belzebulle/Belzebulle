BELZEMOD = RegisterMod("Belzebulle", 1)
local mod = BELZEMOD


-- include code files
local item_magic_candy = require("code.item_magic_candys")


function mod:calcCandy(player)
    local candy = 0
    if player:HasCollectible(Isaac.GetItemIdByName("Magic Bear")) then
        candy = candy + 1
    end
    if player:HasCollectible(Isaac.GetItemIdByName("Magic Lollipop")) then
        candy = candy + 1
    end
    return candy
end


-- add description to items
if EID then
    EID:addCollectible(Isaac.GetItemIdByName("Magic Bear"), "{{ArrowUp}} 1 damage  (0/2)", "Magic Bear")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Lollipop"), "{{ArrowUp}} 0.25 tear speed (0/2)", "Magic Lollipop")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Candy"), "{{ArrowUp}} 1 damage, {{ArrowUp}} 0.25 tear speed", "Magic Candy")
end