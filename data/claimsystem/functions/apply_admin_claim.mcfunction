tag @a[gamemode=survival,tag=IN_CLAIM] add CLAIM_ADVENTURE

title @a[tag=IN_CLAIM] actionbar {"text":"Vous êtes dans une zone protégée", "color":"gold"}

gamemode adventure @a[gamemode=survival,tag=CLAIM_ADVENTURE,tag=IN_CLAIM]
gamemode survival @a[gamemode=adventure,tag=CLAIM_ADVENTURE,tag=!IN_CLAIM]

tag @a[tag=!IN_CLAIM] remove CLAIM_ADVENTURE

effect give @a[tag=IN_CLAIM,gamemode=adventure] minecraft:weakness 2 255 true
effect give @a[tag=IN_CLAIM,gamemode=adventure] minecraft:resistance 2 255 true
effect give @a[tag=IN_CLAIM,gamemode=adventure] minecraft:glowing 2 255 true

execute as @e[type=minecraft:tnt,tag=IN_CLAIM] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt",Count:1}}
kill @e[type=minecraft:tnt,tag=IN_CLAIM]

execute as @e[type=minecraft:tnt_minecart,tag=IN_CLAIM] at @s run summon minecraft:item ~ ~ ~ {Item:{id:"minecraft:tnt_minecart",Count:1}}
kill @e[type=minecraft:tnt_minecart,tag=IN_CLAIM]

kill @e[type=minecraft:ender_pearl,tag=IN_CLAIM]