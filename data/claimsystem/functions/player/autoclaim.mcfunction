tag @s remove VALID_CLAIM_SIZE
execute if score @s __claimsystem_autoclaim_size matches 8 if score AllowClaim8 __claimsystem_data matches 1 run tag @s add VALID_CLAIM_SIZE
execute if score @s __claimsystem_autoclaim_size matches 16 if score AllowClaim16 __claimsystem_data matches 1 run tag @s add VALID_CLAIM_SIZE
execute if score @s __claimsystem_autoclaim_size matches 32 if score AllowClaim32 __claimsystem_data matches 1 run tag @s add VALID_CLAIM_SIZE

# Actionbar title
execute if entity @s[tag=VALID_CLAIM_SIZE] run title @s actionbar [{"text":"Autoclaim:","color":"aqua"}," ",{"score":{"objective":"__claimsystem_autoclaim","name":"@s"},"color":"gold"}," ",{"text":"| Size:","color":"aqua"}," ",{"score":{"objective":"__claimsystem_autoclaim_size","name":"@s"},"color":"green"}]
execute unless entity @s[tag=VALID_CLAIM_SIZE] run title @s actionbar [{"text":"Autoclaim:","color":"aqua"}," ",{"score":{"objective":"__claimsystem_autoclaim","name":"@s"},"color":"gold"}," ",{"text":"| Invalid size:","color":"aqua"}," ",{"score":{"objective":"__claimsystem_autoclaim_size","name":"@s"},"color":"red"}]

tag @s remove VALID_CLAIM_SIZE

# Autoclaim sizes
execute if score @s __claimsystem_autoclaim_size matches 8 if score AllowClaim8 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_8
execute if score @s __claimsystem_autoclaim_size matches 16 if score AllowClaim8 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_16
execute if score @s __claimsystem_autoclaim_size matches 32 if score AllowClaim8 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_32