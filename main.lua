BELZEMOD = RegisterMod("Belzebulle", 1)
local mod = BELZEMOD


-- include code files
local item_toxitoid = require("code.item_toxitoid")

-- add description to items
if EID then
    EID:addCollectible(Isaac.GetItemIdByName("Toxitoid 1"), "{{ArrowUp}} 1 damage", "Toxitoid 1")
    EID:addCollectible(Isaac.GetItemIdByName("Toxitoid 2"), "{{ArrowUp}} 0.25 tear speed", "Toxitoid 2")
end