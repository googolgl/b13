function copytable(new, def)
    -- Копируем таблицу в другую
      for def_key, def_value in pairs(def) do
        new[def_key] = def_value
      end
    return new
end

local path_to_file_forms = minetest.get_modpath("forms") .. "/forms.json"
forms = json_2_table(path_to_file_forms)

function forms_handler(def_table, form, name)
    -- Копируем в ноую таблицу значения
    local new_table = {}
    new_table = copytable(new_table, def_table)

    new_table.description = def_table.description..name
    new_table.drawtype = form.drawtype or "nodebox" 
    new_table.paramtype = form.paramtype or "light"
    new_table.paramtype2 = form.paramtype2 or "facedir"
    new_table.sunlight_propagates = true
    new_table.is_ground_content = false
    new_table.selection_box = form.selection_box
    new_table.collision_box = form.collision_box or form.selection_box
    --new_table.node_box = form.node_box
    new_table.mesh = def_table.mesh or form.mesh
    return new_table
end