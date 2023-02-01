BELZEMOD = RegisterMod("Belzebulle", 1)
local mod = BELZEMOD


-- include code files
local item_toxitoid = require("code.item_toxitoid")

-- add description to items
if EID then
    EID:addCollectible(Isaac.GetItemIdByName("Magic Bear"), "{{ArrowUp}} 1 damage", "Magic Bear")
    EID:addCollectible(Isaac.GetItemIdByName("Magic Lollipop"), "{{ArrowUp}} 0.25 tear speed", "Magic Lollipop")
end