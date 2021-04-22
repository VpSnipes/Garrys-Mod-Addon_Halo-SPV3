AddCSLuaFile("shared.lua")
include('shared.lua')
include('entities/npc_vj_halo_shared_spv3/init.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/hce/spv3/cov/jackal/jackal.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.StartHealth = 50
ENT.ShieldHealth = 125 * GetConVarNumber("vj_spv3_ShieldModifier")
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.ShieldDelay = 6
//125 shields
ENT.HullType = HULL_MEDIUM
ENT.bodyGroupTable = {
	1,
	0,
}
ENT.NextThrowGrenadeTime = 0 -- Time until it can throw a grenade again
ENT.ThrowGrenadeChance = 0 -- Chance that it will throw the grenade | Set to 1 to throw all the time
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Purple" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload
ENT.CanFlinch = 1 -- 0 = Don't flinch | 1 = Flinch at any damage | 2 = Flinch only from certain damages
ENT.FlinchChance = 2
ENT.NextFlinchTime = 1.35 -- How much time until it can flinch again?
ENT.HasHitGroupFlinching = true
ENT.HitGroupFlinching_Values = {
	{HitGroup = {500}, Animation = {"h_f_gut","h_f_chest"}},
	{HitGroup = {501}, Animation = {"h_f_l_foot"}},
	{HitGroup = {502}, Animation = {"h_f_r_leg"}},
	{HitGroup = {503}, Animation = {"h_f_r_foot"}},
	{HitGroup = {504}, Animation = {"h_f_l_arm"}},
	{HitGroup = {505}, Animation = {"h_f_l_hand1","h_f_l_hand2"}},
	{HitGroup = {507}, Animation = {"h_f_r_arm"}},
	{HitGroup = {508}, Animation = {"h_f_r_hand"}},
}
	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasAllies = true -- Put to false if you want it not to have any allies
ENT.VJ_NPC_Class = {"CLASS_COV"} -- NPCs with the same class with be allied to each other
ENT.AnimTbl_WeaponAttack = {ACT_IDLE_AGITATED} -- Animation played when the SNPC does weapon attack
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations

	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = false -- Should the SNPC have a melee attack?
ENT.AnimTbl_ShootWhileMovingRun = {ACT_RUN} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
ENT.AnimTbl_ShootWhileMovingWalk = {ACT_RUN} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
ENT.DisableFootStepSoundTimer = true -- If set to true, it will disable the time system for the footstep sound code, allowing you to use other ways like model events
ENT.AllowWeaponReloading = true -- If false, the SNPC will no longer reload

	-- Death ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasDeathBodyGroup = false -- Set to true if you want to put a bodygroup when it dies
ENT.HasItemDropsOnDeath = false -- Should it drop items on death?
ENT.UNSCWeps = {
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
}
ENT.EntitiesToRunFrom = {obj_spore=true,obj_vj_grenade=true,obj_grenade=true,obj_handgrenade=true,npc_grenade_frag=true,doom3_grenade=true,fas2_thrown_m67=true,cw_grenade_thrown=true,obj_cpt_grenade=true,cw_flash_thrown=true,ent_hl1_grenade=true, obj_vj_unsc_spv3_frag_nade=true,obj_vj_cov_spv3_plasma_nade=true,obj_vj_cov_spv3_gravity_nade=true,obj_vj_cov_spv3_cluster_nade=true,obj_vj_cov_spv3_needler_nade=true, npc_vj_halo_flood_spv3_carrier=true}
ENT.Color = Color(100,100,140)
ENT.WeaponProfficiency = 50
ENT.ExtraShotCount = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnSetupWeaponHoldTypeAnims(htype)
    if (htype == "pistol") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_AGITATED
    elseif (htype == "ar2") then
    	self.WeaponAnimTranslations[ACT_RUN]						= ACT_RUN_RIFLE
    	self.WeaponAnimTranslations[ACT_IDLE_AGITATED]				= ACT_IDLE_RIFLE
    end
	return true
end

function ENT:CustomOnInitialize()
	self:RandomizeTraits()
	for i=1, #self.bodyGroupTable do
		self:SetBodygroup(i, self.bodyGroupTable[i])
	end

-- 	timer.Simple(0.1, function()
-- 	if (self:GetActiveWeapon().HoldType=="ar2") then
-- 		self.AnimTbl_WeaponAttack = {ACT_IDLE_RIFLE} -- Animation played when the SNPC does weapon attack
-- 		self.AnimTbl_ShootWhileMovingRun = {ACT_RUN_RIFLE} -- Animations it will play when shooting while running | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_ShootWhileMovingWalk = {ACT_RUN_RIFLE} -- Animations it will play when shooting while walking | NOTE: Weapon may translate the animation that they see fit!
-- 		self.AnimTbl_Run = {ACT_RUN_RIFLE}
-- 	end
-- end)

	self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
	self:SetHealth(self.StartHealth)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_covUNSCWeps")==1 and math.random(0,1)==1) then
			self:GetActiveWeapon():Remove()
			self:Give(VJ_PICKRANDOMTABLE(self.UNSCWeps))
		end
		if (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistol") then
			self:SetSkin(0)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_needler") then
			self:SetSkin(1)
		elseif (self:GetActiveWeapon():GetClass()=="weapon_vj_cov_spv3_plasmapistolbrute") then
			self:SetSkin(2)
		else
			self:SetSkin(3)
		end
	end)
	self:SetColor(self.Color)
	self:SetCollisionBounds(Vector(20, 20, 75), Vector(-20, -20, 0))
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
ENT.EvadeCooldown = 0
ENT.ShieldActivated = true
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (math.random(0,2) == 2) then
		if (self.EvadeCooldown <= CurTime()) then
			if (math.random(0,1)==1) then
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL1,true,1.5,false)
			else
				self:VJ_ACT_PLAYACTIVITY(ACT_SIGNAL2,true,1.5,false)
			end
			self.EvadeCooldown = CurTime() + 4
		end
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if hitgroup == 11 then
		if (dmginfo:GetDamageType()==DMG_PLASMA or dmginfo:GetDamageType()==DMG_BURN) then
			self.ShieldCurrentHealth = self.ShieldCurrentHealth - dmginfo:GetDamage() * 2
		else
			self.ShieldCurrentHealth = self.ShieldCurrentHealth - dmginfo:GetDamage()
		end
			
		dmginfo:ScaleDamage(0)
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
	end
	if (hitgroup == 506 and dmginfo:GetDamage() >= 10) then
		dmginfo:SetDamage(self:Health())
	end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
	end
	if dmginfo:GetAttacker():IsPlayer() && dmginfo:GetDamageType()==DMG_CLUB && Vector((dmginfo:GetDamagePosition() - self:GetPos()).x, (dmginfo:GetDamagePosition() - self:GetPos()).y, 0):Dot(Vector(self:GetForward().x, self:GetForward().y, 0)) < 0 then
		self.AlertFriendsOnDeath = false
		self:TakeDamage(self:Health(), dmginfo:GetAttacker(), dmginfo:GetInflictor())
	end
	if self.ShieldCurrentHealth <= 0 and self.ShieldActivated==true then
		self.ShieldActivated = false
		self:SetHitboxSet("noShield")
		self:SetBodygroup(1, 0)
		ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
		if (math.random(0,1)==1) then
			self:Flee()
		end
	end
	if (timer.Exists("ShieldDelay"..self:GetCreationID())) then
		timer.Adjust("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1)
	else
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() 
			if (IsValid(self) and self.ShieldCurrentHealth < self.ShieldHealth) then
				self.ShieldActivated = true
				self.ShieldCurrentHealth = self.ShieldHealth
				self:SetHitboxSet("default")
				self:SetBodygroup(1, 1)
				ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
			end
		end)
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
---------------------------------------------------------------------------------------------------------------------------------------------

