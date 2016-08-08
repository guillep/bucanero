scheduling
schedule: aTask
	
	^ worker schedule: [ | environment result |
		environment := environments next.
		[ result := aTask value: environment ] 
			ensure: [ environments nextPut: environment ].
		result ]