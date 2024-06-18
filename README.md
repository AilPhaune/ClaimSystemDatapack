ClaimSystem, a Minecraft datapack that allows players to claim their land, and admins to claim important server regions.

# Installation
Run build script and place the zip file inside your datapacks folder.

Use `/function claimsystem:admin/init_scoreboards` to create the necessary scoreboard.

Use `/function claimsystem:admin/create_scoreboards` when updating, to not overwrite the data values.

Use `/function claimsystem:admin/clear_scoreboards` before deleting the datapack. This will not remove the claim armor stands.

# Usage

## For players

Players can use triggers (`/trigger`) function to create their own claims. Admins can configure which sizes are available and if players can use auto claim.
The available commands are:
- `/trigger __claimsystem_autoclaim set <amount>`: This will enable autoclaim, and will claim a maximum of &lt;amount&gt;.
- `/trigger __claimsystem_autoclaim_size set <size>`: Autoclaiming will now make claims of radius &lt;size&gt;. If the size is invalid, the player will be notified when autoclaiming.
- `/trigger __claimsystem_show_user_claims set <0 or 1>`: If set to 1, the player's claim armor stands will be visible, if set to 0, they will remain invisible.
- `/trigger __claimsystem_claim8_here`, `/trigger __claimsystem_claim16_here`, `/trigger __claimsystem_claim32_here`: Claims an area in the given radius.
- `/trigger __claimsystem_unclaim_here`: Unclaims an area. The player must be in a radius of 1 block from the armor stand.

## For admins

Use `/function claimsystem:admin/config` to access the config menu.

Use `/function claimsystem:admin/eggs` to get eggs for placing admin claims. Available sizes are 8, 16, 32 blocks. You must be in creative mode to obtain the eggs.

Use `/function claimsystem:admin/remove_claim` to remove an admin claim, you must be in a 0.5 radius from the armor stand. `/function claimsystem:admin/tp_to_armor_stand` teleports you to the nearest admin claim armor stand.