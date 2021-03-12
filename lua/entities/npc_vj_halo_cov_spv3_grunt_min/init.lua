AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/cov/grunt/grunt.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(127,111,63)
ENT.bodyGroupTable = {
	0,
	0,
}
ENT.StartHealth = 25
-- ENT.ShieldHealth = 0
ENT.ExtraShotCount = 0
ENT.WeaponProfficiency = 30
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Blue" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.AnimTbl_IdleStand = {ACT_IDLE}
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
-- ENT.AnimTbl_WeaponAttackFiringGesture = {} -- Firing Gesture animations used when the SNPC is firing the weapon
-- ENT.AnimTbl_TakingCover = {} -- The animation it plays when hiding in a covered position
ENT.AnimTbl_MoveToCover = {ACT_RUN} -- The animation it plays when moving to a covered position
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_WeaponReload = {ACT_RELOAD} -- Animations that play when the SNPC reloads
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.AnimTbl_GrenadeAttack = {"Throw"} -- Grenade Attack Animations
ENT.TimeUntilGrenadeIsReleased = 0.97 -- Time until the grenade is released
ENT.GrenadeAttackThrowDistance = 5000 -- How far it can throw grenades
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 3
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut"}},
	{HitGroup = {505}, Animation = {"h_f_head"}},
	{HitGroup = {501}, Animation = {"h_f_l_foot"}},
	{HitGroup = {502}, Animation = {"h_f_r_foot"}},
	{HitGroup = {503}, Animation = {"h_f_l_arm"}},
	{HitGroup = {504}, Animation = {"h_f_l_hand"}},
	{HitGroup = {506}, Animation = {"h_f_r_arm"}},
	{HitGroup = {507}, Animation = {"h_f_r_hand"}},
}
ENT.GrenadeTypes = {
	"obj_vj_cov_spv3_gravity_nade",
	"obj_vj_cov_spv3_plasma_nade",
	"obj_vj_cov_spv3_cluster_nade",
	"obj_vj_cov_spv3_needler_nade",
}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3"} -- Death Animations
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_magnum",
}

function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    else
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    end
	return true
end

function ENT:CustomOnPreInitialize()
	self.voicePermutation = tostring(math.random(1,4))
	self.SoundTbl_Alert = {
	"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeFoe/seeFoe (5).ogg",
}
self.SoundTbl_AllyDeath = {
	"grunt/grunt0"..self.voicePermutation.."/ally_death/ally_death (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ally_death/ally_death (2).ogg",
}
self.SoundTbl_CallForHelp = {

}
self.SoundTbl_CombatIdle = {
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (7).ogg",
	"grunt/grunt0"..self.voicePermutation.."/combat_idle/combat_idle (8).ogg",
}
self.SoundTbl_Death = {
	"grunt/grunt0"..self.voicePermutation.."/death/death (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/death/death (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/death/death (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/death/death (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/death/death (5).ogg",
}
self.SoundTbl_Fall = {
	"grunt/grunt0"..self.voicePermutation.."/fall/fall (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/fall/fall (2).ogg",
}
self.SoundTbl_GrenadeAttack = {
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/throwGrenade/throwGrenade (7).ogg",
}
self.SoundTbl_Investigate = {
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (7).ogg",
	"grunt/grunt0"..self.voicePermutation.."/investigate/investigate (8).ogg",
}
self.SoundTbl_LostEnemy = {
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/lost_enemy/lost_enemy (7).ogg",
}
self.SoundTbl_OnGrenadeSight = {
	"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/seeGrenade/seeGrenade (5).ogg",
}
self.SoundTbl_OnKilledEnemy = {
	"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/killed_enemy/killed_enemy (3).ogg",
}
self.SoundTbl_OnReceiveOrder = {
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/ok/ok (6).ogg",
}
self.SoundTbl_Pain = {
	"grunt/grunt0"..self.voicePermutation.."/pain/pain (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/pain/pain (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/pain/pain (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/pain/pain (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/pain/pain (5).ogg",
}
self.SoundTbl_Scared = {
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (7).ogg",
	"grunt/grunt0"..self.voicePermutation.."/flee/flee (8).ogg",
}
self.SoundTbl_Stuck = {
	"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/stuck/stuck (3).ogg",
}
self.SoundTbl_Suppressing = {
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (4).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (5).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (6).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (7).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (8).ogg",
	"grunt/grunt0"..self.voicePermutation.."/firing/firing (9).ogg",
}
self.SoundTbl_Transform = {
	"grunt/grunt0"..self.voicePermutation.."/transform/transform (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/transform/transform (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/transform/transform (3).ogg",
}
self.SoundTbl_WeaponReload = {
	"grunt/grunt0"..self.voicePermutation.."/cover/cover (1).ogg",
	"grunt/grunt0"..self.voicePermutation.."/cover/cover (2).ogg",
	"grunt/grunt0"..self.voicePermutation.."/cover/cover (3).ogg",
	"grunt/grunt0"..self.voicePermutation.."/cover/cover (4).ogg",
}
end


