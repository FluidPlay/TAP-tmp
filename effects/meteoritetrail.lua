
return {

  ["meteoritetrail"] = {
    
    fireglow = {
      air                = true,
      class              = [[CSimpleParticleSystem]],
      count              = 1,
      ground             = true,
      water              = true,
      properties = {
		alwaysVisible = 1,
        airdrag            = 0,
        colormap           = [[0.23 0.2 0.8 0.01   0.5 0.5 0.5 0.01]],
        directional        = true,
        emitrot            = 90,
        emitrotspread      = 0,
        emitvector         = [[0.0, 1, 0.0]],
        gravity            = [[0.0, 0.0, 0.0]],
        numparticles       = 1,
        particlelife       = 2,
        particlelifespread = 0,
        particlesize       = 120, --200,
        particlesizespread = 90, --45,
        particlespeed      = 0,
        particlespeedspread = 0,
        pos                = [[0.0, 0, 0.0]],
        sizegrowth         = -0.2,
        sizemod            = 1,
        texture            = [[glow2]],
        useairlos          = true,
      },
    },
    
    smoke = {
			class = [[CSimpleParticleSystem]],
			air = 1,
			water = 1,
			ground = 1,
			count = 4,
			properties = {
				airdrag = 0.8,
				alwaysVisible = 1,
				sizeGrowth = -1, --0.07,
				sizeMod = 1.0,
				pos = [[0 0 0]],
				emitVector = [[0 0 0]],
				gravity = [[0 0 0]],
				colorMap = [[0.2 0.35 0.8 0.6  0.25 0.33 0.35 0.4  0.17 0.21 0.4 0.3	  0.057 0.065 0.5 0.125  0.037 0.04 0.2 0.22  0 0 0 0.01]],
				texture = [[smoke]],
				particleLife = 25, --45,
				particleLifeSpread = 25,
				numParticles = 3, --1
				particleSpeed = 0.5,
				particleSpeedSpread = 10, --0.9,
				particleSize = 17,
				particleSizeSpread = 8,
				emitRot = 360,
				emitRotSpread = 360,
			},
	  },
	},
}
