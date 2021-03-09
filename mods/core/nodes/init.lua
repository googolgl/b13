--- Nodes

S = minetest.get_translator("nodes")
modpath = minetest.get_modpath("nodes")

function copytable(new, def)
    -- Копируем таблицу в другую
      for def_key, def_value in pairs(def) do
        new[def_key] = def_value
      end
    return new
end

local path_to_file_forms = modpath .. "/json/forms.json"
forms = json_2_table(path_to_file_forms)

function handler_forms(def_table, form, name)
    -- Копируем в ноую таблицу значения
    local new_table = {}
    new_table = copytable(new_table, def_table)

    new_table.description = def_table.description..name
    new_table.drawtype = form.drawtype or "nodebox" 
    new_table.paramtype = form.paramtype or "light"
    new_table.paramtype2 = form.paramtype2 or "facedir"
    new_table.sunlight_propagates = true
    new_table.node_box = form.node_box
    new_table.selection_box = form.selection_box or form.node_box
    new_table.collision_box = form.collision_box or form.node_box
    return new_table
end

--require(modpath .. "/solids.lua")
dofile(modpath .. "/solids.lua")
dofile(modpath .. "/loose.lua")
dofile(modpath .. "/ores.lua")
dofile(modpath .. "/liquids.lua")
dofile(modpath .. "/woods.lua")
dofile(modpath .. "/leaves.lua")
dofile(modpath .. "/plants.lua")