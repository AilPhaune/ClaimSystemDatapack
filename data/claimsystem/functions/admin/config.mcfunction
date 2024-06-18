tellraw @s [{"text":"Claim System","color":"aqua"}," ",{"text":"> Configuration","color":"dark_purple"}]

# EGGS
tellraw @s [{"text":"Get admin claim eggs","clickEvent":{"action":"run_command","value":"/function claimsystem:admin/eggs"},"color":"gold"}]

# AutoClaim
execute unless score AllowAutoclaim __claimsystem_data matches 1 run tellraw @s [{"text":"Auto claim         ","color":"gold"}," ",{"text":"[ALLOW] ","clickEvent":{"action":"run_command","value":"/function claimsystem:config/autoclaim/allow"},"color":"green"}," ",{"text":"DENIED","color":"red"}]
execute if score AllowAutoclaim __claimsystem_data matches 1 run tellraw @s [{"text":"Auto claim         ","color":"gold"}," ",{"text":"ALLOWED","color":"green"}," ",{"text":"[DENY]","clickEvent":{"action":"run_command","value":"/function claimsystem:config/autoclaim/deny"},"color":"red"}]

# AllowClaim8
execute unless score AllowClaim8 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=08]","color":"gold"}," ",{"text":"[ALLOW] ","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim8/allow"},"color":"green"}," ",{"text":"DENIED","color":"red"}]
execute if score AllowClaim8 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=08]","color":"gold"}," ",{"text":"ALLOWED","color":"green"}," ",{"text":"[DENY]","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim8/deny"},"color":"red"}]

# AllowClaim16
execute unless score AllowClaim16 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=16]","color":"gold"}," ",{"text":"[ALLOW] ","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim16/allow"},"color":"green"}," ",{"text":"DENIED","color":"red"}]
execute if score AllowClaim16 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=16]","color":"gold"}," ",{"text":"ALLOWED","color":"green"}," ",{"text":"[DENY]","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim16/deny"},"color":"red"}]

# AllowClaim32
execute unless score AllowClaim32 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=32]","color":"gold"}," ",{"text":"[ALLOW] ","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim32/allow"},"color":"green"}," ",{"text":"DENIED","color":"red"}]
execute if score AllowClaim32 __claimsystem_data matches 1 run tellraw @s [{"text":"Claim [RADIUS=32]","color":"gold"}," ",{"text":"ALLOWED","color":"green"}," ",{"text":"[DENY]","clickEvent":{"action":"run_command","value":"/function claimsystem:config/claim32/deny"},"color":"red"}]

# Admin management
tellraw @s ["",{"text":"[Add admin]","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/scoreboard players set <player> __claimsystem_isadmin 1"}},{"text":"\n","color":"light_purple"},{"text":"[Remove admin]","color":"light_purple","clickEvent":{"action":"suggest_command","value":"/scoreboard players set <player> __claimsystem_isadmin 0"}}]