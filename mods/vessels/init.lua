-- Minetest 0.4 mod: vessels
-- See README.txt for licensing and other information.

minetest.register_node("vessels:glass_bottle", {
	description = "Glass Bottle (empty)",
	drawtype = "nodebox",
	tiles = {"vessels_bottle_top.png", "vessels_bottle_bottom.png", "vessels_bottle_side.png"},
	inventory_image = "vessels_bottle_side.png",
	--wield_image = "vessels_bottle_side.png",
	paramtype = "light",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {{-0.1875, 0.3125, -0.1875, 0.1875, 0.375, 0.1875},
			{-0.125, 0.125, -0.125, 0.125, 0.3125, 0.125},
			{-0.1875, 0.0, -0.1875, 0.1875, 0.125, 0.1875},
			{-0.25, -0.125, -0.25, 0.25, 0.0, 0.25},
			{-0.3125, -0.375, -0.3125, 0.3125, -0.125, 0.3125},
			{-0.25, -0.4375, -0.25, 0.25, -0.375, 0.25},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:glass_bottle 10",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "", "default:glass" },
		{ "", "default:glass", "" }
	}
})

minetest.register_node("vessels:drinking_glass", {
	description = "Drinking Glass (empty)",
	drawtype = "nodebox",
	tiles = {"vessels_drinking_glass_top.png", "vessels_drinking_glass_bottom.png", "vessels_drinking_glass_side.png"},
	inventory_image = "vessels_drinking_glass_inv.png",
	wield_image = "vessels_drinking_glass_inv.png",
	paramtype = "light",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {{-0.3125, -0.375, -0.3125, 0.3125, 0.25, 0.3125},
			{-0.25, -0.4375, -0.25, 0.25, -0.375, 0.25},
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft( {
	output = "vessels:drinking_glass 14",
	recipe = {
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "", "default:glass" },
		{ "default:glass", "default:glass", "default:glass" }
	}
})

minetest.register_node("vessels:steel_bottle", {
	description = "Heavy Steel Bottle (empty)",
	drawtype = "nodebox",
	tiles = {"vessels_steel_bottle_top.png","vessels_steel_bottle_bottom.png" , "vessels_steel_bottle.png"},
	paramtype = "light",
	walkable = false,
	node_box = {
		type = "fixed",
		fixed = {{-0.125, 0.1875, -0.125, 0.125, 0.25, 0.125},
			{-0.25, 0.125, -0.25, 0.25, 0.1875, 0.25},
			{-0.3125, -0.4375, -0.3125, 0.3125, 0.125, 0.3125},
			{-0.25, -0.5, -0.25, 0.25, -0.4375, 0.25}}
	},
	groups = {vessel=1,dig_immediate=3,attached_node=1},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft( {
	output = "vessels:steel_bottle 5",
	recipe = {
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "default:steel_ingot", "", "default:steel_ingot" },
		{ "", "default:steel_ingot", "" }
	}
})


-- Make sure we can recycle them

minetest.register_craftitem("vessels:glass_fragments", {
	description = "Pile of Glass Fragments",
	inventory_image = "vessels_glass_fragments.png",
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:glass_bottle",
		"vessels:glass_bottle",
	},
})

minetest.register_craft( {
	type = "shapeless",
	output = "vessels:glass_fragments",
	recipe = {
		"vessels:drinking_glass",
		"vessels:drinking_glass",
	},
})

minetest.register_craft({
	type = "cooking",
	output = "default:glass",
	recipe = "vessels:glass_fragments",
})

minetest.register_craft( {
	type = "cooking",
	output = "default:steel_ingot",
	recipe = "vessels:steel_bottle",
})

