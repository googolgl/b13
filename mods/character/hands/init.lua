--local has_mcl_skins = minetest.get_modpath("hands") ~= nil

--local def = minetest.registered_items[""]

--local list
-- mcl_skins is enabled
--if has_mcl_skins == true then
--	list = mcl_skins.list
--else
	--list = { "hand" }
--end

--generate a node for every skin
--for _,texture in pairs(list) do
	-- This is a fake node that should never be placed in the world
	minetest.register_node("hands:right", {
		description = "Right hand",
		tiles = {"HyRigTexture.png"},
		use_texture_alpha = "opaque",
		visual_scale = 0.001,
		paramtype = "light",
		drawtype = "mesh",
		mesh = "hand.obj",
		-- Prevent construction
		node_placement_prediction = "",
		--on_construct = function(pos)
			--minetest.remove_node(pos)
		--	minetest.log("error", "[hand] Trying to construct hand: at "..minetest.pos_to_string(pos))
		--end,
		selection_box = {
            type = "fixed",
            fixed = {{0.0, 0.0, 0.0, 0.0, 0.0, 0.0}}
        },
		on_place = function(itemstack, placer, pointed_thing)
			local gn = minetest.get_node(pointed_thing.under)
			print(dump(gn))
			if gn.name == "default:chest_locked" then
					minetest.item_place(itemstack, placer, pointed_thing, param2)
			end
		end,
		drop = "",
		on_drop = function()
			return nil
		end,
		groups = { dig_immediate = 3, not_in_creative_inventory = 1 },
		--range = def.range,
	})
--end

--if has_mcl_skins == true then
	--change the player's hand to their skin
--	mcl_skins.register_on_set_skin(function(player, skin)
--		local name = player:get_player_name()
		--local meta = mcl_skins.meta[skin]
--		player:get_inventory():set_stack("hand", 1, "hand:"..skin)
--	end)
--else
minetest.register_on_joinplayer(function(player)
	local stack = player:get_inventory():get_stack("hand", 1)
	stack:set_name("hands:right")
	--print(dump(stack))
	player:get_inventory():set_stack("hand", 1, stack)
	--player:set_stack("hand", 1, "hands:right")

end)
--end
