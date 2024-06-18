scoreboard players operation TEMP __claimsystem_data = @s __claimsystem_personnal_id
scoreboard players operation @a __claimsystem_playerid -= TEMP __claimsystem_data

# Mark all players that are in an ennemy claim
execute if entity @s[tag=PERSONNAL_CLAIM] run execute as @a[distance=..8] unless entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_PERSONNAL_CLAIM 
execute if entity @s[tag=PERSONNAL_CLAIM16] run execute as @a[distance=..16] unless entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_PERSONNAL_CLAIM 
execute if entity @s[tag=PERSONNAL_CLAIM32] run execute as @a[distance=..32] unless entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_PERSONNAL_CLAIM 

# Mark all players that are in their claim
execute if entity @s[tag=PERSONNAL_CLAIM] run execute as @a[distance=..8] if entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_MY_PERSONNAL_CLAIM 
execute if entity @s[tag=PERSONNAL_CLAIM16] run execute as @a[distance=..16] if entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_MY_PERSONNAL_CLAIM
execute if entity @s[tag=PERSONNAL_CLAIM32] run execute as @a[distance=..32] if entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_MY_PERSONNAL_CLAIM 

# Mark all entities (not players) that are in a personnal claim
execute if entity @s[tag=PERSONNAL_CLAIM] run tag @e[type=!player,distance=..8] add IN_PERSONNAL_CLAIM
execute if entity @s[tag=PERSONNAL_CLAIM16] run tag @e[type=!player,distance=..16] add IN_PERSONNAL_CLAIM
execute if entity @s[tag=PERSONNAL_CLAIM32] run tag @e[type=!player,distance=..32] add IN_PERSONNAL_CLAIM

scoreboard players operation @a __claimsystem_playerid += TEMP __claimsystem_data