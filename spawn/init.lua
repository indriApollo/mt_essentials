
spawn = {}

minetest.register_chatcommand("spawn", {
	params = "",
	description = "Teleport to world spawn",
	func = function(name)
		spawn.tp_to_spawn(name)
		return true
	end,
})

minetest.register_chatcommand("setspawn", {
	params = "",
	description = "Set world spawn",
	privs = {server = true},
	func = function(name)
		spawn.set_spawn(name)
		return true
	end,
})

spawn.tp_to_spawn = function(name)
	local player = minetest.get_player_by_name(name)
	if not player then
		return false
	end
	local world_file = Settings(minetest.get_worldpath().."/world.mt")
	local spawnpos = world_file:get("spawn_pos")
	if not spawnpos then
		minetest.chat_send_player(name, "*Spawn not set")
		return false
	end
	local spawnpos = string.split(spawnpos, ",")
	player:setpos({x=spawnpos[1],y=spawnpos[2],z=spawnpos[3]})
	return true
end

spawn.set_spawn = function(name)
	local player = minetest.get_player_by_name(name)
	if not player then
		return false
	end
	local pos = vector.round(player:getpos())
	local world_file = Settings(minetest.get_worldpath().."/world.mt")
	world_file:set("spawn_pos", pos.x..","..pos.y..","..pos.z)
	world_file:write()
	minetest.chat_send_player(name, "*Spawn set")
end

minetest.register_on_respawnplayer(function(player)
	return spawn.tp_to_spawn(player:get_player_name()) -- if func fails, fallback to standard spawn
end)
