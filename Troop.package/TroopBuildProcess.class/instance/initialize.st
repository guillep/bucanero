initialization
initialize
	super initialize.
	buildEnvironments := Set new.
	buildValidations := Set new.
	worker := MatraWorkerPool new
		poolSize: 10;
		start.