AddCSLuaFile("shared.lua")
include('shared.lua')
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.HullType = HULL_MEDIUM
	-- ====Variant Variables==== --
ENT.Model = {"models/hce/spv3/flood/elite/floodelite.mdl"} -- The game will pick a random model from the table when the SNPC is spawned | Add as many as you want
ENT.modelColor = Color(67,79,127)
ENT.Skin = 1
ENT.StartHealth = 44
ENT.ShieldHealth = 100
ENT.CurrentHealth = ENT.StartHealth
ENT.ShieldCurrentHealth = ENT.ShieldHealth
ENT.EntitiesToNoCollide = {"npc_vj_halo_flood_spv3_infection"}
	-- ====== Blood-Related Variables ====== --
ENT.Bleeds = true -- Does the SNPC bleed? (Blood decal, particle, etc.)
ENT.BloodColor = "Yellow" -- The blood type, this will determine what it should use (decal, particle, etc.)
	-- Types: "Red" || "Yellow" || "Green" || "Orange" || "Blue" || "Purple" || "White" || "Oil"
-- Use the following variables to customize the blood the way you want it:
ENT.HasBloodParticle = true -- Does it spawn a particle when damaged?
ENT.Immune_Dissolve = true -- Immune to Dissolving | Example: Combine Ball
ENT.Immune_AcidPoisonRadiation = true -- Immune to Acid, Poison and Radiation
ENT.HasBloodPool = false -- Does it have a blood pool?

	-- Relationships ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_PARASITE"} -- NPCs with the same class with be allied to each other
ENT.HasDeathAnimation = true -- Does it play an animation when it dies?
ENT.AnimTbl_Death = {"Die_1", "Die_2", "Die_3", "Die_4"} -- Death Animations
	-- Melee Attack ---------------------------------------------------------------------------------------------------------------------------------------------
ENT.HasMeleeAttack = true -- Should the SNPC have a melee attack?
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamage = 40
ENT.AnimTbl_MeleeAttack = {"Melee_1", "Melee_2"}
ENT.TimeUntilMeleeAttackDamage = 0.5
ENT.NextAnyAttackTime_Melee = 1.2
ENT.MeleeAttackReps = 1 -- How many times does it run the melee attack code?
ENT.StopMeleeAttackAfterFirstHit = true -- Should it stop the melee attack from running rest of timers when it hits an enemy?
ENT.MeleeAttackDamageType = DMG_CLUB
ENT.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
ENT.MeleeAttackDamageDistance = 90

ENT.DropWeaponOnDeath = true -- Should it drop its weapon on death?
ENT.HasItemDropsOnDeath = true -- Should it drop items on death?
ENT.ItemDropsOnDeathChance = 3 -- If set to 1, it will always drop it
ENT.ThingsToDrop = {}
ENT.GrenadeWeps = {
	"weapon_vj_cov_spv3_needler_nade",
	"weapon_vj_cov_spv3_plasma_nade",
	"weapon_vj_cov_spv3_gravity_nade",
	"weapon_vj_cov_spv3_cluster_nade",
}
ENT.HasLeapAttack = true -- Should the SNPC have a leap attack?
ENT.LeapDistance = 1000 -- The distance of the leap, for example if it is set to 500, when the SNPC is 500 Unit away, it will jump
ENT.LeapAttackVelocityForward = 200 -- How much forward force should it apply?
ENT.LeapAttackVelocityUp = 500 -- How much upward force should it apply?
ENT.LeapToMeleeDistance = 600 -- How close does it have to be until it uses melee?
ENT.canFlinch = 0
ENT.NextLeapAttackTime = 2.5 -- How much time until it can use a leap attack?
	-- ====== Sound File Paths ====== --
-- Leave blank if you don't want any sounds to play
ENT.SoundTbl_Idle = {
"infested_shared/pstcmbt/idle1.wav",
"infested_shared/pstcmbt/idle2.wav",
"infested_shared/pstcmbt/idle3.wav",
"infested_shared/pstcmbt/idle4.wav",
"infested_shared/pstcmbt/idle5.wav",
"infested_shared/pstcmbt/idle6.wav",
"infested_shared/pstcmbt/idle7.wav",
"infested_shared/pstcmbt/idle8.wav",
"infested_shared/pstcmbt/idle9.wav",
"infested_shared/pstcmbt/idle10.wav",
"infested_shared/pstcmbt/idle11.wav",
"infested_shared/pstcmbt/idle12.wav",
"infested_shared/pstcmbt/idle13.wav",
"infested_shared/pstcmbt/idle14.wav",
"infested_shared/pstcmbt/idle15.wav",
"infested_shared/pstcmbt/idle16.wav",
"infested_shared/pstcmbt/idle17.wav"
}

