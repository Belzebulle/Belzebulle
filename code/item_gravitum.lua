local mod = BELZEMOD
local gravitum = Isaac.GetItemIdByName("Gravitum")

function mod:useGravitum(item, rng,  player)

    local time = 1000*10
    for _, entity in pairs(Isaac.GetRoomEntities()) do
        if entity:IsActiveEnemy () and entity:IsVulnerableEnemy() then
            -- stop the enemy
            entity:AddFreeze(EntityRef(player), time )

            -- Spawn a tear at the enemy positions
            Isaac.Spawn(EntityType.ENTITY_TEAR, TearVariant.BLOOD, 0, entity.Position, Vector(0,0), player)
        end
    end

    return {
        Discharge = true,
        Remove = false,
        ShowAnim = true
    }
end

mod:AddCallback(ModCallbacks.MC_USE_ITEM, mod.useGravitum, gravitum)
