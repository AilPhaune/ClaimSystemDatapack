scoreboard players operation TEMP __claimsystem_data = @s __claimsystem_personnal_id
scoreboard players operation @a __claimsystem_playerid -= TEMP __claimsystem_data

execute if entity @s[tag=PERSONNAL_CLAIM] run execute as @a[distance=..8] unless entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_PERSONNAL_CLAIM 
execute if entity @s[tag=PERSONNAL_CLAIM] run execute as @a[distance=..8] if entity @s[scores={__claimsystem_playerid=0}] run tag @s add IN_MY_PERSONNAL_CLAIM 

execute if entity @s[tag=PERSONNAL_CLAIM] run tag @e[type=!player,distance=..8] add IN_PERSONNAL_CLAIM

scoreboard players operation @a __claimsystem_playerid += TEMP __claimsystem_data