tag @e remove IN_CLAIM
execute as @e[type=!armor_stand] at @s run execute if entity @e[type=armor_stand,tag=CLAIM,distance=..8] run tag @s add IN_CLAIM
execute as @e[type=!armor_stand] at @s run execute if entity @e[type=armor_stand,tag=CLAIM16,distance=..16] run tag @s add IN_CLAIM
execute as @e[type=!armor_stand] at @s run execute if entity @e[type=armor_stand,tag=CLAIM32,distance=..32] run tag @s add IN_CLAIM