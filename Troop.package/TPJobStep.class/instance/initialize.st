initialization
initialize

	super initialize.
	worker := TKTWorker new.
	nextSteps := Set new.
	
	inputQueue := AtomicSharedQueue new.
	outputQueue := AtomicSharedQueue new.