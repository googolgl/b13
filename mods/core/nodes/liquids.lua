--- Liquids
--- Жидкие

local path_to_file = modpath .. "/json/liquids.json"
local res = json_2_table(path_to_file)

if type(res) == "table" then
    for name, v in pairs(res) do
        --print(dump(v))
        -- если какой то из нод необходимо прописать кастомную функцию, добавляем условие по имени
        --[[if name == "lava" then

        elseif name == "snow" then

        end]]
        v.description = S(v.description)
        v._help = S(v._help)
        v.sounds = node_sound_defaults(v.sounds)
        minetest.register_node("nodes:"..name, v)
    end
end

local emit_lava_particle = function(pos)
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "lava_source") == 0 then
		return
	end
	local ppos = vector.add(pos, { x = math.random(-7, 7)/16, y = 0.45, z = math.random(-7, 7)/16})
	local spos = vector.add(ppos, { x = 0, y = -0.2, z = 0 })
	local vel = { x = math.random(-3, 3)/10, y = math.random(4, 7), z = math.random(-3, 3)/10 }
	local acc = { x = 0, y = -9.81, z = 0 }
	-- Lava droplet
	minetest.add_particle({
		pos = ppos,
		velocity = vel,
		acceleration = acc,
		expirationtime = 2.5,
		collisiondetection = true,
		collision_removal = true,
		size = math.random(20, 30)/10,
		texture = "mcl_particles_lava.png",
		glow = LIGHT_LAVA,
	})
end

local emit_lava_particle = function(pos)
	local node = minetest.get_node(pos)
	if minetest.get_item_group(node.name, "lava_source") == 0 then
		return
	end
	local ppos = vector.add(pos, { x = math.random(-7, 7)/16, y = 0.45, z = math.random(-7, 7)/16})
	local spos = vector.add(ppos, { x = 0, y = -0.2, z = 0 })
	local vel = { x = math.random(-3, 3)/10, y = math.random(4, 7), z = math.random(-3, 3)/10 }
	local acc = { x = 0, y = -9.81, z = 0 }
	-- Lava droplet
	minetest.add_particle({
		pos = ppos,
		velocity = vel,
		acceleration = acc,
		expirationtime = 2.5,
		collisiondetection = true,
		collision_removal = true,
		size = math.random(20, 30)/10,
		texture = "mcl_particles_lava.png",
		glow = 13,
	})
end

if minetest.settings:get("node_particles") == "full" then
	minetest.register_abm({
		label = "Lava particles",
		nodenames = {"group:lava_source"},
		interval = 8.0,
		chance = 20,
		action = function(pos, node)
			local apos = {x=pos.x, y=pos.y+1, z=pos.z}
			local anode = minetest.get_node(apos)
			-- Only emit partiles when directly below lava
			if anode.name ~= "air" then
				return
			end
			minetest.after(math.random(0, 800)*0.01, emit_lava_particle, pos)
		end,
	})
end

--doc.add_entry_alias("nodes", "nodes:water_source", "nodes", "nodes:water_flowing")
--doc.add_entry_alias("nodes", "nodes:lava_source", "nodes", "nodes:lava_flowing")