--all we care about is how high the commander is when the COM_BLAST happens
--this is much simper than checking if the com has just been unloaded from a trans or not, with essentially the same gameplay; coms don't levitate/bounce much
--if the com is more than 10 off the ground, the comblast damage is reduced. consequence is that COM_BLAST should not be used for anything else 

function gadget:GetInfo()
  return {
    name      = "unit_combomb_full_damage",
    desc      = "Flying Combombs Do Less Damage",
    author    = "TheFatController, Bluestone",
    date      = "Dec 2012",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end


if (not gadgetHandler:IsSyncedCode()) then
	return false
end

local COM_BLAST = WeaponDefNames['commander_blast'].id
local COM_BLAST2 = WeaponDefNames['commander_blast2'].id

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, weaponDefID, projectileID, attackerID, attackerDefID, attackerTeam) --we use UnitPreDamaged so as we get in before unit_transportfix has its effect

	--Spring.Echo("UnitPreDamaged called with unitID " .. unitID .. " and attackerID ", attackerID)

	if (weaponDefID == COM_BLAST or weaponDefID == COM_BLAST2) and Spring.ValidUnitID(attackerID) then -- we control the damage inflicted on units by the COM_BLAST. Very rarely an invalid attackerID is returned with weaponID=COM_BLAST, I have no idea why/how.
		--Spring.Echo("weapon is comblast from unloaded com " .. attackerID)
		local x,y,z = Spring.GetUnitBasePosition(attackerID)
		local h = Spring.GetGroundHeight(x,z)
		--Spring.Echo(x .. " " .. y .. " " .. z .. " " .. h)
		if ((y-h) > 10) then
			local _,hp = Spring.GetUnitHealth(unitID)
			local newdamage = math.min(damage,math.max(hp*0.6,400)) 
			--Spring.Echo("new damage is " .. newdamage .. ", old damage is " .. damage .. ", hp is " .. hp)
			return newdamage,0
		end		
	end
	return damage, 1	--newdamage, impulsemult
end


