
minetest.register_privilege("clearinv", "Clear a player's inventory")

minetest.register_chatcommand("clearinv", {
	params = "<playername> (optional)",
	description = "Clear a player's inventory",
	func = function(name, param)
		local player = minetest.get_player_by_name(param)
		if param ~= "" and not minetest.check_player_privs(name, {clearinv=true}) then
			minetest.chat_send_player(name, "*You don't have the privilege to clear someone else's inventory")
			return false
		elseif param ~= "" and player then
			local inv = player:get_inventory()
			inv:set_list("main",{})
			minetest.chat_send_player(name, "*Inventory of "..param.." cleared")
			minetest.chat_send_player(param, "*Your inventory was cleared by "..name)
		elseif param ~= "" and not player then
			minetest.chat_send_player(name,"*Player '"..param.."' does not exist")
			return false
		elseif param == "" then -- player wants to execute on his own
			player = minetest.get_player_by_name(name)
			local inv = player:get_inventory()
			inv:set_list("main",{})
			minetest.chat_send_player(name,"*Inventory cleared")
		end
		return true
	end,
})
