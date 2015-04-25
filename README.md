# mt_essentials
A collection of essential mods for minetest servers

**clear_inventory**

```
/clearinv <playername> (optional) : clear your inventory
```
The 'clearinv' privilege allows you to clear other's inventory

**list_players**
```
/players : list all players present on the server
```

**spawn**
```
/spawn : return to spawn
/setspawn : set the world spawnpoint
```
setspawn requires the server privilege

**simple_warp**
```
/setwarp <name> : set a private warp
/delwarp <name> : delete a private warp
/setwarpall <name> : set a public warp
/delwarpall <name> : delete a public warp
/warps <index> : list your private warps
/warpsall <index> : list the public warps
/warp <location> : move to a public/private location
```
privs : 
- usewarp : Can warp to public/private locations
- warpall : Can set/del public locations
- warpown : Can set/del private locations

**teleport_request**
```
/tpr <playername> : request teleport to another player
/tphr <playername> : request player to teleport to you
/tpy : accept teleport request from another player
/tpn : deny tepeort request from another player
```

