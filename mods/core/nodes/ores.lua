--- Ores
--- Руды

local path_to_file = modpath .. "/json/ores.json"
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