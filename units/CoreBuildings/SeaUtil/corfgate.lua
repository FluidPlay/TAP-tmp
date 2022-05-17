return {
	corfgate = {
		acceleration = 0,
		activatewhenbuilt = true,
		bmcode = 0,
		brakerate = 0,
		buildangle = 2048,
		buildcostenergy = 74000,
		buildcostmetal = 4100,
		builder = 0,
		buildpic = "CORFGATE.DDS",
		buildtime = 59060,
		canattack = false,
		canrepeat = false,
		category = "ALL NOTLAND NOTSUB NOWEAPON NOTSHIP NOTAIR",
		collisionvolumeoffsets = "0 -25 0",
		collisionvolumescales = "60 70 60",
		collisionvolumetype = "cyly",
		corpse = "DEAD",
		description = "Floating Plasma Deflector",
		energystorage = 2000,
		energyuse = 0,
		explodeas = "largeBuildingexplosiongeneric",
		footprintx = 4,
		footprintz = 4,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 3700,
		maxslope = 10,
		maxvelocity = 0,
		metalstorage = 0,
		minwaterdepth = 16,
		name = "Atoll",
		noautofire = true,
		norestrict = 1,
		objectname = "corfgate",
		onoffable = false,
		seismicsignature = 0,
		selfdestructas = "largeBuildingExplosionGenericSelfd",
		sightdistance = 600,
		turninplaceanglelimit = 140,
		turninplacespeedlimit = 0,
		turnrate = 0,
		unitname = "corfgate",
		waterline = 0,
		workertime = 0,
		customparams = {
			techlevel = 2,
			removewait = true,
			removestop = true,
			shield_power = 5000,
			shield_radius = 600,
			shield_color_mult = 0.8,
		},
		featuredefs = {
			dead = {
				blocking = true,
				category = "corpses",
				collisionvolumeoffsets = "0.0 -2.91625976558e-05 -0.414924621582",
				collisionvolumescales = "57.2399902344 32.5033416748 63.3298492432",
				collisionvolumetype = "Box",
				damage = 1800,
				description = "Atoll Wreckage",
				energy = 0,
				featuredead = "HEAP",
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 20,
				hitdensity = 100,
				metal = 2296,
				object = "corfgate_DEAD",
				reclaimable = true,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
			heap = {
				blocking = false,
				category = "heaps",
				damage = 900,
				description = "Atoll Heap",
				energy = 0,
				featurereclamate = "SMUDGE01",
				footprintx = 2,
				footprintz = 2,
				height = 4,
				hitdensity = 100,
				metal = 918,
				object = "2X2D",
                collisionvolumescales = "35.0 4.0 6.0",
                collisionvolumetype = "cylY",
				reclaimable = true,
				resurrectable = 0,
				seqnamereclamate = "TREE1RECLAMATE",
				world = "All Worlds",
			},
		},
		sfxtypes = { 
 			pieceExplosionGenerators = { 
				"deathceg2",
				"deathceg3",
				"deathceg4",
			},
		},
		sounds = {
			canceldestruct = "cancel2",
			underattack = "warning1",
			cant = {
				[1] = "cantdo4",
			},
			count = {
				[1] = "count6",
				[2] = "count5",
				[3] = "count4",
				[4] = "count3",
				[5] = "count2",
				[6] = "count1",
			},
			ok = {
				[1] = "drone1",
			},
			select = {
				[1] = "drone1",
			},
		},
		weapondefs = {
			sea_repulsor = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				name = "NavalPlasmaRepulsor",
				range = 600,
				soundhitwet = "sizzle",
				soundhitwetvolume = 0.5,
				weapontype = "Shield",
				shield = {
					alpha = 0.17,
					armortype = "shields",
					energyuse = 0,
					force = 2.5,
					intercepttype = 1,
					power = 3250,
					powerregen = 52,
					powerregenenergy = 562.5,
					radius = 600,
					repulser = true,
					smart = true,
					startingpower = 1100,
					--visible = true,
					--visiblehitframes = 70,
					visibleRepulse = true,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
						[4] = 0.2,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
						[4] = 0.17,
					},
				},
				damage = {
					default = 100,
				},
			},
		},
		weapons = {
			[1] = {
				def = "SEA_REPULSOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
}