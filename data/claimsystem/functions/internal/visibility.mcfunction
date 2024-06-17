scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id -= @s __claimsystem_playerid

execute if score @s __claimsystem_show_user_claims matches 1 run execute as @e[type=armor_stand,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] run data merge entity @s {Invisible:0b,CustomNameVisible:1b}
execute unless score @s __claimsystem_show_user_claims matches 1 run execute as @e[type=armor_stand,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] run data merge entity @s {Invisible:1b,CustomNameVisible:0b}

scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id += @s __claimsystem_playerid