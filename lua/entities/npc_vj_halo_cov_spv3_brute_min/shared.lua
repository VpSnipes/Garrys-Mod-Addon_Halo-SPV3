ENT.Base 			= "npc_vj_human_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Brute Minor"
ENT.Author 			= "Mayhem"
ENT.Contact 		= "http://vrejgaming.webs.com/"
ENT.Purpose 		= "Let it eat you."
ENT.Instructions	= "Click on it to spawn it."
ENT.Category		= "Halo CE SPV3"

if (CLIENT) then
local Name = "Brute Minor"
local LangName = "npc_vj_halo_cov_spv3_brute_min"
language.Add(LangName, Name)
killicon.Add(LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
language.Add("#"..LangName, Name)
killicon.Add("#"..LangName,"HUD/killicons/default",Color ( 255, 80, 0, 255 ) )
end