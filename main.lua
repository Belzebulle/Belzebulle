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
    EID:addCollectible(Isaac.GetItemIdByName("Magic Candy"), "{{ArrowUp}} 1 damage, {{ArrowUp}} 0.25 tear speed", "Magic Candy")
end