ENT.SoundTbl_Pain = {
"infested_shared/pain/pain1.wav",
"infested_shared/pain/pain2.wav",
"infested_shared/pain/pain3.wav",
"infested_shared/pain/pain4.wav",
"infested_shared/pain/pain5.wav",
"infested_shared/pain/pain6.wav",
"infested_shared/pain/pain7.wav",
"infested_shared/pain/pain8.wav",
"infested_shared/pain/pain9.wav",
"infested_shared/pain/pain10.wav",
"infested_shared/pain/pain11.wav",
"infested_shared/pain/pain12.wav",
"infested_shared/pain/pain13.wav",
"infested_shared/pain/pain14.wav",
"infested_shared/pain/pain15.wav",
"infested_shared/pain/pain16.wav",
"infested_shared/pain/pain17.wav",
"infested_shared/pain/pain18.wav"
}

ENT.SoundTbl_Impact = {
"infested_shared/hit/floodflesh_hit_small1.wav",
"infested_shared/hit/floodflesh_hit_small2.wav",
"infested_shared/hit/floodflesh_hit_small3.wav",
"infested_shared/hit/floodflesh_hit_small4.wav",
"infested_shared/hit/floodflesh_hit_small5.wav",
"infested_shared/hit/floodflesh_hit_small6.wav",
"infested_shared/hit/floodflesh_hit_small7.wav",
"infested_shared/hit/floodflesh_hit_small8.wav",
"infested_shared/hit/floodflesh_hit_small9.wav",
"infested_shared/hit/floodflesh_hit_small10.wav",
"infested_shared/hit/floodflesh_hit_small11.wav"
}
ENT.WeaponSpread = 0
ENT.Weapon_ShotsSinceLastReload = 0
ENT.WeaponTable = {
	"weapon_vj_unsc_spv3_ar",
	"weapon_vj_unsc_spv3_br",
	"weapon_vj_unsc_spv3_dmr",
	"weapon_vj_unsc_spv3_sr",
	"weapon_vj_unsc_spv3_sg",
	"weapon_vj_unsc_spv3_magnum",
	"weapon_vj_unsc_spv3_rl",
	"weapon_vj_unsc_spv3_smg",
	"weapon_vj_unsc_spv3_smgsd",
	"weapon_vj_cov_spv3_plasmaPistolBrute",
	"weapon_vj_cov_spv3_plasmaRifleBrute",
	"weapon_vj_cov_spv3_bruteshot",
	"weapon_vj_cov_spv3_focusrifle",
	"weapon_vj_cov_spv3_needler",
	"weapon_vj_cov_spv3_particleCarbine",
	"weapon_vj_cov_spv3_piercer",
	"weapon_vj_cov_spv3_plasmapistol",
	"weapon_vj_cov_spv3_plasmarifle",
	"weapon_vj_cov_spv3_shredder",
}
ENT.bodyParts = {
	Head = {Health = 5, Bodygroup = "Head", Removed = false},
	Right_Arm = {Health = 15, Bodygroup = "Right Arm", Removed = false},
	Left_Arm = {Health = 15, Bodygroup = "Left Arm", Removed = false},
	Inf_Form = {Health = 5, Bodygroup = "Inf Form", Removed = false},
}
ENT.bodyGroupTable = {0, 0, 0, 0, 0}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.SpawnedFromInf=false
function ENT:CustomOnInitialize()
	self:SetSkin(self.Skin)
	timer.Simple(0.01, function() 
		if (GetConVarNumber("vj_spv3_floodWeps")==1 and math.random(0,1)==1) then
			self:Give(VJ_PICKRANDOMTABLE(self.WeaponTable))
		end
	end)
	self:SetColor(self.modelColor)
	for i=0, #self.bodyGroupTable-1 do
		self:SetBodygroup(i, self.bodyGroupTable[i+1])
	end
	self.MeleeAttackDamage = self.MeleeAttackDamage * GetConVarNumber("vj_spv3_damageModifier")
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self:SetCollisionBounds(Vector(30, 30, 80), Vector(-30, -30, 0))
	-- Shields --
	if (self.SpawnedFromInf==false) then
		self.StartHealth = self.StartHealth * GetConVarNumber("vj_spv3_HealthModifier")
		self.ShieldHealth = self.ShieldHealth * GetConVarNumber("vj_spv3_ShieldModifier")
	end
	self.ShieldCurrentHealth = self.ShieldHealth
	self.CurrentHealth = self.StartHealth
	self.ShieldActivated = true
	self:SetHealth(self.ShieldHealth + self.StartHealth)
