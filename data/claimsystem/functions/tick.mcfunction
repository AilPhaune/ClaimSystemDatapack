tag @a remove PREV_IN_CLAIM
tag @a[tag=IN_CLAIM] add PREV_IN_CLAIM
tag @a[tag=IN_PERSONNAL_CLAIM] add PREV_IN_CLAIM
tag @a[tag=IN_MY_PERSONNAL_CLAIM] add PREV_IN_CLAIM

function claimsystem:check_admin_claims
function claimsystem:apply_admin_claim
		
function claimsystem:check_personnal_claims

title @a[tag=!IN_CLAIM,tag=!IN_PERSONNAL_CLAIM,tag=!IN_MY_PERSONNAL_CLAIM,tag=PREV_IN_CLAIM] actionbar ""

scoreboard players add @a __claimsystem_playerid 0

execute as @r[scores={__claimsystem_playerid=0}] run scoreboard players add PlayerCount __claimsystem_data 1
execute as @r[scores={__claimsystem_playerid=0}] run scoreboard players operation @s __claimsystem_playerid = PlayerCount __claimsystem_data

scoreboard players enable @a __claimsystem_show_user_claims
execute if score AllowClaim8 __claimsystem_data matches 1 run scoreboard players enable @a __claimsystem_claim8_here
execute if score AllowClaim16 __claimsystem_data matches 1 run scoreboard players enable @a __claimsystem_claim16_here
execute if score AllowClaim32 __claimsystem_data matches 1 run scoreboard players enable @a __claimsystem_claim32_here
scoreboard players enable @a __claimsystem_unclaim_here
execute if score AllowAutoclaim __claimsystem_data matches 1 run scoreboard players enable @a __claimsystem_autoclaim
execute if score AllowAutoclaim __claimsystem_data matches 1 run scoreboard players enable @a __claimsystem_autoclaim_size

execute as @a run function claimsystem:internal/visibility

execute as @a[scores={__claimsystem_claim8_here=1}] at @s if score AllowClaim8 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_8
execute as @a[scores={__claimsystem_claim16_here=1}] at @s if score AllowClaim16 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_16
execute as @a[scores={__claimsystem_claim32_here=1}] at @s if score AllowClaim32 __claimsystem_data matches 1 run function claimsystem:player/claim_personnal_32
execute as @a[scores={__claimsystem_unclaim_here=1}] at @s run function claimsystem:player/remove_personnal

execute if score AllowAutoclaim __claimsystem_data matches 1 as @a[scores={__claimsystem_autoclaim=1..}] at @s run function claimsystem:player/autoclaim
execute unless score AllowAutoclaim __claimsystem_data matches 1 run scoreboard players set @a[scores={__claimsystem_autoclaim=1..}] __claimsystem_autoclaim 0

scoreboard players set @a __claimsystem_claim8_here 0
scoreboard players set @a __claimsystem_claim16_here 0
scoreboard players set @a __claimsystem_claim32_here 0