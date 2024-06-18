# Detection of the player's claims
scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id -= @s __claimsystem_playerid
tag @e[type=armor_stand,tag=PERSONNAL_CLAIM,scores={__claimsystem_personnal_id=0}] add SB_IS_ZERO

# detect if admin claims are too close
execute if entity @e[type=armor_stand,tag=CLAIM,distance=..41] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=CLAIM16,distance=..49] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=CLAIM32,distance=..65] run tag @s add NO_CLAIM_ADMIN_TOO_CLOSE

# detect if too close to another of the player's claims
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=SB_IS_ZERO,distance=..10] run tag @s add NO_CLAIM_MINE_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM16,tag=SB_IS_ZERO,distance=..12] run tag @s add NO_CLAIM_MINE_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM32,tag=SB_IS_ZERO,distance=..16] run tag @s add NO_CLAIM_MINE_TOO_CLOSE

# detect if too close to an enemy claim
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM,tag=!SB_IS_ZERO,distance=..41] run tag @s add NO_CLAIM_OTHER_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM16,tag=!SB_IS_ZERO,distance=..49] run tag @s add NO_CLAIM_OTHER_TOO_CLOSE
execute if entity @e[type=armor_stand,tag=PERSONNAL_CLAIM32,tag=!SB_IS_ZERO,distance=..65] run tag @s add NO_CLAIM_OTHER_TOO_CLOSE

# Error messages
execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @s[tag=NO_CLAIM_ADMIN_TOO_CLOSE] run tellraw @s {"text":"Vous êtes trop proche d'un claim admin","color":"red"}
execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @s[tag=NO_CLAIM_MINE_TOO_CLOSE] run tellraw @s {"text":"Vous êtes trop proche d'un de vos claims","color":"red"}
execute unless entity @s[scores={__claimsystem_autoclaim=1..}] if entity @s[tag=NO_CLAIM_OTHER_TOO_CLOSE] run tellraw @s {"text":"Vous êtes trop proche d'un claim de quelqu'un d'autre","color":"red"}

# Spawn armor stand if possible
execute unless entity @s[tag=NO_CLAIM_ADMIN_TOO_CLOSE] unless entity @s[tag=NO_CLAIM_MINE_TOO_CLOSE] unless entity @s[tag=NO_CLAIM_OTHER_TOO_CLOSE] run summon armor_stand ~ ~ ~ {Invulnerable:1b,NoBasePlate:1b,DisabledSlots:4144959,CustomName:'[{"text":"Personnal Claim","color":"gold"},{"text":" "},{"text":"[RADIUS = 32]","color":"aqua"}]',CustomNameVisible:1b,NoGravity:1b,PersistenceRequired:1b,Silent:1b,Tags:["PERSONNAL_CLAIM","PERSONNAL_CLAIM32","NEW_PERSONNAL"],display:{Name:'[{"text":"Claim [RADIUS = 32]","italic":false}]'}}

# Remove tags from player
tag @s remove NO_CLAIM_ADMIN_TOO_CLOSE
tag @s remove NO_CLAIM_MINE_TOO_CLOSE
tag @s remove NO_CLAIM_OTHER_TOO_CLOSE

# Remove tag from armor stand
tag @e[tag=SB_IS_ZERO] remove SB_IS_ZERO

# Reincrement the scores
scoreboard players operation @e[type=armor_stand,tag=PERSONNAL_CLAIM] __claimsystem_personnal_id += @s __claimsystem_playerid

# Make the new armor stand copy the player id
scoreboard players operation @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] __claimsystem_personnal_id = @s __claimsystem_playerid

# Decrement autoclaim
execute if entity @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] run scoreboard players remove @s[scores={__claimsystem_autoclaim=1..}] __claimsystem_autoclaim 1

# Remove tag from new armor stand
tag @e[type=armor_stand,distance=..1,tag=NEW_PERSONNAL,sort=nearest,limit=1] remove NEW_PERSONNAL