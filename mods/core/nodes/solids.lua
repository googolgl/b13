--- Solids
--- Твердые

local path_to_file_res = modpath .. "/json/solids.json"
local res = json_2_table(path_to_file_res)

local path_to_file_forms = modpath .. "/json/forms.json"
local forms = json_2_table(path_to_file_forms)

local function handler_forms(def_table, form, name)
    -- Копируем в ноую таблицу значения
    local new_table = {}
    new_table = copytable(new_table, def_table)

    new_table.description = def_table.description..name
    new_table.drawtype = form.drawtype or "nodebox" 
    new_table.paramtype2 = form.paramtype2 or "facedir"
    new_table.node_box = form.node_box
    new_table.selection_box = form.selection_box or form.node_box
    new_table.collision_box = form.collision_box or form.node_box
    return new_table
end

--[[local function on_construct_dirt_with_grass(pos)
    local node = minetest.get_node(pos)
    if node.param2 == 0 then
        local new_node = mcl_core.get_grass_block_type(pos)
        if new_node.param2 ~= 0 or new_node.name ~= "mcl_core:dirt_with_grass" then
            minetest.set_node(pos, new_node)
        end
    end
    return mcl_core.on_snowable_construct(pos)
end]]--

if type(res) == "table" then
    for name, v in pairs(res) do
        --print(dump(v))
        -- если какой то из нод необходимо прописать кастомную функцию, добавляем условие по имени
        if name == "dirt_with_grass" then
        --    v.on_construct = on_construct_dirt_with_grass(pos)
        --elseif name == "snow" then

        end
        v.description = S(v.description)
        v._help = S(v._help)
        v.sounds = node_sound_defaults(v.sounds)
        
        minetest.register_node("nodes:"..name, v)

        -- генерим дополнительные формы из этого материала
        if  type(v._forms) == "string" and v._forms == "all" then
            for fname, fv in pairs(forms) do
                new_v = handler_forms(v,fv,fname)
                minetest.register_node("nodes:"..name..fname, new_v)
            end
        elseif type(v._forms) == "table" then
            for _, shape in pairs(v._forms) do
                new_v = handler_forms(v,forms[shape],shape)
                minetest.register_node("nodes:"..name..shape, new_v)
            end
        end
    end
end