initialization
initialize

	super initialize.
	contextStack := Stack new.
	future := TKTFuture new.
	valueDeployed := false.