end
---------------------------------------------------------------------------------------------------------------------------------------------
-- function ENT:MultipleMeleeAttacks()
-- local randattack_close = math.random(1,2)
-- 	self.MeleeAttackDistance = 70
-- 	if randattack_close == 1 then
-- 		self.AnimTbl_MeleeAttack = {"Melee_1"}
-- 		self.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageDistance = 90
-- 		self.NextAnyAttackTime_Melee = 1.6666666004393
-- 		self.MeleeAttackDamage = 20
-- 		self.MeleeAttackDamageType = DMG_SLASH	
		
-- 	elseif randattack_close == 2 then
-- 		self.AnimTbl_MeleeAttack = {"Melee_2"}
-- 		self.MeleeAttackAngleRadius = 70 -- What is the attack angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageAngleRadius = 70 -- What is the damage angle radius? | 100 = In front of the SNPC | 180 = All around the SNPC
-- 		self.MeleeAttackDamageDistance = 90
-- 		self.NextAnyAttackTime_Melee = 1.2000000286102
-- 		self.MeleeAttackDamage = 20
-- 		self.MeleeAttackDamageType = DMG_SLASH	
-- 	end
-- end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnAcceptInput(key,activator,caller,data)
	if key == "Step" then
		self:EmitSound("infested_shared/walk/walk"..math.random(1,6)..".wav", 70, 100, 1)
	
	elseif key == "Melee1" then
		self:EmitSound("infested_elite/stand_pistol_melee_1/stand_pistol_melee_1.wav", 70, 100, 1)
		self:EmitSound("infested_shared/melee/melee"..math.random(1,6)..".wav", 70, 100, 1)
	
	elseif key == "Melee2" then
		self:EmitSound("infested_elite/stand_pistol_melee_2/stand_pistol_melee_2.wav", 70, 100, 1)
		self:EmitSound("infested_shared/melee/melee"..math.random(1,6)..".wav", 70, 100, 1)	
		
	elseif key == "Hit" then
		self:MeleeAttackCode()
	
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnThink_AIEnabled()
	-- Shields --
	if self.ShieldActivated == true then
		self.Bleeds = false
	else
		self.Bleeds = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.ShieldDelay = 6
