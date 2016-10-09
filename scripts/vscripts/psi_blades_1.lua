function CheckAngles(keys)
	local caster  = keys.caster
	local target  = keys.target
	local ability = keys.ability

	-- store the damage that was done to 'target' so that we know how much to apply for the sub-targets
	ability.first_target_damage = keys.damage  -- FIXME: this is kindof a dirty hack and might break at high attack speeds
	

	-- get some initial values
	local first_target_origin = target:GetAbsOrigin()  -- target's origin
	local attacker_angle = VectorToAngles(caster:GetAbsOrigin() - first_target_origin)  -- angle between caster and target
	

	-- find all the units around the target unit
	local units = FindUnitsInRadius(caster:GetTeamNumber(), first_target_origin, nil, ability:GetSpecialValueFor("attack_spill_range"),
		ability:GetAbilityTargetTeam(), ability:GetAbilityTargetType(), ability:GetAbilityTargetFlags(), FIND_ANY_ORDER, false)
	
	-- for each unit, check if they're in the valid arc behind the target; if they are create a projectile
	for i,unit in ipairs(units) do
		if unit ~= target then
			local unit_origin = unit:GetAbsOrigin()  -- unit origin
			local victim_angle = VectorToAngles(first_target_origin - unit_origin)  -- angle between target and units
			local angle_difference = RotationDelta(attacker_angle, victim_angle).y  -- QAngle.y is yaw (https://developer.valvesoftware.com/wiki/Qangle)
			
			-- Ensures the angle difference is less than the allowed width
			if angle_difference <= ability:GetSpecialValueFor("attack_spill_width")/2 then
			print("Creating Projectile for Unit "..i) 
				ProjectileManager:CreateTrackingProjectile{
					Target       = unit,
					Source       = target,
					Ability      = ability,
					EffectName   = keys.particle,
					bDodgeable   = false,
					iMoveSpeed   = 2000,
					--vSpawnOrigin = unit_origin,
					iSourceAttachment = DOTA_PROJECTILE_ATTACHMENT_HITLOCATION
				}
			end
		end
	end
end


function DealDamage(keys)
	local ability = keys.ability

	ApplyDamage{
		victim      = keys.target,
		attacker    = keys.caster,
		damage      = ability.first_target_damage * (ability:GetSpecialValueFor("percent_damage") or 0.65),
		damage_type = ability:GetAbilityDamageType()
	}
end