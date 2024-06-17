scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id -= @s __claimsystem_playerid
tag @e[type=armor_stand,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] add SB_IS_ZERO

execute if entity @e[type=armor_stand,tag=CLAIM,distance=..17] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=CLAIM16,distance=..25] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=CLAIM32,distance=..41] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE

execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @s[tag=NO_CLAIM_ADMIN_TOO_CLOSE] run tellraw @s {"text":"Vous êtes trop proche d'un claim admin","color":"red"}
execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=SB_IS_ZERO,distance=..4] run tellraw @s {"text":"Vous êtes trop proche d'un de vos claims","color":"red"}
execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=!SB_IS_ZERO,distance=..17] run tellraw @s {"text":"Vous êtes trop proche d'un claim de quelqu'un d'autre","color":"red"}
execute unless entity @s[tag=NO_CLAIM_ADMIN_TOO_CLOSE] unless entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=!SB_IS_ZERO,distance=..17] unless entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=SB_IS_ZERO,distance=..4] run summon armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,DisabledSlots:4144959,CustomName:'[{"text":"Personnal Claim","color":"gold"},{"text":" "},{"text":"[RADIUS = 8]","color":"aqua"}]',CustomNameVisible:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:["PERSONNAL_CLAIM","NEW_PERSONNAL"],display:{Name:'[{"text":"Claim [RADIUS = 8]","italic":false}]'}}

tag @s remove NO_CLAIM_ADMIN_TOO_CLOSE

tag @e[tag=SB_IS_ZERO] remove SB_IS_ZERO
scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id += @s __claimsystem_playerid

scoreboard players operation @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] __claimsystem_personnal_id = @s __claimsystem_playerid

execute if entity @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] run scoreboard players remove @s[scores={__claimsystem_autoclaim=1..}] __claimsystem_autoclaim 1

tag @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] remove NEW_PERSONNAL

scoreboard players set @s __claimsystem_claim_here 0