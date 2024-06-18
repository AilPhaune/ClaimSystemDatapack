tag @e remove IN_PERSONNAL_CLAIM
tag @e remove IN_MY_PERSONNAL_CLAIM

# Select all claims to be processed
execute as @e[type=!armor_stand] at @s run tag @e[type=armor_stand,tag=PERSONNAL_CLAIM,distance=..8] add PROCESS_PERSONNAL_CLAIM
execute as @e[type=!armor_stand] at @s run tag @e[type=armor_stand,tag=PERSONNAL_CLAIM16,distance=..16] add PROCESS_PERSONNAL_CLAIM
execute as @e[type=!armor_stand] at @s run tag @e[type=armor_stand,tag=PERSONNAL_CLAIM32,distance=..32] add PROCESS_PERSONNAL_CLAIM

# Make all selected armor stands process their claim
execute as @e[type=armor_stand,tag=PROCESS_PERSONNAL_CLAIM] at @s run function claimsystem:apply_personnal_claim

# Unmark armor stands
tag @e[tag=PROCESS_PERSONNAL_CLAIM] remove PROCESS_PERSONNAL_CLAIM

tag @a[gamemode=survival,tag=IN_PERSONNAL_CLAIM] add PERSONNAL_CLAIM_ADVENTURE

gamemode adventure @a[gamemode=survival,tag=PERSONNAL_CLAIM_ADVENTURE,tag=IN_PERSONNAL_CLAIM]
gamemode survival @a[gamemode=adventure,tag=PERSONNAL_CLAIM_ADVENTURE,tag=!IN_PERSONNAL_CLAIM]

tag @a[tag=!IN_PERSONNAL_CLAIM] remove PERSONNAL_CLAIM_ADVENTURE

title @a[tag=IN_PERSONNAL_CLAIM] actionbar {"text":"Vous êtes dans une zone protégée par un autre joueur", "color":"red"}
title @a[tag=IN_MY_PERSONNAL_CLAIM] actionbar {"text":"Vous êtes dans une zone protégée par vous", "color":"green"}

effect give @a[tag=IN_PERSONNAL_CLAIM,gamemode=adventure] minecraft:weakness 2 255 true
effect give @a[tag=IN_PERSONNAL_CLAIM,gamemode=adventure] minecraft:resistance 2 255 true
effect give @a[tag=IN_PERSONNAL_CLAIM,gamemode=adventure] minecraft:glowing 2 255 true

execute as @e[type=minecraft:tnt,tag=IN_PERSONNAL_CLAIM] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",Count:1}}
kill @e[type=minecraft:tnt,tag=IN_PERSONNAL_CLAIM]

execute as @e[type=minecraft:tnt_minecart,tag=IN_PERSONNAL_CLAIM] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt_minecart",Count:1}}
kill @e[type=minecraft:tnt_minecart,tag=IN_PERSONNAL_CLAIM]

kill @e[type=minecraft:ender_pearl,tag=IN_PERSONNAL_CLAIM]