function MagicLamp( event )
	local caster = event.caster
	local attacker = event.attacker

	local ability = event.ability

	local heal = ability:GetSpecialValueFor("heal")
	local health_threshold = ability:GetSpecialValueFor("health_threshold")

	local health_percent = caster:GetHealthPercent()

	local damage = event.attack_damage

	local pos = caster:GetAbsOrigin()

	if health_percent <= health_threshold then
		local particle = ParticleManager:CreateParticle("particles/items5_fx/magic_lamp.vpcf", PATTACH_CENTER_FOLLOW, caster)

		caster:Heal(damage + heal, ability)
		caster:EmitSound("DOTA_Item.MagicLamp.Cast")

		caster:Purge(false, true, false, true, false)
	end
end
