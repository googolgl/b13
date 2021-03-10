minetest.register_abm({
    nodenames = {"nodes:dirt_with_grass"},
    neighbors = {"nodes:water_source", "nodes:water_flowing"},
    interval = 10.0, -- Run every 10 seconds
    chance = 50, -- Select every 1 in 50 nodes
    action = function(pos, node, active_object_count,
            active_object_count_wider)
        local pos = {x = pos.x, y = pos.y + 1, z = pos.z}
        minetest.set_node(pos, {name = "nodes:plants_grass"})
    end
})