ENT.SoundTbl_OnKilledEnemy = {
"jackal/tnt/tnt9.ogg",
"jackal/tnt/tnt10.ogg",
"jackal/tnt/tnt11.ogg",
"jackal/tnt/tnt12.ogg",
"jackal/tnt/tnt13.ogg",
"jackal/tnt/tnt14.ogg"
}

ENT.SoundTbl_Alert = {
"jackal/seefoe/seefoe1.ogg",
"jackal/seefoe/seefoe2.ogg",
"jackal/seefoe/seefoe3.ogg",
"jackal/seefoe/seefoe4.ogg",
"jackal/seefoe/seefoe5.ogg",
"jackal/seefoe/seefoe6.ogg",
"jackal/seefoe/seefoe7.ogg",
"jackal/seefoe/seefoe8.ogg",
"jackal/seefoe/seefoe9.ogg"
}

ENT.SoundTbl_Pain = {
"jackal/pain/pain1.ogg",
"jackal/pain/pain2.ogg",
"jackal/pain/pain3.ogg",
"jackal/pain/pain4.ogg",
"jackal/pain/pain5.ogg",
"jackal/pain/pain6.ogg",
"jackal/pain/pain7.ogg",
"jackal/pain/pain8.ogg",
"jackal/pain/pain9.ogg",
"jackal/pain/pain10.ogg",
"jackal/pain/pain11.ogg",
"jackal/pain/pain12.ogg",
"jackal/pain/pain13.ogg",
"jackal/pain/pain14.ogg",
"jackal/pain/pain15.ogg",
"jackal/pain/pain16.ogg",
"jackal/pain/pain17.ogg",
"jackal/pain/pain18.ogg",
"jackal/pain/pain19.ogg",
"jackal/pain/pain20.ogg"
}

