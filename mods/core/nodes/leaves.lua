--- Leaves
--- Листья

local path_to_file = modpath .. "/json/leaves.json"
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
        v.drawtype = "mesh"
	    v.mesh = "leaves.obj"
        --v.paramtype = "light"
        v.use_texture_alpha = "clip"
        v.waving = 2
	    --v.walkable = true
        --v.liquid_viscosity = 8
	    --v.liquidtype = "source"
	    --v.liquid_renewable = false
	    --v.liquid_range = 0
        v.sounds = node_sound_defaults(v.sounds)
        minetest.register_node("nodes:"..name, v)
    end
end