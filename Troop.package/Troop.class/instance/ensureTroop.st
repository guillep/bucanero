actions
ensureTroop
	| waits |
	waits := AtomicSharedQueue new.
	(1 to: 4) do: [ :each | | monkey sema | 
		sema := Semaphore new.
		waits nextPut: sema.	
		[monkey := TroopMonkey new
			image: archetypes anyOne load;
			troop: self;
			yourself.
		monkeyQueue nextPut: monkey.
		'Monkey ready...' logCr. 
		sema signal] fork ].
	
	[waits isEmpty]
		whileFalse: [ waits next wait ]