ENT.SoundTbl_CallForHelp = {

}

ENT.SoundTbl_Death = {
"jackal/dth/dth1.ogg",
"jackal/dth/dth2.ogg",
"jackal/dth/dth3.ogg",
"jackal/dth/dth4.ogg",
"jackal/dth/dth5.ogg",
"jackal/dth/dth6.ogg",
"jackal/dth/dth7.ogg",
"jackal/dth/dth8.ogg",
"jackal/dth/dth9.ogg",
"jackal/dth/dth10.ogg",
"jackal/dth/dth11.ogg",
"jackal/dth/dth12.ogg",
"jackal/dth/dth13.ogg",
"jackal/dth/dth14.ogg",
"jackal/dth/dth15.ogg"
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("elite/shared/walk/walk ("..math.random(1,6)..").ogg", 80, 100, 1)
	elseif key == "Pain" then
		self:EmitSound(VJ_PICKRANDOMTABLE(self.SoundTbl_Pain))
	end
end

ENT.HasProtector=false
function ENT:CustomOnAllyDeath(argent) 
	if ((string.find(tostring(argent), "elite")) or (string.find(tostring(argent), "brute"))) and (argent:GetPos():DistToSqr(self:GetPos()) <= 700000) then
		timer.Simple(2.5, function() 
			if (!IsValid(self)) then return end
			self.HasProtector=false
			for k, v in pairs(ents.FindInSphere(self:GetPos(), 50000)) do
				if (string.find(tostring(v), "elite") or string.find(tostring(v), "brute")) and (v:IsNPC()) then
					self.HasProtector = true
				end
			end
			if (self.HasProtector==false or (math.random(0,10) < 3)) then
				self:Flee()
			end
	end)
end
end

function ENT:Flee()
	self.Behavior = VJ_BEHAVIOR_PASSIVE
	self.AnimTbl_Walk = {ACT_RUN_SCARED} -- Set the walking animations | Put multiple to let the base pick a random animation when it moves
	self.AnimTbl_Run = {ACT_RUN_SCARED} -- Set the running animations | Put multiple to let the base pick a random animation when it moves
	self.AnimTbl_MoveToCover = {ACT_RUN_SCARED}
	timer.Create("Scared"..self:GetCreationID(), math.random(1.5,3), 5, function()
		if !(IsValid(self)) then return end 
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

function ENT:CustomOnInitialKilled(dmginfo, hitgroup)
	self:SetBodygroup(1, 0)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/