function ENT:CustomOnInitialize()
	self:RandomizeTraits()
	-- timer.Simple(0.1, function()
	-- if (self:GetActiveWeapon().HoldType!="pistol") then
	-- 	self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
	-- 	self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
	-- 	self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
	-- 	self.AnimTbl_Run = {ACT_RUN_RIFLE}
	-- 	self.AnimTbl_TakingCover = {}
	-- 	self.AnimTbl_WeaponAttackCrouch = {} -- Animation played when the SNPC does weapon attack while crouching | For VJ Weapons

	-- end
	-- end)
	self.GrenadeAttackEntity = VJ_PICKRANDOMTABLE(self.GrenadeTypes)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
	end)
	self:SetColor(self.modelColor)
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end
	self:SetCollisionBounds(Vector(20, 20, 60), Vector(-20, -20, 0))
	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self:SetHealth(self.StartHealth)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- Detection --
	if self:GetEnemy() != nil then
	self.AnimTbl_IdleStand = {ACT_IDLE}
	else
	self.AnimTbl_IdleStand = {ACT_IDLE_AGITATED}
	end
end



---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("grunt/shared/walk/walk"..math.random(1,6)..".ogg", 80, 100, 1)
	end
end

ENT.EvadeCooldown = 0
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (math.random(0,2) == 2) then
		if (self.EvadeCooldown <= CurTime()) then
			if (math.random(0,1)==1) then
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1,false)
			end
			self.EvadeCooldown = CurTime() + 4
		end
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if (hitgroup == 505 and dmginfo:GetDamage() >= 10) then
		dmginfo:SetDamage(self:Health())
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
end

function ENT:FlyingDeath(dmginfo)
	self.HasDeathRagdoll = false
	self.HasDeathAnimation = false
	self.imposter = ents.Create("obj_vj_imposter")
	self.imposter:SetOwner(self)
	self.imposter.Sequence = "Die_Airborne"
	local velocity = dmginfo:GetDamageForce():GetNormalized() * 1500
	if (dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()) then
		velocity = velocity * 0.3
	end
	self.imposter.Velocity = Vector(velocity.x, velocity.y, velocity.z + 500)
	self.imposter.Angle = Angle(0,dmginfo:GetDamageForce():Angle().y,0)
	self.imposter:Spawn()
end
	

ENT.HasProtector=false
function ENT:CustomOnAllyDeath(argent) 
	if ((string.find(tostring(argent), "grunt")) or (string.find(tostring(argent), "brute"))) and (argent:GetPos():DistToSqr(self:GetPos()) <= 700000) then
		timer.Simple(2.5, function() 
			if (!IsValid(self)) then return end
			self.HasProtector=false
			for k, v in pairs(ents.FindInSphere(self:GetPos(), 50000)) do
				if (string.find(tostring(v), "grunt") or string.find(tostring(v), "brute")) and (v:IsNPC()) then
					self.HasProtector = true
				end
			end
			if (self.HasProtector==false or (math.random(0,10) < 3)) then
				self.ScaredSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Scared))
				self.ScaredSound:Play()
				self.Behavior = VJ_BEHAVIOR_PASSIVE
				self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
				self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
				self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
				timer.Create("Scared"..self:GetCreationID(), math.random(1.5,3), 5, function()
					if !(IsValid(self)) then return end 
					self.ScaredSound = CreateSound(self, VJ_PICKRANDOMTABLE(self.SoundTbl_Scared))
					self.ScaredSound:Play()
					self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
					self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
				end)
				timer.Simple(10, function()
					if !(IsValid(self)) then return end
					self.Behavior = VJ_BEHAVIOR_PASSIVE
					self.AnimTbl_Walk = {ACT_WALK} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_Run = {ACT_RUN} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
					self.AnimTbl_MoveToCover = {ACT_RUN}
				end)
			end
	end)
end
end

ENT.GrenadeAttackVelForward1 = 300 -- Grenade attack velocity up | The first # in math.random


/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/