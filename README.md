# Garrys-Mod-Addon_Halo-SPV3
 A Garry's Mod Addon focused on implementing the NPC's and their features from the Halo CE mod, "SPV3" into Garry's Mod. Originally created by Mayhem.
 
 Changes from workshop version can be found further down.

# Installation
The best way to keep an up-to-date version with me would be to use Github desktop or another version of fetching clones. To install using Github Desktop, check the instructions in this link: https://giant.gfycat.com/ColossalIdealisticAlbino.webm

After you have a clone, anytime an update occurs, you just have to click "Pull Origin" (Click "Fetch Origin" first if that button isn't there)

 Alternatively, if you wish to install the addon manually, simply click "Code" and then "Download Zip"
![Image](https://i.imgur.com/ctkLnSD.png)
After that, take the folder inside the zip and put it in your "Addons" folder in your garrys mod folder.
![Image](https://i.imgur.com/YOMBLXU.png)

# Changes from current workshop version
Changes that are different and WIP compared to the workshop version:

I've been working on these changes for months, so I cannot bother with summarizing everything. You can find the changes I've made throughout here: https://github.com/SgtFlex/Garrys-Mod-Addon_Halo-SPV3/commits/main
Here is at least the jist of some of it:
   <br/>-Added configurable menu that can be opened with "spv3_settings" in the console
   <br/>-Added Map Spawner
   <br/>-Added Skirmishers
   <br/>-Added Covenant Phantom w/ Turrets
   <br/>-Added UNSC Pelican w/ Turrets
   <br/>-Added Flood Biomass
   <br/>-Sentinels are now much much more effective against large swaths of flood (can hit more than 1 target per sweep)
   <br/>-Added 8 additional voice permutations for marines
   <br/>-Added hitgroups and dismemberment to Flood Marine
   <br/>-Added hitgroups and dismemberment to Flood Elite
   <br/>-Added hitgroups and dismemberment to Flood Brute
   <br/>-Added Energy Sword
   <br/>-Added proper Berserking for Elites
   <br/>-Higher-ranked elites will randomly pull out swords when shields deplete
   <br/>-Added ability for Elite suicide runners to spawn from transformations
   <br/>-Added crouching animation/capability to marines, elites, brutes, and grunts
   <br/>-Added Rifle/Missile holdtype to Grunts
   <br/>-Added evasion to marines
   <br/>-Changed evasion code for Elites, Brutes, and Jackals (So they evade when fighting other NPCs too and not just players)
   <br/>-Added flying death animations for all relevant NPCs
   <br/>-Updated all Hunters
   <br/>-Changed infection forms and made them feel more "floaty"
	<br/>-Infection forms now explode on contact with shields
	<br/>-Infection forms deal double damage to active shields
	<br/>-Removed collision between infection form and its target
	<br/>-Reduced friction on infection forms
	<br/>   -Infection forms now attach to individual bones
	<br/>   -Infection forms can now pile onto enemies, and will jump off once one of them has taken over
	<br/>   -Infection forms can no longer be meleed/damaged by the entity they are attached to
	<br/>   -Modified airborne animation to make it more "wiggly" and last longer
	<br/>   -Added climbing animations for when climbing nodes are available
	<br/>   -Added jumping capabilities (Node related)
	<br/>   -Added some randomization in their leaping to spread them out a bit more as a swarm
   <br/>-Added convar and option for exploding infection forms
   <br/>-Changed default infection count Modifier 1->2.5
   <br/>-Increased health on Marine and ODST combat forms to be inline with increased marine health from last update
   <br/>-Changed around weapon tables within UNSC faction
   <br/>-Removed unnecessary file causing error upon load in
   <br/>-Fixed various bones, so weapons are wielded better
   <br/>-Fixed several material issues
   <br/>-Changed sound format to save on space
   <br/>-Fixed Flood jackal retaining colors of host but applying it to the flesh as well
   <br/>-Marines (and sub types) can use Covie grenades if they're allowed to use Covie weapons
   <br/>-Brutes (and sub types) can use Human grenades if they're allowed to use Human weapons
   <br/>-Chief can now use all grenade types rather than just frags
   <br/>-Elites will not flinch/stagger unless their shields are depleted
   <br/>-Infection forms now slightly pulsate with a glow
   <br/>-Added moving sound to infection forms
   <br/>-Lowered volume of infector chomping sfx
   <br/>-Seem to have fixed phantom infection forms spawned from Carriers(?) 
   <br/>-Fixed marines not receiving correct blast damage from explosions
   <br/>-Fixed needler nade causing errors in certain situations
   <br/>-Fixed elite combat forms not using skins (better coloring)
   <br/>-Loosened requirements "infect_onlyhalo"
 <br/>
 <br/>


NOT (*.png OR *.vmt OR *.vtf OR *.lua OR *.ogg OR *.wav OR *.vtx OR *.mdl OR *.phy OR *.vvd)
