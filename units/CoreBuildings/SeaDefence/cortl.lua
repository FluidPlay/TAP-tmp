return {
	cortl = {
		acceleration = 0,
		activatewhenbuilt = true,
		brakerate = 0,
		buildangle = 16384,
		buildcostenergy = 1500*1.35,
		buildcostmetal = 140*1.35,
		buildpic = "CORTL.DDS",
		buildtime = 4700,
		canrepeat = false,
		category = "ALL NOTLAND WEAPON NOTSHIP NOTSUB NOTAIR SURFACE",
		corpse = "DEAD",
		description = "Offshore Torpedo Launcher",
		energymake = 0.2,
		energyuse = 0.2,
		explodeas = "mediumBuildingexplosiongeneric",
		footprintx = 3,
		footprintz = 3,
		icontype = "building",
		idleautoheal = 5,
		idletime = 1800,
		maxdamage = 1330*1.15,
		maxslope = 10,
		minwaterdepth = 12,
		name = "Urchin",
		objectname = "CORTL",
		seismicsignature = 0,
		selfdestructas = "mediumBuildingExplosionGenericSelfd",
		sightdistance = 495,
		sonardistance = 230,
		waterline = 13,
		yardmap = "wwwwwwwww",
		customparams = {
			bar_waterline = 2,
			removewait = true,
		},
		featuredefs = {
			dead = {
				blocking = false,
				category = "corpses",
				collisionvolumeoffsets = "-0.449691772461 -1.59912109332e-06 0.155464172363",
				collisionvolumescales = "30.8800354004 19.4210968018 32.1831512451",
				collisionvolumetype = "Box",
				damage = 912,
				description = "Urchin Wreckage",
				energy = 0,
				footprintx = 3,
				footprintz = 3,
				height = 4,
				hitdensity = 100,
				metal = 70,
				object = "CORTL_DEAD",
				reclaimable = true,
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
				[1] = "shcormov",
			},
			select = {
				[1] = "shcorsel",
			},
		},
		weapondefs = {
			torpedo = {
				areaofeffect = 16,
				avoidfeature = false,
				avoidfriendly = true,
				burnblow = true,
				collidefriendly = true,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.4,
				explosiongenerator = "custom:genericshellexplosion-small-uw",
				flighttime = 1.8,
				impulseboost = 0.123,
				impulsefactor = 0.123,
				model = "torpedo",
				name = "Torpedo launcher",
				noselfdamage = true,
				range = 500,
				reloadtime = 1.5,
				soundhit = "xplodep2",
				soundstart = "torpedo1",
				startvelocity = 230,
				tracks = false,
				turnrate = 2500,
				turret = true,
				waterweapon = true,
				weaponacceleration = 50,
				weapontimer = 3,
				weapontype = "TorpedoLauncher",
				weaponvelocity = 280,
				damage = {
					commanders = 280*1.25,
					default = 150*1.35*1.25,
				},
				customparams = {
					bar_model = "cortorpedo.s3o",
				}
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "HOVER NOTSHIP",
				def = "TORPEDO",
			},
		},
	},
}