function ENT:CustomOnTakeDamage_BeforeDamage(dmginfo,hitgroup)
	if (dmginfo:GetDamageType()==DMG_BLAST) then
		dmginfo:ScaleDamage(3.5)
	end
	if (dmginfo:GetAttacker():IsNPC()) then
		dmginfo:ScaleDamage(GetConVarNumber("vj_spv3_NPCTakeDamageModifier"))
	end
	if self.ShieldActivated == true then
		self.Bleeds=false
		ParticleEffect("hcea_shield_impact", dmginfo:GetDamagePosition(), dmginfo:GetDamageForce():Angle(), self)
		self.ShieldCurrentHealth = (self.ShieldCurrentHealth - dmginfo:GetDamage())
	else
		self.CurrentHealth = self.CurrentHealth - dmginfo:GetDamage()
	end
	if (self.ShieldCurrentHealth <= 0) then
		if (hitgroup==502 and self.bodyParts["Right_Arm"]["Removed"]==false) then
			self.bodyParts["Right_Arm"]["Health"] = self.bodyParts["Right_Arm"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Right_Arm"]["Health"] <= 0) then
				self.bodyParts["Right_Arm"]["Removed"]=true
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Right_Arm"]["Bodygroup"]), 3)
				if (IsValid(self:GetActiveWeapon())) then
					local wep = ents.Create(self:GetActiveWeapon():GetClass())
					wep:SetPos(self:GetActiveWeapon():GetPos())
					wep:SetAngles(self:GetActiveWeapon():GetAngles())
					wep:Spawn()
					self:GetActiveWeapon():Remove()
				end
			end
		elseif (hitgroup==503 and self.bodyParts["Left_Arm"]["Removed"]==false) then
			self.bodyParts["Left_Arm"]["Health"] = self.bodyParts["Left_Arm"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Left_Arm"]["Health"] <= 0) then
				self.bodyParts["Left_Arm"]["Removed"]=true
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Left_Arm"]["Bodygroup"]), 3)
				self.HasMeleeAttack = false
			end
		elseif (hitgroup==500 and self.bodyParts["Head"]["Removed"]==false) then
			self.bodyParts["Head"]["Health"] = self.bodyParts["Head"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Head"]["Health"] <= 0) then
				self.bodyParts["Head"]["Removed"]=true
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Head"]["Bodygroup"]), 1)
			end
		elseif (hitgroup==501 and self.bodyParts["Inf_Form"]["Removed"]==false) then
			self.bodyParts["Inf_Form"]["Health"] = self.bodyParts["Inf_Form"]["Health"] - dmginfo:GetDamage()
			if (self.bodyParts["Inf_Form"]["Health"] <= 0) then
				self.bodyParts["Inf_Form"]["Removed"]=true
				self:RemoveAllDecals()
				self:SetBodygroup(self:FindBodygroupByName(self.bodyParts["Inf_Form"]["Bodygroup"]), 1)
				self:EmitSound("infection_form/infection_pop/pop1.wav")
				ParticleEffect("hcea_flood_infected_death", self:LocalToWorld(Vector(0,0,50)), self:GetAngles() + Angle(90,0,0), nil)
				self:TakeDamage(1000)
			end
		end
	if (dmginfo:GetDamage() >= self:Health()) then
		if (dmginfo:GetDamageType()==DMG_BLAST or dmginfo:GetDamageType()==DMG_CLUB or dmginfo:GetDamageForce():Length()>=10000) then
			self:FlyingDeath(dmginfo)
		end
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

function ENT:CustomOnTakeDamage_AfterDamage(dmginfo,hitgroup)
	self:SetHealth((self.ShieldCurrentHealth + self.CurrentHealth))
	if (self.ShieldCurrentHealth<=0) then
		self:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
		self.ShieldActivated=false
		self.Bleeds=true
	end
	if (timer.Exists("ShieldDelay"..self:GetCreationID())) then
		timer.Adjust("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1)
	else
		timer.Create("ShieldDelay"..self:GetCreationID(), self.ShieldDelay, 1, function() 
			if (IsValid(self)) then
				self:StopParticles()
				self:EmitSound(Sound("ambient/energy/whiteflash.wav"),80,115)
				ParticleEffectAttach("hcea_shield_recharged",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
				self.ShieldActivated = true
				self.ShieldCurrentHealth = self.ShieldHealth
				self:SetHealth(self.CurrentHealth + self.ShieldCurrentHealth)
				self.Bleeds=false
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnTakeDamage_ShieldsDestroyed(dmginfo)
	if self.ShieldActivated == false then return end
	self:VJ_TASK_COVER_FROM_ENEMY("TASK_RUN_PATH")
	self.NextChaseTime = CurTime() + 6
	self:EmitSound(Sound("ambient/energy/weld" .. math.random(1,2) .. ".wav"),80,100)
	self:StopParticles()
	ParticleEffectAttach("hcea_shield_disperse",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	ParticleEffectAttach("hcea_shield_enabled",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("origin"))
	self.ShieldActivated = false
end

function ENT:RunItemDropsOnDeathCode(dmginfo,hitgroup)
	if self.HasItemDropsOnDeath == false then return end
	for i=1, math.random(1,4) do
		self.ThingsToDrop[i] = self.GrenadeWeps[math.random(1,5)]
	end
	if math.random(1,self.ItemDropsOnDeathChance) == 1 then
		self:CustomRareDropsOnDeathCode(dmginfo,hitgroup)
		for k,v in pairs(self.ThingsToDrop) do
			local entlist = self.ThingsToDrop[k]
			if entlist != false then
				local randdrop = ents.Create(entlist)
				randdrop:SetPos(self:GetPos() + self:OBBCenter())
				randdrop:SetAngles(self:GetAngles())
				randdrop:Spawn()
				randdrop:Activate()
				local phys = randdrop:GetPhysicsObject()
				if IsValid(phys) then
					phys:SetMass(60)
					phys:ApplyForceCenter(dmginfo:GetDamageForce()*.01)
				end
			end
		end
	end
end

function ENT:CustomOnInitialKilled(dmginfo,hitgroup) 
	if !(IsValid(self:GetActiveWeapon())) then return end
	local randdrop = ents.Create(self:GetActiveWeapon():GetClass())
	randdrop:SetPos(self:GetPos() + self:OBBCenter())
	randdrop:SetAngles(self:GetAngles())
	randdrop:Spawn()
	randdrop:Activate()
	local phys = randdrop:GetPhysicsObject()
	if IsValid(phys) then
		phys:SetMass(60)
		phys:ApplyForceCenter(dmginfo:GetDamageForce()*.01)
	end
end


ENT.WeaponSpread = 1
function ENT:WeaponAimPoseParameters(ResetPoses)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2016 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/