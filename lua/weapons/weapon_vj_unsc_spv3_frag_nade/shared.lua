include('weapons/weapon_vj_spv3_gbase/shared.lua')

SWEP.PrintName					= "[SPV3] Frag Grenade"
SWEP.EntToThrow = "obj_vj_unsc_spv3_frag_nade"
SWEP.WorldModel					= "models/hce/spv3/weapons/unsc/fraggrenade.mdl" -- The world model (Third person, when a NPC is holding it, on ground, etc.)
SWEP.Spawnable					= true
SWEP.Primary.Ammo				= "frag_grenade" -- Ammo type
SWEP.Primary.Sound				= {"grenades/frag nade/throw/throw.ogg"} -- npc/roller/mine/rmine_explode_shock1.ogg
SWEP.PickupSound = {"grenades/frag nade/pickup/pickup (1).ogg","grenades/frag nade/pickup/pickup (2).ogg","grenades/frag nade/pickup/pickup (3).ogg",}
SWEP.DeploySound = SWEP.PickupSound