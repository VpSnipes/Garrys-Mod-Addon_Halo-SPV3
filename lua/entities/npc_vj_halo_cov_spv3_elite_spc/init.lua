AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_cov_spv3_elite_min/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Appearance = {
	Color = Color(36,36,36),
	Bodygroups = {1, 2, 0, 0},
	Skin = 0,
}
ENT.StartHealth = 150
ENT.ShieldMaxHealth = 200
ENT.ExtraShotCount = 2
ENT.WeaponProfficiency = 70