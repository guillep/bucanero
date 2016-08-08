starting
start
	
	worker ifNil: [ worker := MatraWorkerPool new
		poolSize: poolSize;
		start ].
	poolSize timesRepeat: [ worker schedule: [ environments nextPut: archetype load ] ]