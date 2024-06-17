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
scoreboard players enable @a __claimsystem_claim_here
scoreboard players enable @a __claimsystem_unclaim_here

execute as @a run function claimsystem:internal/visibility

execute as @a[scores={__claimsystem_claim_here=1}] at @s run function claimsystem:player/claim_personnal_8
execute as @a[scores={__claimsystem_unclaim_here=1}] at @s run function claimsystem:player/remove_personnal