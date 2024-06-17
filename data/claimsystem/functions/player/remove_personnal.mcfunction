scoreboard players operation @e[type=armor_stand,distance=..1,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id -= @s __claimsystem_playerid

execute if entity @e[type=armor_stand,distance=..1,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] run tellraw @s {"text":"Claim supprimé","color":"green"}
execute unless entity @e[type=armor_stand,distance=..1,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] run tellraw @s {"text":"Impossible de supprimer le claim","color":"red"}

kill @e[type=armor_stand,distance=..1,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}]

scoreboard players operation @e[type=armor_stand,distance=..1] __claimsystem_personnal_id += @s __claimsystem_playerid

scoreboard players set @s __claimsystem_unclaim_here 0