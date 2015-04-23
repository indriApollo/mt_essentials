
minetest.register_chatcommand("players", {
	params = "",
	description = "List currentky connected players",
	func = function(name,param)
		local list
		for i,player in ipairs(minetest.get_connected_players()) do
			local lname = player:get_player_name()
			if not list then list = lname.." "
			else list = list..lname.." " end
		end
		minetest.chat_send_player(name,"-- "..table.getn(minetest.get_connected_players()).." player(s) connected --\n"..list)
		return true
	end,
})
