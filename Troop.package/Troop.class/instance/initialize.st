initialize-release
initialize

	super initialize.
	archetypes := Set new.
	tasks := AtomicSharedQueue new.
	monkeyQueue := AtomicSharedQueue new.